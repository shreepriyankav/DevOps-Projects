<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nexora | Instant Information Portal</title>
</head>
<body>

    <h1 style="color: blue; text-align: center;">
        Nexora | Instant Information Portal
    </h1>

    <h2>Welcome ${username}</h2>

    <button onclick="window.location.href='home'">Home</button>
    <button onclick="window.location.href='gallery'">Gallery</button>
    <button onclick="window.location.href='videos'">Videos</button>
    <button onclick="window.location.href='articles'">Articles</button>
    <button onclick="window.location.href='tutorials'">Tutorials</button>
    <button onclick="window.location.href='assessment'">Assessment</button>
    <button onclick="window.location.href='poll-survey'">Poll &amp; Survey</button>
    <button onclick="window.location.href='chat'">Chat</button>

</body>
</html>