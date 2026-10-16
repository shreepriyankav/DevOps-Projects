<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nexora | Videos</title>

<style>
:root {
    --navy: #10284f;
    --blue: #2563eb;
    --blue-light: #eaf1ff;
    --text: #172e55;
    --muted: #7183a3;
    --border: #e1e9f5;
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
}

a {
    text-decoration: none;
    color: inherit;
}

.sidebar {
    position: fixed;
    inset: 0 auto 0 0;
    width: 250px;
    background: linear-gradient(180deg, #10284f, #0b1e3d);
    color: #e8efff;
    padding: 25px 17px;
    overflow-y: auto;
    z-index: 10;
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
    font-size: 25px;
    font-weight: 800;
    flex-shrink: 0;
}

.brand-name {
    font-size: 23px;
    font-weight: 750;
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

.nav:hover,
.nav.active {
    background: linear-gradient(100deg, #2676f5, #1556d8);
    color: white;
}

.main {
    margin-left: 250px;
    padding: 30px 38px;
    min-height: 100vh;
}

.topbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    margin-bottom: 30px;
}

.eyebrow {
    color: var(--muted);
    font-size: 12px;
    margin-bottom: 6px;
}

h1 {
    font-size: 28px;
    letter-spacing: -.5px;
}

.profile {
    background: white;
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 11px 16px;
    font-size: 13px;
    font-weight: 600;
}

.hero {
    background: linear-gradient(115deg, #10284f, #2563eb);
    color: white;
    border-radius: 20px;
    padding: 32px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    margin-bottom: 30px;
}

.hero h2 {
    font-size: 26px;
    margin-bottom: 10px;
}

.hero p {
    color: #dce8ff;
    line-height: 1.6;
    max-width: 600px;
    font-size: 14px;
}

.hero-icon {
    font-size: 58px;
}

.section-title {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    margin-bottom: 17px;
}

.section-title h2 {
    font-size: 19px;
}

.search {
    width: min(300px, 100%);
    padding: 12px 15px;
    border: 1px solid var(--border);
    border-radius: 10px;
    background: white;
    font-size: 13px;
    outline-color: var(--blue);
}

.cards {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 20px;
}

.card {
    background: white;
    border: 1px solid var(--border);
    border-radius: 15px;
    overflow: hidden;
    transition: transform .2s, box-shadow .2s;
}

.card:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 25px rgba(25,61,112,.09);
}

/* Individual video thumbnails */
.thumbnail {
    height: 175px;
    position: relative;
    overflow: hidden;
    background: linear-gradient(135deg, #dce8ff, #eff4ff);
}

.thumbnail img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform .35s ease;
}

.card:hover .thumbnail img {
    transform: scale(1.05);
}

.play {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 54px;
    height: 54px;
    display: grid;
    place-items: center;
    border-radius: 50%;
    background: rgba(255,255,255,.95);
    color: var(--blue);
    box-shadow: 0 5px 18px rgba(16,40,79,.2);
    font-size: 20px;
    padding-left: 3px;
}

.card-body {
    padding: 19px;
}

.tag {
    display: inline-block;
    background: var(--blue-light);
    color: var(--blue);
    padding: 6px 9px;
    border-radius: 6px;
    font-size: 10px;
    font-weight: 700;
    margin-bottom: 12px;
}

.card h3 {
    font-size: 15px;
    margin-bottom: 8px;
}

.card p {
    color: var(--muted);
    font-size: 12px;
    line-height: 1.6;
}

.duration {
    color: var(--muted);
    font-size: 11px;
    margin-top: 14px;
}

.back {
    display: inline-block;
    margin-top: 28px;
    color: var(--blue);
    font-size: 13px;
    font-weight: 650;
}

footer {
    margin-top: 45px;
    padding-top: 20px;
    border-top: 1px solid var(--border);
    color: var(--muted);
    font-size: 11px;
}

@media (max-width: 1000px) {
    .cards {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .main {
        padding: 25px;
    }
}

@media (max-width: 700px) {
    .sidebar {
        position: static;
        width: 100%;
        padding: 16px;
    }

    .brand {
        padding-bottom: 12px;
    }

    .menu-label {
        margin-top: 15px;
    }

    .sidebar nav {
        display: flex;
        overflow-x: auto;
        padding-top: 12px;
    }

    .nav {
        flex-shrink: 0;
        margin: 0 3px;
    }

    .main {
        margin-left: 0;
        padding: 20px 16px;
    }

    .cards {
        grid-template-columns: 1fr;
    }

    .topbar,
    .section-title {
        align-items: flex-start;
        flex-direction: column;
    }

    .hero {
        padding: 24px;
    }

    .hero-icon {
        display: none;
    }
}
</style>
</head>

<body>

<aside class="sidebar">
    <div class="brand">
        <div class="logo">N</div>
        <div>
            <div class="brand-name">Nexora</div>
            <div class="brand-sub">KNOWLEDGE PORTAL</div>
        </div>
    </div>

    <div class="menu-label">WORKSPACE</div>

    <nav aria-label="Main navigation">
        <a class="nav" href="home"><span>▦</span>Dashboard</a>
        <a class="nav" href="gallery"><span>▧</span>Gallery</a>
        <a class="nav active" href="videos" aria-current="page"><span>▶</span>Videos</a>
        <a class="nav" href="articles"><span>▤</span>Articles</a>
        <a class="nav" href="tutorials"><span>◉</span>Tutorials</a>
        <a class="nav" href="assessment"><span>✓</span>Assessment</a>
        <a class="nav" href="poll-survey"><span>☷</span>Poll &amp; Survey</a>
        <a class="nav" href="chat"><span>✉</span>Chat</a>
    </nav>
</aside>

<main class="main">

    <header class="topbar">
        <div>
            <div class="eyebrow">Nexora / Learning Library</div>
            <h1>Videos</h1>
        </div>
        <div class="profile">▶ Video Library</div>
    </header>

    <section class="hero">
        <div>
            <h2>Learn something new today</h2>
            <p>Explore video learning resources, discover new ideas, and build your knowledge one step at a time.</p>
        </div>
        <div class="hero-icon" aria-hidden="true">▶</div>
    </section>

    <section aria-labelledby="explore-videos-title">

        <div class="section-title">
            <h2 id="explore-videos-title">Explore Videos</h2>
            <input
                class="search"
                id="videoSearch"
                type="search"
                placeholder="Search videos..."
                aria-label="Search videos"
                oninput="filterVideos()">
        </div>

        <div class="cards" id="videoCards">

            <!-- Cloud Computing -->
            <article class="card" data-search="cloud computing cloud basics">
                <div class="thumbnail">
                    <img
                        src="https://images.unsplash.com/photo-1451187580459-43490279c0fa?auto=format&fit=crop&w=900&q=80"
                        alt="Global network and cloud computing"
                        loading="lazy"
                        onerror="this.onerror=null;this.src='https://placehold.co/900x500/10284f/ffffff?text=Cloud+Computing';">
                    <div class="play" aria-hidden="true">▶</div>
                </div>
                <div class="card-body">
                    <span class="tag">CLOUD</span>
                    <h3>Introduction to Cloud Computing</h3>
                    <p>Understand cloud computing concepts and the basics of cloud services.</p>
                    <div class="duration">Beginner · Learning resource</div>
                </div>
            </article>

            <!-- DevOps -->
            <article class="card" data-search="devops ci cd automation">
                <div class="thumbnail">
                    <img
                        src="https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=900&q=80"
                        alt="Technology hardware representing DevOps automation"
                        loading="lazy"
                        onerror="this.onerror=null;this.src='https://placehold.co/900x500/173b70/ffffff?text=DevOps+CI%2FCD';">
                    <div class="play" aria-hidden="true">▶</div>
                </div>
                <div class="card-body">
                    <span class="tag">DEVOPS</span>
                    <h3>DevOps &amp; CI/CD Fundamentals</h3>
                    <p>Explore collaboration, automation, and continuous delivery workflows.</p>
                    <div class="duration">Beginner · Learning resource</div>
                </div>
            </article>

            <!-- Docker -->
            <article class="card" data-search="docker containers deployment">
                <div class="thumbnail">
                    <img
                        src="https://images.unsplash.com/photo-1605745600922-7c5c1c4f6e47?auto=format&fit=crop&w=900&q=80"
                        alt="Shipping containers representing Docker"
                        loading="lazy"
                        onerror="this.onerror=null;this.src='https://placehold.co/900x500/0866a6/ffffff?text=Docker';">
                    <div class="play" aria-hidden="true">▶</div>
                </div>
                <div class="card-body">
                    <span class="tag">DOCKER</span>
                    <h3>Getting Started with Docker</h3>
                    <p>Learn how container images and containers help package applications.</p>
                    <div class="duration">Beginner · Learning resource</div>
                </div>
            </article>

            <!-- Kubernetes -->
            <article class="card" data-search="kubernetes orchestration containers">
                <div class="thumbnail">
                    <img
                        src="https://images.unsplash.com/photo-1558494949-ef010cbdcc31?auto=format&fit=crop&w=900&q=80"
                        alt="Server infrastructure representing Kubernetes"
                        loading="lazy"
                        onerror="this.onerror=null;this.src='https://placehold.co/900x500/2455a4/ffffff?text=Kubernetes';">
                    <div class="play" aria-hidden="true">▶</div>
                </div>
                <div class="card-body">
                    <span class="tag">KUBERNETES</span>
                    <h3>Kubernetes Essentials</h3>
                    <p>Discover the basics of deploying and managing containerized applications.</p>
                    <div class="duration">Beginner · Learning resource</div>
                </div>
            </article>

            <!-- Linux -->
            <article class="card" data-search="linux command line server">
                <div class="thumbnail">
                    <img
                        src="https://images.unsplash.com/photo-1510511459019-5dda7724fd87?auto=format&fit=crop&w=900&q=80"
                        alt="Laptop workstation for Linux command line learning"
                        loading="lazy"
                        onerror="this.onerror=null;this.src='https://placehold.co/900x500/263238/ffffff?text=Linux';">
                    <div class="play" aria-hidden="true">▶</div>
                </div>
                <div class="card-body">
                    <span class="tag">LINUX</span>
                    <h3>Linux Command Line Basics</h3>
                    <p>Practice essential terminal commands used in everyday server tasks.</p>
                    <div class="duration">Beginner · Learning resource</div>
                </div>
            </article>

            <!-- AWS -->
            <article class="card" data-search="aws cloud services">
                <div class="thumbnail">
                    <img
                        src="https://images.unsplash.com/photo-1520869562399-e772f042f246?auto=format&fit=crop&w=900&q=80"
                        alt="Cloud infrastructure representing AWS services"
                        loading="lazy"
                        onerror="this.onerror=null;this.src='https://placehold.co/900x500/ff9900/10284f?text=AWS+Cloud';">
                    <div class="play" aria-hidden="true">▶</div>
                </div>
                <div class="card-body">
                    <span class="tag">AWS</span>
                    <h3>Introduction to AWS Services</h3>
                    <p>Get familiar with core AWS services and common cloud use cases.</p>
                    <div class="duration">Beginner · Learning resource</div>
                </div>
            </article>

        </div>

        <p id="noResults" style="display:none; color:#7183a3; margin-top:20px;">
            No matching videos found.
        </p>

    </section>

    <a class="back" href="home">← Back to Dashboard</a>

    <footer>© 2026 Nexora · Knowledge Portal</footer>

</main>

<script>
function filterVideos() {
    const query = document.getElementById('videoSearch').value.toLowerCase().trim();
    const cards = document.querySelectorAll('#videoCards .card');
    let visibleCount = 0;

    cards.forEach(function(card) {
        const content = (card.innerText + ' ' + card.dataset.search).toLowerCase();
        const match = content.includes(query);

        card.style.display = match ? '' : 'none';

        if (match) {
            visibleCount++;
        }
    });

    document.getElementById('noResults').style.display =
        visibleCount ? 'none' : 'block';
}
</script>

</body>
</html>