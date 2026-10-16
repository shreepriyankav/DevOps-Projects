
package com.dpt.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class login {

    @Value("${spring.datasource.url}")
    private String url;

    @Value("${spring.datasource.username}")
    private String dbUsername;

    @Value("${spring.datasource.password}")
    private String dbPassword;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(String userName, String password) {

        String userId = null;
        String errorMessage = "Invalid username or password.";

        if (userName == null || userName.trim().isEmpty()
                || password == null || password.isEmpty()) {
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("errorMessage", errorMessage);
            return mv;
        }

        String query =
                "SELECT * FROM Employee WHERE username = ? AND password = ?";

        try (Connection con =
                     DriverManager.getConnection(url, dbUsername, dbPassword);
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, userName.trim());
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Preserve the existing application's fourth-column user ID.
                    userId = rs.getString(4);
                }
            }

        } catch (SQLException ex) {
            // Do not expose database details to the user.
            System.err.println("Database login operation failed: "
                    + ex.getSQLState());
            errorMessage = "Unable to process login. Try again later.";
        }

        if (userId != null && !userId.isEmpty()) {
            ModelAndView mv = new ModelAndView("home");
            mv.addObject("email", userId);
            return mv;
        }

        ModelAndView mv = new ModelAndView("login");
        mv.addObject("errorMessage", errorMessage);
        return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView registerform() {
        return new ModelAndView("login");
    }
}