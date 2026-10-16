package com.dpt.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class register {

    @Value("${spring.datasource.url}")
    private String url;

    @Value("${spring.datasource.username}")
    private String DBusername;

    @Value("${spring.datasource.password}")
    private String DBpassword;

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public ModelAndView registerform() {
        return new ModelAndView("register");
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public ModelAndView register(
            String firstName,
            String lastName,
            String email,
            String userName,
            String password) {

        String sql = "INSERT INTO Employee " +
                "(first_name, last_name, email, username, password, regdate) " +
                "VALUES (?, ?, ?, ?, ?, CURDATE())";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(
                    url, DBusername, DBpassword);
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, email);
                ps.setString(4, userName);
                ps.setString(5, password);

                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {
                    return new ModelAndView("redirect:/login");
                }
            }

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();

            ModelAndView mv = new ModelAndView("register");
            mv.addObject("message",
                    "Registration failed. Please check your details and try again.");
            return mv;
        }

        ModelAndView mv = new ModelAndView("register");
        mv.addObject("message", "Registration failed. Please try again.");
        return mv;
    }
}