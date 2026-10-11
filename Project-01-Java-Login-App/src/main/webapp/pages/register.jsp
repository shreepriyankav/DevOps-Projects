<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account | Java Login App</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Arial, sans-serif;
    }

    body {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 30px 16px;
        background: linear-gradient(135deg, #edf4ff, #f8faff);
        color: #172554;
    }

    .register-container {
        width: 100%;
        max-width: 480px;
        background: #ffffff;
        padding: 38px;
        border: 1px solid #e5eaf5;
        border-radius: 18px;
        box-shadow: 0 18px 50px rgba(30, 64, 175, 0.10);
    }

    .logo {
        width: 52px;
        height: 52px;
        margin: 0 auto 18px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 14px;
        background: #2563eb;
        color: white;
        font-size: 25px;
        font-weight: 700;
    }

    h1 {
        text-align: center;
        font-size: 27px;
        margin-bottom: 9px;
        color: #172554;
    }

    .subtitle {
        text-align: center;
        color: #64748b;
        font-size: 14px;
        margin-bottom: 25px;
        line-height: 1.6;
    }

    .message {
        padding: 11px 13px;
        margin-bottom: 18px;
        border-radius: 8px;
        background: #eff6ff;
        color: #1d4ed8;
        font-size: 14px;
        overflow-wrap: anywhere;
    }

    .field {
        margin-bottom: 17px;
    }

    label {
        display: block;
        margin-bottom: 7px;
        font-size: 13px;
        font-weight: 600;
        color: #334155;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px 14px;
        border: 1px solid #cbd5e1;
        border-radius: 9px;
        font-size: 14px;
        color: #0f172a;
        outline: none;
        background: #fff;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    input:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
    }

    .button-group {
        display: flex;
        gap: 12px;
        margin-top: 23px;
    }

    button {
        flex: 1;
        padding: 13px;
        border: none;
        border-radius: 9px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s;
    }

    .submit-btn {
        background: #2563eb;
        color: #fff;
    }

    .submit-btn:hover {
        background: #1d4ed8;
    }

    .reset-btn {
        background: #eff4ff;
        color: #1d4ed8;
    }

    .reset-btn:hover {
        background: #dbeafe;
    }

    .login-link {
        margin-top: 25px;
        padding-top: 20px;
        border-top: 1px solid #e9eef7;
        text-align: center;
        font-size: 14px;
        color: #64748b;
    }

    .login-link a {
        color: #2563eb;
        text-decoration: none;
        font-weight: 600;
    }

    .login-link a:hover {
        text-decoration: underline;
    }

    @media (max-width: 480px) {
        .register-container {
            padding: 27px 22px;
        }

        h1 {
            font-size: 24px;
        }
    }
</style>
</head>

<body>
    <div class="register-container">

        <div class="logo">J</div>

        <h1>Create Account</h1>
        <p class="subtitle">
            Join us today. Fill in your details to get started.
        </p>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <form method="post" action="register">

            <div class="field">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName"
                       placeholder="Enter your first name"
                       autocomplete="given-name" required>
            </div>

            <div class="field">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName"
                       placeholder="Enter your last name"
                       autocomplete="family-name" required>
            </div>

            <div class="field">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email"
                       placeholder="you@example.com"
                       autocomplete="email" required>
            </div>

            <div class="field">
                <label for="userName">Username</label>
                <input type="text" id="userName" name="userName"
                       placeholder="Choose a username"
                       autocomplete="username" required>
            </div>

            <div class="field">
                <label for="password">Password</label>
                <input type="password" id="password" name="password"
                       placeholder="Create a password"
                       autocomplete="new-password" required>
            </div>

            <div class="button-group">
                <button type="submit" class="submit-btn">
                    Create Account
                </button>
                <button type="reset" class="reset-btn">
                    Reset
                </button>
            </div>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="login">Sign in</a>
        </div>

    </div>
</body>
</html>