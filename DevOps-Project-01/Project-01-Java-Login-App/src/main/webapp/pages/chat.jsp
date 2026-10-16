<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nexora | Chat</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f5f8fd;
            color: #172e55;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .sidebar {
            position: fixed;
            inset: 0 auto 0 0;
            width: 250px;
            padding: 25px 17px;
            background: linear-gradient(180deg, #10284f, #0b1e3d);
            color: #e8efff;
            overflow-y: auto;
        }

        .brand {
            display: block;
            padding: 0 8px 25px;
            border-bottom: 1px solid #ffffff22;
        }

        .brand strong {
            font-size: 25px;
        }

        .brand small {
            display: block;
            margin-top: 5px;
            color: #a9bbda;
            font-size: 9px;
            letter-spacing: 1px;
        }

        .label {
            margin: 27px 12px 13px;
            color: #91a7ca;
            font-size: 10px;
            letter-spacing: 1.5px;
        }

        .nav {
            display: block;
            padding: 13px 14px;
            margin-bottom: 5px;
            border-radius: 10px;
            color: #d0dcf1;
            font-size: 13px;
            transition: background 0.2s ease;
        }

        .nav:hover {
            background: #ffffff17;
        }

        .nav.active {
            background: linear-gradient(100deg, #2676f5, #1556d8);
            color: white;
        }

        .workspace {
            margin-left: 250px;
            padding: 32px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .topbar h2 {
            font-size: 24px;
        }

        .topbar span {
            color: #7183a3;
            font-size: 13px;
        }

        .hero {
            padding: 35px;
            border-radius: 16px;
            color: white;
            background: linear-gradient(110deg, #10386f, #2676e8);
        }

        .hero h1 {
            margin-bottom: 12px;
            font-size: 32px;
        }

        .hero p {
            line-height: 1.7;
            color: #e4efff;
        }

        .chat-box {
            margin-top: 25px;
            max-width: 850px;
            padding: 25px;
            background: white;
            border: 1px solid #e1e9f5;
            border-radius: 14px;
        }

        .chat-box h2 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        .chat-box p {
            color: #7183a3;
            font-size: 13px;
            line-height: 1.7;
        }

        .notice {
            margin-top: 20px;
            padding: 15px;
            border-radius: 9px;
            background: #eaf1ff;
            color: #2559a8;
            font-size: 13px;
            line-height: 1.7;
        }

        footer {
            margin-top: 35px;
            padding: 20px;
            text-align: center;
            border-top: 1px solid #e1e9f5;
            color: #8192b0;
            font-size: 12px;
        }

        @media (max-width: 720px) {
            .sidebar {
                position: static;
                width: 100%;
                padding: 20px 17px;
            }

            .workspace {
                margin-left: 0;
                padding: 20px;
            }

            .topbar {
                align-items: flex-start;
                flex-direction: column;
                flex-wrap: wrap;
            }

            .hero {
                padding: 25px;
            }

            .hero h1 {
                font-size: 26px;
            }

            .chat-box {
                padding: 20px;
            }
        }
    </style>
</head>

<body>

<aside class="sidebar">
    <a class="brand" href="home">
        <strong>Nexora</strong>
        <small>INSTANT INFORMATION SITE</small>
    </a>

    <div class="label">MAIN MENU</div>

    <nav aria-label="Main navigation">
        <a class="nav" href="home">⌂ &nbsp; Dashboard</a>
        <a class="nav" href="gallery">▧ &nbsp; Gallery</a>
        <a class="nav" href="videos">▷ &nbsp; Videos</a>
        <a class="nav" href="articles">▤ &nbsp; Articles</a>
        <a class="nav" href="tutorials">▣ &nbsp; Tutorials</a>
        <a class="nav" href="assessment">✓ &nbsp; Assessment</a>
        <a class="nav" href="poll-survey">▥ &nbsp; Poll &amp; Survey</a>
        <a class="nav active" href="chat" aria-current="page">☏ &nbsp; Chat</a>
    </nav>
</aside>

<main class="workspace">

    <header class="topbar">
        <h2>Chat &amp; Community</h2>
        <span>Connect · Discuss · Learn</span>
    </header>

    <section class="hero">
        <h1>Welcome to Nexora Chat</h1>
        <p>
            A space for sharing ideas, discussing technology,
            and learning together.
        </p>
    </section>

    <section class="chat-box">
        <h2>Community Discussions</h2>

        <p>
            Use this space as a starting point for future community
            conversations and technical discussions.
        </p>

        <div class="notice">
            Chat feature is coming soon. The chat interface and
            messaging functionality can be added in a future update.
        </div>
    </section>

    <footer>
        © 2026 Nexora · Instant Information Site · Learn | Share | Grow
    </footer>

</main>

</body>
</html>