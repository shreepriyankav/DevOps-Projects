<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nexora | Articles</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: "Segoe UI", Arial, sans-serif; background: #f5f8fd; color: #172e55; }
        a { text-decoration: none; color: inherit; }
        .sidebar { position: fixed; inset: 0 auto 0 0; width: 250px; padding: 25px 17px; background: linear-gradient(180deg,#10284f,#0b1e3d); color: #e8efff; overflow-y: auto; z-index: 10; }
        .brand { display: block; padding: 0 8px 25px; border-bottom: 1px solid #ffffff22; }
        .brand strong { font-size: 25px; }
        .brand small { display: block; margin-top: 5px; color: #a9bbda; font-size: 9px; letter-spacing: 1px; }
        .label { margin: 27px 12px 13px; color: #91a7ca; font-size: 10px; letter-spacing: 1.5px; }
        .nav { display: block; padding: 13px 14px; margin-bottom: 5px; border-radius: 10px; color: #d0dcf1; font-size: 13px; }
        .nav:hover { background: #ffffff17; }
        .nav.active { background: linear-gradient(100deg,#2676f5,#1556d8); color: white; }
        .workspace { margin-left: 250px; padding: 32px; }
        .topbar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .topbar span { color: #7183a3; font-size: 13px; }
        .hero { padding: 35px; border-radius: 16px; color: white; background: linear-gradient(110deg,#10386f,#2676e8); }
        .hero h1 { margin-bottom: 12px; font-size: 32px; }
        .hero p { line-height: 1.7; color: #e4efff; }
        .section-title { margin: 30px 0 18px; font-size: 22px; }
        .cards { display: grid; grid-template-columns: repeat(auto-fit,minmax(220px,1fr)); gap: 18px; }
        .card { padding: 23px; background: white; border: 1px solid #e1e9f5; border-radius: 13px; transition: .2s; }
        .card:hover { transform: translateY(-3px); border-color: #9dbfff; }
        .icon { font-size: 27px; margin-bottom: 16px; }
        .card h3 { margin-bottom: 9px; font-size: 17px; }
        .card p { color: #7183a3; font-size: 13px; line-height: 1.7; }
        footer { margin-top: 35px; padding: 20px; text-align: center; border-top: 1px solid #e1e9f5; color: #8192b0; font-size: 12px; }
        @media(max-width:720px) {
            .sidebar { position: static; width: 100%; }
            .workspace { margin-left: 0; padding: 20px; }
            .topbar { gap: 10px; flex-wrap: wrap; }
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
        <a class="nav active" href="articles" aria-current="page">▤ &nbsp; Articles</a>
        <a class="nav" href="tutorials">▣ &nbsp; Tutorials</a>
        <a class="nav" href="assessment">✓ &nbsp; Assessment</a>
        <a class="nav" href="poll-survey">▥ &nbsp; Poll &amp; Survey</a>
        <a class="nav" href="chat">☏ &nbsp; Chat</a>
    </nav>
</aside>

<div class="workspace">
    <header class="topbar">
        <h2>Articles</h2>
        <span>Knowledge · Ideas · Insights</span>
    </header>

    <section class="hero">
        <h1>Explore Articles</h1>
        <p>Discover useful information, technology insights, and ideas to expand your knowledge.</p>
    </section>

    <h2 class="section-title">Featured Topics</h2>
    <section class="cards">
        <article class="card">
            <div class="icon" aria-hidden="true">☁️</div>
            <h3>Cloud Computing</h3>
            <p>Explore cloud fundamentals, infrastructure, AWS services, and modern cloud solutions.</p>
        </article>
        <article class="card">
            <div class="icon" aria-hidden="true">⚙️</div>
            <h3>DevOps &amp; Automation</h3>
            <p>Learn about CI/CD pipelines, deployment automation, and DevOps practices.</p>
        </article>
        <article class="card">
            <div class="icon" aria-hidden="true">🔐</div>
            <h3>Cybersecurity</h3>
            <p>Discover security fundamentals, safe practices, and application protection.</p>
        </article>
        <article class="card">
            <div class="icon" aria-hidden="true">💻</div>
            <h3>Programming</h3>
            <p>Read about software development concepts, tools, and technical learning.</p>
        </article>
    </section>

    <footer>© 2026 Nexora · Instant Information Site · Learn | Share | Grow</footer>
</div>
</body>
</html>