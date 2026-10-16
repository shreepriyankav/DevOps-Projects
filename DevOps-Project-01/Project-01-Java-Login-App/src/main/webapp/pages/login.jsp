<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In | Java Login App</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 24px;
    background: linear-gradient(135deg, #eaf1ff, #f7f9ff, #e5edff);
    color: #172b4d;
}

.login-container {
    width: 100%;
    max-width: 950px;
    min-height: 540px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    background: #ffffff;
    border-radius: 22px;
    overflow: hidden;
    box-shadow: 0 25px 65px rgba(25, 55, 110, 0.16);
}

.brand-panel {
    background: linear-gradient(145deg, #315fce, #16377e);
    color: #ffffff;
    padding: 60px 42px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.brand-icon {
    font-size: 42px;
    margin-bottom: 22px;
}

.brand-panel h1 {
    font-size: 30px;
    margin-bottom: 12px;
    letter-spacing: -0.5px;
}

.brand-panel .tagline {
    color: #d8e4ff;
    font-size: 15px;
    margin-bottom: 36px;
}

.brand-panel .description {
    font-size: 16px;
    line-height: 1.8;
    color: #edf2ff;
    max-width: 320px;
}

.brand-footer {
    margin-top: 55px;
    font-size: 13px;
    color: #c9d8ff;
}

.form-panel {
    padding: 55px 48px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.form-panel h2 {
    font-size: 34px;
    margin-bottom: 10px;
    color: #18366f;
}

.subtitle {
    color: #73819b;
    font-size: 15px;
    margin-bottom: 32px;
}

.error-message {
    background: #fff0f0;
    color: #bd3030;
    border: 1px solid #ffd3d3;
    border-radius: 8px;
    padding: 11px 13px;
    margin-bottom: 18px;
    font-size: 14px;
    overflow-wrap: anywhere;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 9px;
    color: #344563;
}

.form-group input {
    width: 100%;
    padding: 14px 15px;
    border: 1px solid #d7deeb;
    border-radius: 9px;
    font-size: 15px;
    color: #172b4d;
    background: #fbfcff;
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s;
}

.form-group input:focus {
    border-color: #3267df;
    box-shadow: 0 0 0 3px rgba(50, 103, 223, 0.12);
    background: #ffffff;
}

.sign-in-button {
    width: 100%;
    border: none;
    border-radius: 9px;
    padding: 15px;
    background: linear-gradient(90deg, #3267df, #2856c5);
    color: #ffffff;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 5px;
    transition: transform 0.2s, box-shadow 0.2s;
}

.sign-in-button:hover {
    transform: translateY(-1px);
    box-shadow: 0 8px 18px rgba(50, 103, 223, 0.25);
}

.register-link {
    text-align: center;
    margin-top: 25px;
    color: #75829a;
    font-size: 14px;
}

.register-link a {
    color: #285bd0;
    font-weight: 600;
    text-decoration: none;
}

.register-link a:hover {
    text-decoration: underline;
}

.secure-note {
    border-top: 1px solid #edf0f6;
    margin-top: 30px;
    padding-top: 20px;
    text-align: center;
    font-size: 12px;
    color: #8792a7;
}

@media (max-width: 700px) {
    body {
        padding: 15px;
    }

    .login-container {
        grid-template-columns: 1fr;
        max-width: 430px;
    }

    .brand-panel {
        padding: 30px;
    }

    .brand-panel h1 {
        font-size: 25px;
    }

    .brand-panel .tagline {
        margin-bottom: 15px;
    }

    .brand-panel .description,
    .brand-footer {
        display: none;
    }

    .form-panel {
        padding: 35px 27px;
    }

    .form-panel h2 {
        font-size: 29px;
    }
}
</style>
</head>

<body>
<div class="login-container">

    <section class="brand-panel">
        <div class="brand-icon">&#128274;</div>
        <h1>Java Login App</h1>
        <p class="tagline">Secure &bull; Simple &bull; Reliable</p>
        <p class="description">
            Welcome back! Sign in to your account and securely
            access your application.
        </p>
        <p class="brand-footer">Powered by Java &amp; Spring Boot</p>
    </section>

    <section class="form-panel">
        <h2>Sign In</h2>
        <p class="subtitle">Enter your credentials to continue.</p>

        <% if (request.getAttribute("errorMessage") != null
                && !request.getAttribute("errorMessage").toString().isEmpty()) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form method="post" action="login">
            <div class="form-group">
                <label for="userName">Username</label>
                <input
                    type="text"
                    id="userName"
                    name="userName"
                    placeholder="Enter your username"
                    autocomplete="username"
                    required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    autocomplete="current-password"
                    required>
            </div>

            <button type="submit" class="sign-in-button">
                Sign In &rarr;
            </button>
        </form>

        <p class="register-link">
            New to the application?
            <a href="register">Create an account</a>
        </p>

        <div class="secure-note">
            &#128274; Secure Login &nbsp; | &nbsp; Java Spring Boot
        </div>
    </section>

</div>
</body>
</html>