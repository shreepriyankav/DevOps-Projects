<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nexora | Gallery</title>
    <style>
        :root {
            --navy: #10284f;
            --blue: #2563eb;
            --text: #172e55;
            --muted: #7183a3;
            --border: #e1e9f5;
            --background: #f5f8fd;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: "Segoe UI", Arial, sans-serif; background: var(--background); color: var(--text); min-height: 100vh; }
        a { text-decoration: none; color: inherit; }
        .app { min-height: 100vh; }
        .sidebar {
            position: fixed; inset: 0 auto 0 0; width: 250px;
            background: linear-gradient(180deg, #10284f, #0b1e3d); color: #e8efff;
            display: flex; flex-direction: column; padding: 25px 17px; z-index: 10;
        }
        .brand { display: flex; align-items: center; gap: 12px; padding: 0 8px 27px; border-bottom: 1px solid rgba(255,255,255,.13); }
        .logo { width: 47px; height: 47px; border-radius: 13px; display: grid; place-items: center; background: linear-gradient(135deg, #3986ff, #1455df); color: white; font-size: 28px; font-weight: 800; box-shadow: 0 7px 18px rgba(0,0,0,.15); }
        .brand-name { font-size: 23px; font-weight: 750; letter-spacing: -.7px; }
        .brand-sub { font-size: 9px; letter-spacing: 1px; color: #a9bbda; margin-top: 4px; }
        .menu-label { margin: 27px 12px 13px; color: #91a7ca; font-size: 10px; font-weight: 700; letter-spacing: 1.6px; }
        nav { display: flex; flex-direction: column; }
        .nav { display: flex; align-items: center; gap: 13px; padding: 13px 14px; border-radius: 10px; color: #d0dcf1; font-size: 13px; margin-bottom: 5px; transition: background .2s, color .2s; }
        .nav .ico { width: 22px; text-align: center; font-size: 18px; }
        .nav:hover { background: rgba(255,255,255,.09); color: white; }
        .nav.active { background: linear-gradient(100deg, #2676f5, #1556d8); color: white; box-shadow: 0 7px 16px rgba(0,0,0,.12); font-weight: 600; }
        .nav-bottom { margin-top: auto; padding-top: 16px; border-top: 1px solid rgba(255,255,255,.13); }
        .workspace { margin-left: 250px; min-height: 100vh; }
        .topbar { height: 82px; background: rgba(255,255,255,.97); border-bottom: 1px solid var(--border); display: flex; align-items: center; justify-content: space-between; gap: 24px; padding: 0 36px; }
        .breadcrumb { display: flex; align-items: center; gap: 11px; color: #8495b2; font-size: 12px; }
        .profile-area { display: flex; align-items: center; gap: 20px; }
        .profile { display: flex; align-items: center; gap: 11px; }
        .avatar { width: 39px; height: 39px; border-radius: 50%; background: #e4edff; color: #1c5cda; display: grid; place-items: center; font-weight: 750; font-size: 12px; border: 1px solid #d1e0ff; }
        .profile-name { font-size: 13px; font-weight: 650; }
        main { max-width: 1700px; margin: auto; padding: 27px 30px 0; }
        .welcome { padding: 35px 38px; border-radius: 17px; color: white; background: linear-gradient(112deg, #10386f 0%, #1555ad 62%, #76a9f5 100%); margin-bottom: 30px; box-shadow: 0 10px 25px rgba(31,82,155,.12); }
        .eyebrow { font-size: 10px; letter-spacing: 2px; color: #c3dcff; font-weight: 700; margin-bottom: 14px; }
        .welcome h1 { margin: 0 0 10px; font-size: clamp(27px, 2.5vw, 36px); }
        .welcome p { margin: 0; color: #e4edff; line-height: 1.7; font-size: 14px; }
        .section-title { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .section-title h2 { margin: 0; font-size: 23px; }
        .gallery-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(230px, 1fr)); gap: 22px; }
        .gallery-card { overflow: hidden; background: white; border: 1px solid var(--border); border-radius: 14px; box-shadow: 0 5px 18px rgba(28,48,90,.06); transition: transform .2s, box-shadow .2s; }
        .gallery-card:hover { transform: translateY(-4px); box-shadow: 0 10px 24px rgba(28,48,90,.12); }
        .placeholder { height: 160px; display: flex; align-items: center; justify-content: center; font-size: 48px; background: linear-gradient(135deg, #dce8ff, #eef3ff); }
        .gallery-info { padding: 18px; }
        .gallery-info h3 { margin: 0 0 8px; font-size: 16px; }
        .gallery-info p { margin: 0; color: var(--muted); font-size: 14px; line-height: 1.6; }
        footer { text-align: center; padding: 28px; color: #7c879b; font-size: 12px; margin-top: 18px; border-top: 1px solid var(--border); }
        @media (max-width: 1100px) { .sidebar { width: 215px; } .workspace { margin-left: 215px; } .topbar { padding: 0 22px; } main { padding: 24px 22px 0; } }
        @media (max-width: 720px) {
            .sidebar { position: static; width: 100%; padding: 13px; }
            .brand { padding-bottom: 13px; }
            .menu-label, .nav-bottom { display: none; }
            .sidebar nav { flex-direction: row; overflow-x: auto; padding-top: 12px; }
            .nav { flex-shrink: 0; margin: 0 3px; padding: 10px; }
            .nav .ico { width: auto; }
            .workspace { margin-left: 0; }
            .topbar { height: auto; min-height: 68px; padding: 13px 16px; }
            .profile-name { display: none; }
            main { padding: 20px 15px 0; }
            .welcome { padding: 27px 23px; }
            .welcome h1 { font-size: 27px; }
            .section-title h2 { font-size: 20px; }
            .gallery-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
<div class="app">
    <aside class="sidebar">
        <a class="brand" href="home">
            <div class="logo">N</div>
            <div>
                <div class="brand-name">Nexora</div>
                <div class="brand-sub">INSTANT INFORMATION SITE</div>
            </div>
        </a>
        <div class="menu-label">MAIN MENU</div>
        <nav>
            <a class="nav" href="home"><span class="ico">⌂</span>Dashboard</a>
            <a class="nav active" href="gallery"><span class="ico">▧</span>Gallery</a>
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
            <div class="breadcrumb"><a href="home">⌂ Home</a><span>/</span><strong>Gallery</strong></div>
            <div class="profile-area">
                <div class="profile"><div class="avatar">SP</div><span class="profile-name">Priyanka&nbsp;⌄</span></div>
            </div>
        </header>

        <main>
            <section class="welcome">
                <div class="eyebrow">EXPLORE AND DISCOVER</div>
                <h1>Gallery</h1>
                <p>Explore images, events and visual collections in one place.</p>
            </section>

            <section>
                <div class="section-title"><h2>Image Collections</h2></div>
                <div class="gallery-grid">
                    <article class="gallery-card">
                        <div class="placeholder">🖼️</div>
                        <div class="gallery-info"><h3>Company Events</h3><p>Moments and highlights from events.</p></div>
                    </article>
                    <article class="gallery-card">
                        <div class="placeholder">🌟</div>
                        <div class="gallery-info"><h3>Team Highlights</h3><p>Celebrating our people and teamwork.</p></div>
                    </article>
                    <article class="gallery-card">
                        <div class="placeholder">💡</div>
                        <div class="gallery-info"><h3>Learning &amp; Innovation</h3><p>Ideas, learning sessions and innovation.</p></div>
                    </article>
                    <article class="gallery-card">
                        <div class="placeholder">🏆</div>
                        <div class="gallery-info"><h3>Achievements</h3><p>Milestones and accomplishments.</p></div>
                    </article>
                </div>
            </section>
            <footer>© 2026 Nexora · Information Portal · Learn | Share | Grow</footer>
        </main>
    </div>
</div>
</body>
</html>