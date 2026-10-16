<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String userEmail = request.getParameter("email");

    if (userEmail == null || userEmail.trim().isEmpty()) {
        userEmail = (String) request.getAttribute("email");
    }

    if (userEmail == null || userEmail.trim().isEmpty()) {
        userEmail = "Priyanka";
    }

    userEmail = org.springframework.web.util.HtmlUtils.htmlEscape(userEmail);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nexora | Knowledge Dashboard</title>

<style>
:root {
    --navy: #10284f;
    --navy-light: #193d70;
    --blue: #2563eb;
    --blue-light: #eaf1ff;
    --text: #172e55;
    --muted: #7183a3;
    --border: #e1e9f5;
    --surface: #ffffff;
    --background: #f5f8fd;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: var(--background);
    color: var(--text);
    min-height: 100vh;
}

a {
    text-decoration: none;
    color: inherit;
}

.app {
    min-height: 100vh;
}

.sidebar {
    position: fixed;
    inset: 0 auto 0 0;
    width: 250px;
    background: linear-gradient(180deg, #10284f, #0b1e3d);
    color: #e8efff;
    display: flex;
    flex-direction: column;
    padding: 25px 17px;
    z-index: 10;
    overflow-y: auto;
}

.brand {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0 8px 27px;
    border-bottom: 1px solid rgba(255,255,255,.13);
}

.logo {
    width: 47px;
    height: 47px;
    border-radius: 13px;
    display: grid;
    place-items: center;
    background: linear-gradient(135deg, #3986ff, #1455df);
    color: white;
    font-size: 28px;
    font-weight: 800;
    box-shadow: 0 7px 18px rgba(0,0,0,.15);
}

.brand-name {
    font-size: 23px;
    font-weight: 750;
    letter-spacing: -.7px;
}

.brand-sub {
    font-size: 9px;
    letter-spacing: 1px;
    color: #a9bbda;
    margin-top: 4px;
}

.menu-label {
    margin: 27px 12px 13px;
    color: #91a7ca;
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 1.6px;
}

.sidebar nav {
    display: flex;
    flex-direction: column;
}

.nav {
    display: flex;
    align-items: center;
    gap: 13px;
    padding: 13px 14px;
    border-radius: 10px;
    color: #d0dcf1;
    font-size: 13px;
    margin-bottom: 5px;
    transition: background .2s, color .2s;
}

.nav .ico {
    width: 22px;
    text-align: center;
    font-size: 18px;
}

.nav:hover {
    background: rgba(255,255,255,.09);
    color: white;
}

.nav.active {
    background: linear-gradient(100deg, #2676f5, #1556d8);
    color: white;
    box-shadow: 0 7px 16px rgba(0,0,0,.12);
    font-weight: 600;
}

.nav-bottom {
    margin-top: auto;
    padding-top: 16px;
    border-top: 1px solid rgba(255,255,255,.13);
}

.workspace {
    margin-left: 250px;
    min-height: 100vh;
}

.topbar {
    min-height: 82px;
    background: rgba(255,255,255,.97);
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    padding: 15px 36px;
}

.search {
    display: flex;
    align-items: center;
    gap: 12px;
    width: min(650px, 65%);
    border: 1px solid #dce6f6;
    background: #f8faff;
    border-radius: 28px;
    padding: 12px 17px;
    color: #7183a3;
}

.search span {
    font-size: 19px;
}

.search input {
    width: 100%;
    min-width: 0;
    border: 0;
    outline: 0;
    background: transparent;
    color: var(--text);
    font-size: 13px;
}

.profile-area {
    display: flex;
    align-items: center;
    gap: 20px;
}

.bell {
    font-size: 21px;
    color: #49648e;
    position: relative;
}

.bell:after {
    content: "";
    position: absolute;
    right: 0;
    top: 1px;
    width: 7px;
    height: 7px;
    background: #ef4444;
    border: 2px solid white;
    border-radius: 50%;
}

.profile {
    display: flex;
    align-items: center;
    gap: 11px;
}

.avatar {
    width: 39px;
    height: 39px;
    border-radius: 50%;
    background: #e4edff;
    color: #1c5cda;
    display: grid;
    place-items: center;
    font-weight: 750;
    font-size: 12px;
    border: 1px solid #d1e0ff;
}

.profile-name {
    font-size: 13px;
    font-weight: 650;
}

.main {
    max-width: 1700px;
    margin: auto;
    padding: 27px 30px 0;
}

.breadcrumb {
    display: flex;
    align-items: center;
    gap: 11px;
    color: #8495b2;
    font-size: 12px;
    margin: 0 0 22px 2px;
}

.breadcrumb strong {
    color: #3d5680;
    font-weight: 600;
}

.hero {
    position: relative;
    isolation: isolate;
    overflow: hidden;
    min-height: 240px;
    border-radius: 17px;
    padding: 35px 38px;
    color: white;
    background: linear-gradient(112deg, #10386f 0%, #1555ad 62%, #76a9f5 100%);
    box-shadow: 0 10px 25px rgba(31,82,155,.12);
}

.hero:before,
.hero:after {
    content: "";
    position: absolute;
    z-index: -1;
    border: 1px solid rgba(255,255,255,.12);
    border-radius: 50%;
    pointer-events: none;
}

.hero:before {
    width: 290px;
    height: 290px;
    right: 7%;
    top: -165px;
}

.hero:after {
    width: 220px;
    height: 220px;
    right: 1%;
    bottom: -170px;
}

.hero-content {
    max-width: 680px;
    position: relative;
    z-index: 1;
}

.eyebrow {
    font-size: 10px;
    letter-spacing: 2px;
    color: #c3dcff;
    font-weight: 700;
    margin-bottom: 17px;
}

.hero h1 {
    font-size: clamp(27px, 2.5vw, 37px);
    letter-spacing: -.8px;
    margin-bottom: 13px;
}

.hero p {
    font-size: 14px;
    line-height: 1.8;
    color: #e4efff;
}

.hero .welcome-subtitle {
    font-size: 15px;
    font-weight: 600;
    margin-bottom: 5px;
    color: white;
}

.hero-button {
    display: inline-flex;
    align-items: center;
    gap: 12px;
    margin-top: 20px;
    padding: 11px 17px;
    background: white;
    color: #1556c9;
    border-radius: 8px;
    font-size: 12px;
    font-weight: 700;
    transition: transform .2s, box-shadow .2s;
}

.hero-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 16px #0c2d6550;
}

.section-head {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    gap: 15px;
    margin: 32px 0 18px;
}

.section-head h2 {
    font-size: 23px;
    letter-spacing: -.4px;
}

.section-head p {
    margin-top: 6px;
    font-size: 13px;
    color: var(--muted);
    line-height: 1.6;
}

.view-all {
    color: var(--blue);
    font-size: 12px;
    font-weight: 650;
    white-space: nowrap;
}

.cards {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 16px;
}

.card {
    position: relative;
    min-height: 155px;
    padding: 21px;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 13px;
    box-shadow: 0 3px 12px rgba(26,57,102,.025);
    transition: transform .2s, box-shadow .2s, border-color .2s;
}

.card:hover {
    transform: translateY(-3px);
    border-color: #c2d6ff;
    box-shadow: 0 12px 25px rgba(26,57,102,.08);
}

.card-top {
    display: flex;
    align-items: center;
    gap: 14px;
}

.card-icon {
    width: 51px;
    height: 51px;
    border-radius: 50%;
    display: grid;
    place-items: center;
    font-size: 23px;
    flex-shrink: 0;
}

.blue {
    background: #e7f0ff;
    color: #2774ed;
}

.red {
    background: #ffeaed;
    color: #e94f65;
}

.green {
    background: #e1f8ed;
    color: #0aab72;
}

.purple {
    background: #efe8ff;
    color: #8258e8;
}

.orange {
    background: #fff0e3;
    color: #ed812e;
}

.cyan {
    background: #ddf7fa;
    color: #0a9caf;
}

.card h3 {
    font-size: 16px;
    margin-bottom: 7px;
}

.card p {
    font-size: 12px;
    color: var(--muted);
    line-height: 1.6;
}

.card-arrow {
    margin-left: auto;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    display: grid;
    place-items: center;
    background: #f0f5ff;
    color: var(--blue);
    font-size: 17px;
    flex-shrink: 0;
}

.card-meta {
    margin-top: 19px;
    font-size: 11px;
    color: #7c8eae;
    word-spacing: 3px;
}

.chat-card {
    grid-column: 1 / -1;
    min-height: 105px;
    display: flex;
    align-items: center;
}

.chat-card .card-meta {
    margin-top: 7px;
}

.footer {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 8px;
    margin-top: 25px;
    padding: 22px 10px;
    border-top: 1px solid var(--border);
    color: #8192b0;
    font-size: 11px;
    text-align: center;
}

.footer strong {
    color: #536b91;
    font-weight: 600;
}

@media (min-width: 1500px) {
    .main {
        padding-left: 42px;
        padding-right: 42px;
    }

    .cards {
        gap: 20px;
    }

    .card {
        min-height: 165px;
        padding: 24px;
    }
}

@media (max-width: 1100px) {
    .sidebar {
        width: 215px;
    }

    .workspace {
        margin-left: 215px;
    }

    .topbar {
        padding: 15px 22px;
    }

    .main {
        padding: 24px 22px 0;
    }

    .cards {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

@media (max-width: 720px) {
    .sidebar {
        position: static;
        width: 100%;
        padding: 13px;
    }

    .brand {
        padding-bottom: 13px;
    }

    .menu-label,
    .nav-bottom {
        display: none;
    }

    .sidebar nav {
        display: flex;
        flex-direction: row;
        overflow-x: auto;
        padding-top: 12px;
    }

    .nav {
        flex-shrink: 0;
        margin: 0 3px;
        padding: 10px;
    }

    .nav .ico {
        width: auto;
    }

    .workspace {
        margin-left: 0;
    }

    .topbar {
        min-height: 72px;
        padding: 13px 16px;
        gap: 12px;
    }

    .search {
        width: 100%;
        padding: 10px 12px;
    }

    .profile-name,
    .bell {
        display: none;
    }

    .profile-area {
        gap: 10px;
    }

    .main {
        padding: 20px 15px 0;
    }

    .hero {
        padding: 27px 23px;
    }

    .hero h1 {
        font-size: 27px;
    }

    .section-head {
        align-items: flex-start;
    }

    .section-head h2 {
        font-size: 20px;
    }

    .cards {
        grid-template-columns: 1fr;
    }

    .chat-card {
        grid-column: auto;
    }
}
</style>
</head>

<body>
<div class="app">
    <aside class="sidebar">
        <a class="brand" href="home">
            <div class="logo">Q</div>
            <div>
                <div class="brand-name">Nexora</div>
                <div class="brand-sub">INSTANT INFORMATION SITE</div>
            </div>
        </a>

        <div class="menu-label">MAIN MENU</div>

        <nav>
            <a class="nav active" href="home"><span class="ico">⌂</span>Dashboard</a>
            <a class="nav" href="gallery"><span class="ico">▧</span>Gallery</a>
            <a class="nav" href="videos"><span class="ico">▷</span>Videos</a>
            <a class="nav" href="articles"><span class="ico">▤</span>Articles</a>
            <a class="nav" href="tutorials"><span class="ico">▣</span>Tutorials</a>
            <a class="nav" href="assessment"><span class="ico">✓</span>Assessment</a>
            <a class="nav" href="poll-survey"><span class="ico">▥</span>Poll &amp; Survey</a>
            <a class="nav" href="chat"><span class="ico">☏</span>Chat</a>
        </nav>

        <div class="nav-bottom">
            <a class="nav" href="login"><span class="ico">⇥</span>Logout</a>
        </div>
    </aside>

    <div class="workspace">
        <header class="topbar">
            <label class="search">
                <span>⌕</span>
                <input type="search"
                    placeholder="Search for content, topics, videos, articles..."
                    aria-label="Search content">
            </label>

            <div class="profile-area">
                <span class="bell" aria-label="Notifications">♧</span>
                <div class="profile">
                    <div class="avatar">SP</div>
                    <span class="profile-name">Priyanka&nbsp;⌄</span>
                </div>
            </div>
        </header>

        <main class="main">
            <div class="breadcrumb">⌂ <span>Home</span> / <strong>Dashboard</strong></div>

            <section class="hero">
                <div class="hero-content">
                    <div class="eyebrow">YOUR INFORMATION HUB</div>
                    <h1>Welcome back, <%= userEmail %>! 👋</h1>
                    <p class="welcome-subtitle">Your space to learn, explore, and grow.</p>
                    <p>Explore knowledge, discover new ideas, and keep learning.</p>
                    <a class="hero-button" href="#categories">Explore Content <span>→</span></a>
                </div>
            </section>

            <section id="categories">
                <div class="section-head">
                    <div>
                        <h2>Explore Categories</h2>
                        <p>Choose from a variety of content types to enhance your skills and knowledge.</p>
                    </div>
                    <a class="view-all" href="#categories">View All&nbsp; ›</a>
                </div>

                <div class="cards">
                    <a class="card" href="gallery">
                        <div class="card-top">
                            <div class="card-icon blue">▧</div>
                            <div><h3>Gallery</h3><p>Explore images and collections</p></div>
                            <span class="card-arrow">→</span>
                        </div>
                        <div class="card-meta">Visuals&nbsp; • &nbsp;Inspiration&nbsp; • &nbsp;Creativity</div>
                    </a>

                    <a class="card" href="videos">
                        <div class="card-top">
                            <div class="card-icon red">▶</div>
                            <div><h3>Videos</h3><p>Watch and discover</p></div>
                            <span class="card-arrow">→</span>
                        </div>
                        <div class="card-meta">Learning&nbsp; • &nbsp;Tutorials&nbsp; • &nbsp;Insights</div>
                    </a>

                    <a class="card" href="articles">
                        <div class="card-top">
                            <div class="card-icon green">▤</div>
                            <div><h3>Articles</h3><p>Ideas and insights</p></div>
                            <span class="card-arrow">→</span>
                        </div>
                        <div class="card-meta">Knowledge&nbsp; • &nbsp;Trends&nbsp; • &nbsp;Updates</div>
                    </a>

                    <a class="card" href="tutorials">
                        <div class="card-top">
                            <div class="card-icon purple">◇</div>
                            <div><h3>Tutorials</h3><p>Learn new skills</p></div>
                            <span class="card-arrow">→</span>
                        </div>
                        <div class="card-meta">Step by Step&nbsp; • &nbsp;Hands-on&nbsp; • &nbsp;Practice</div>
                    </a>

                    <a class="card" href="assessment">
                        <div class="card-top">
                            <div class="card-icon orange">✓</div>
                            <div><h3>Assessment</h3><p>Check your knowledge</p></div>
                            <span class="card-arrow">→</span>
                        </div>
                        <div class="card-meta">Quizzes&nbsp; • &nbsp;Tests&nbsp; • &nbsp;Progress</div>
                    </a>

                    <a class="card" href="poll-survey">
                        <div class="card-top">
                            <div class="card-icon cyan">▥</div>
                            <div><h3>Poll &amp; Survey</h3><p>Share your opinions</p></div>
                            <span class="card-arrow">→</span>
                        </div>
                        <div class="card-meta">Feedback&nbsp; • &nbsp;Community&nbsp; • &nbsp;Voice</div>
                    </a>

                    <a class="card chat-card" href="chat">
                        <div class="card-top">
                            <div class="card-icon purple">☏</div>
                            <div><h3>Chat</h3><p>Connect and participate</p></div>
                        </div>
                        <span class="card-arrow">→</span>
                    </a>
                </div>
            </section>

            <footer class="footer">
                <span>© 2026 Nexora</span>
                <span>·</span>
                <strong>Instant Information Site</strong>
                <span>·</span>
                <span>Learn&nbsp; | &nbsp;Share&nbsp; | &nbsp;Grow</span>
            </footer>
        </main>
    </div>
</div>
</body>
</html>