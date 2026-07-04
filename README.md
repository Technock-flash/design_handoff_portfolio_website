# Handoff: Nokutenda Bosha — Portfolio Website

## Overview

A personal portfolio website for **Nokutenda Bosha** — a web designer and web developer, final-year Computer Engineering student at Midlands State University, based in Harare, Zimbabwe, and available for remote freelance work.

The site presents:
- A hero introduction and value statement
- Four featured projects (Shumba Wheels, Raindrop Driving, Kingdom Power Royal Assembly, Zimmarket)
- An About section
- A Skills / Toolkit section
- A four-step Process section
- A testimonial placeholder
- A contact section and footer

Structure: **one single-scrolling home page + one detail page per project (4 detail pages).**

## About the Design Files

The files in this bundle are **design references created in HTML** — prototypes showing the intended look and behaviour of the portfolio, not production code to ship as-is. The design uses semantic HTML, a hand-written CSS file (`styles.css`), a small vanilla-JS scroll/reveal script, and a custom `<image-slot>` web component that lets the site owner drag-and-drop screenshots onto placeholder tiles (this is prototype-only tooling — not required in the production build).

The task is to **recreate these HTML designs in the target codebase's existing environment** (React, Vue, Astro, SvelteKit, Next.js, plain HTML/CSS, etc.) using its established patterns, component library, and asset pipeline. If no environment exists yet, a static-site generator such as **Astro** or **Next.js (static export)** is a strong fit for a portfolio of this shape — the site is content-heavy, mostly static, and benefits from great typography and image optimisation.

## Fidelity

**High-fidelity (hifi).** These mocks specify final typography, colours, spacing, and interactions. Recreate the UI pixel-perfectly. Real screenshots and a portrait photo have not yet been supplied — the design uses drop-zone placeholders for them. In production, replace those placeholders with optimised `<img>` tags (with `srcset` / `sizes`, `loading="lazy"`, and appropriate `alt` text).

---

## Global Layout & Chrome

### Page shell

- **Max content width**: `1440px`
- **Horizontal padding (`--pad`)**: `clamp(20px, 4vw, 56px)`
- **Vertical section padding**: `clamp(80px, 12vh, 160px) 0`
- **Background**: `#F7F4EE` (warm off-white "paper")
- **Body copy colour**: `#1A1815` (deep warm ink)
- **Base font-size**: `18px`, `line-height: 1.55`, `font-family: "Newsreader", serif`

### Sticky header

- Position: `sticky; top: 0; z-index: 40`
- Background: `color-mix(in oklab, #F7F4EE 88%, transparent)` with `backdrop-filter: saturate(140%) blur(10px)`
- Padding: `22px 0` (top/bottom), horizontal padding matches shell
- Adds `border-bottom: 1px solid #D9D3C6` once page has scrolled > 8px (class `.scrolled`)
- Left: brand mark (26px black circle "NB" + "Nokutenda Bosha" wordmark, 20px Newsreader)
- Right: nav links **Work · About · Process** in JetBrains Mono 12px uppercase (letter-spacing `0.14em`) + a pill button **"Get in touch"** (`#1A1815` bg, `#F7F4EE` text, `10px 18px`, `border-radius: 999px`; hover fills with accent `#A66B2E`)
- Nav-link hover: underline animates left→right (200ms), colour stays `#1A1815`

---

## Screens / Views

### 1) Home (`index.html`)

The single scrolling page. Sections in order:

#### 1.1 Hero
- Top row: **availability pill** (left) + meta caption "Portfolio · 2026 Edition" (right)
  - Availability pill: `padding: 8px 14px`, `border: 1px solid #D9D3C6`, `border-radius: 999px`, mono 11px uppercase, with a green pulsing dot (`#2E9A5A`, 8px, with expanding shadow-ring, 2.4s ease-in-out infinite)
- **H1 title** (max-width `20ch`):

  > *Web designer & developer crafting **thoughtful** digital products.*

  - Font: Newsreader, weight 400
  - Size: `clamp(52px, 9vw, 148px)`, letter-spacing `-0.035em`, line-height `1.02`
  - The **`&`** is italic and coloured `#A66B2E` (accent)
  - The word **"thoughtful"** is italic, colour `#3A3630`
- Lower row (2-column grid, collapses to 1 col ≤720px):
  - Left: lede paragraph — `clamp(19px, 1.4vw, 22px)`, colour `#3A3630`, max-width `44ch`
  - Right: three lines of meta (location / availability / since 2022) in JetBrains Mono 12px uppercase; the actual values (`Harare, Zimbabwe`, `remote freelance`, `2022`) render in `#1A1815`, labels in `#6B655C`

#### 1.2 Marquee strip
- Full-width horizontal auto-scrolling marquee, `padding: 22px 0`, top+bottom `1px solid #D9D3C6`
- Content: pairs of phrases separated by an accent-coloured dot `●`:
  - "Web design" · "*Front-end* development" · "Management systems" · "UI / UX" · "*Responsive* interfaces" · "PHP · Laravel · MySQL"
- Typography: Newsreader italic, `clamp(28px, 4vw, 56px)`, `#1A1815`; dots `#A66B2E`
- Animation: `@keyframes scroll` translates track `0` → `-50%` over `45s linear infinite`. Content is duplicated once inline for the seamless loop.
- `prefers-reduced-motion`: animation disabled

#### 1.3 Featured Work (id `#work`)
- Section header pattern (used throughout):
  - Grid: `1fr auto`, aligned to bottom, `padding-bottom: 56px`, `border-bottom: 1px solid #D9D3C6`, `margin-bottom: 56px`
  - Top-left: eyebrow "01 — Selected Work" (mono 12px uppercase, `#6B655C`)
  - Below eyebrow: H2 "Recent *projects.*" — Newsreader `clamp(40px, 5.5vw, 88px)`, italic word in `#3A3630`
  - Top-right: aside "04 / Case studies" (mono 12px uppercase)
- Four project cards, alternating layout (`.project` and `.project.reverse`):
  - Grid: `1fr 1.2fr` (reversed cards: `1.2fr 1fr`, with media placed first via `order: -1`)
  - Padding: `clamp(48px, 8vh, 96px) 0`, separated by `1px solid #D9D3C6`; last card no border
  - Collapses to 1 column ≤900px
- **Project info block** (each card):
  - Index row: mono 11px uppercase, `24px` gap, e.g. `Project · 001` + `2025`
  - **H3 project title**: `clamp(38px, 4vw, 60px)`, letter-spacing `-0.025em`, `margin-bottom: 20px`. Second word italic in `#3A3630`.
  - Summary paragraph: 17px, colour `#3A3630`, line-height 1.55
  - Stack chips: mono 10.5px uppercase, `padding: 6px 10px`, `border: 1px solid #D9D3C6`, `border-radius: 999px`, `gap: 6px 8px` wrap
  - Actions row: `.arrow-link` "View case study →" + optional live-site link "↗"
    - Arrow-link: mono 12px uppercase, `border-bottom: 1px solid #1A1815`, `padding-bottom: 4px`
    - Hover: `gap` grows from `10px` → `14px`, colour + border shift to `#A66B2E` (200ms)
- **Project media block** (each card):
  - Aspect ratio `4 / 3`
  - Background `#EFEBE2`, `1px solid #D9D3C6`
  - Frame label pinned top-left (14px inset): mono 10px uppercase on translucent paper background pill, e.g. `shumbawheels.co.zw`
  - Contains a full-bleed screenshot (in the prototype this is an `<image-slot>` drop zone; in production replace with `<img>`)

The four projects, in order:

| # | Title | Year | Summary (exact copy) | Stack chips | Live link | Detail page |
|---|---|---|---|---|---|---|
| 001 | **Shumba *Wheels.*** | 2025 | "A web-based driving school management system that digitises manual processes — students, instructors, lessons, bookings and payments — through one centralised, responsive platform." | HTML5, CSS3, JavaScript, PHP, MySQL, Bootstrap | `shumbawheels.co.zw` | `projects/shumba-wheels.html` |
| 002 | **Raindrop *Driving.*** *(reversed)* | 2024 | "A marketing and enrolment site for a driving school — clean, mobile-first pages that showcase courses, capture leads, and reflect the school's brand with SEO fundamentals baked in." | HTML5, CSS3, JavaScript, Bootstrap, PHP, MySQL | `raindropdriving.co.zw` | `projects/raindrop-driving.html` |
| 003 | **Kingdom Power *Royal Assembly.*** | 2024 | "A church management system supporting member registration, event coordination and communications — designed to help a growing assembly run its administration with clarity and calm." | PHP, MySQL, Bootstrap, JavaScript | *(none)* | `projects/kingdom-power.html` |
| 004 | **Zim*market.*** *(reversed)* | 2023 | "A local marketplace concept connecting Zimbabwean sellers with buyers — product listings, category browsing, and a lightweight admin panel, focused on being fast on low-bandwidth connections." | PHP, MySQL, HTML5, CSS3, JavaScript | *(none)* | `projects/zimmarket.html` |

#### 1.4 About (id `#about`)
- Section header eyebrow "02 — About", H2 "A brief *introduction.*", aside "Harare · Zimbabwe"
- Two-column grid `1fr 1.4fr`, gap `clamp(40px, 6vw, 96px)`, collapses to 1 col ≤900px
- **Left column — portrait**: aspect-ratio `4/5`, `#EFEBE2` bg, `1px solid #D9D3C6` border; caption below "Fig. 01 — Portrait" in mono 11px uppercase, offset `-30px` below
- **Right column — body**:
  - Inner H2 "Building things that *work*, gracefully." (max-width `14ch`)
  - Two paragraphs, `clamp(19px, 1.4vw, 22px)`, colour `#3A3630`, max-width `44ch`:
    1. "I'm a passionate Web Designer and Web Developer with experience creating responsive, user-friendly websites and web applications. I enjoy combining creativity with technology to build digital solutions that solve real business problems — from business websites to full management systems."
    2. "I'm always eager to learn new technologies, sharpen my craft, and deliver high-quality work that creates real value for clients and the people who use what we make."
  - Facts grid `<dl>` — 2 columns, `gap: 32px 40px`, `padding-top: 32px`, `border-top: 1px solid #D9D3C6`:
    - **Education** — "BSc Computer Engineering" + sub "Midlands State University · Final year"
    - **Location** — "Harare, Zimbabwe" + sub "Open to remote work worldwide"
    - **Focus** — "Web design & development" + sub "Business sites · Management systems"
    - **Availability** — "Freelance & full-time" + sub "Remote · Contract · Project-based"
  - `dt` mono 11px uppercase `#6B655C`; `dd` 18px `#1A1815`; sub-line block below in 14px `#6B655C`

#### 1.5 Skills / Toolkit
- Eyebrow "03 — Toolkit", H2 "Skills *& tools.*", aside "What I use every day"
- **4-column grid** of skill cards (`repeat(4, 1fr)`, gap `40px 32px`). Collapses to 2 cols ≤900px, 1 col ≤520px
- Each column:
  - **H4** (22px, letter-spacing `-0.01em`, `border-bottom: 1px solid #D9D3C6`, `padding-bottom: 14px`, `margin-bottom: 20px`) preceded by a mono 10px column number (e.g. `01`) in `#6B655C`
  - `<ul>` list with `gap: 8px`; each `<li>` is a flex row: skill name (16.5px `#3A3630`) — dotted leader line (1px background `#D9D3C6` at `opacity: 0.6`) — mono 10px tag in `#6B655C`
- Contents:
  - **01 · Front-End** — HTML5 (markup), CSS3 (styling), JavaScript (ES6+) (interactivity), Bootstrap (framework), Tailwind CSS (utility), Responsive design (mobile-first)
  - **02 · Design & UI** — Figma (ui/ux), Adobe Photoshop (graphics), Canva (brand), Wireframing (early), Prototyping (mid), Accessibility (wcag)
  - **03 · Back-End** — PHP (server), MySQL (database), Laravel (framework), Node.js (runtime), REST APIs (data), Authentication (auth)
  - **04 · Platforms & Ops** — WordPress (cms), Git & GitHub (version), VS Code (editor), SEO fundamentals (growth), Performance (optim.), Cross-browser QA (test)

#### 1.6 Process (id `#process`)
- Eyebrow "04 — How I Work", H2 "A quiet, *deliberate* process.", aside "Discover → Deliver"
- 4-column grid, each step is:
  - `border-top: 1px solid #1A1815`, `padding-top: 20px`
  - Mono 11px "Step 0N" in `#6B655C`, `margin-bottom: 24px`
  - H4 28px title with a trailing italic accent-coloured period `<em>.</em>` (colour `#A66B2E`)
  - Body 16px `#3A3630`, line-height 1.55
- Copy:
  1. **Discover.** — "Conversations, requirement gathering, and a clear understanding of the business — the users, the goals, the constraints. Nothing is built before it is understood."
  2. **Design.** — "Wireframes and layouts in Figma. Type, colour, hierarchy — always testing on mobile first. The interface earns its keep before a single line of code is written."
  3. **Build.** — "Clean, semantic HTML. Considered CSS. Purposeful JavaScript. Server logic where needed with PHP or Laravel, always paired with a well-shaped database."
  4. **Deliver.** — "Cross-browser QA, performance tuning, SEO basics, and a friendly handover. I stay reachable after launch — good work is a relationship, not a transaction."

#### 1.7 Testimonial (placeholder)
- Centered card, `max-width: 32ch`
- Large italic Newsreader open-quote `“` — 120px, line-height 0.6, colour `#A66B2E`, `margin-bottom: 20px`
- Blockquote: Newsreader italic, `clamp(28px, 3.4vw, 42px)`, letter-spacing `-0.015em`
  > "Nokutenda listened first, then built exactly what our driving school needed — and made it feel effortless."
- Cite line: mono 11px uppercase `#6B655C` — "— Client testimonial · Placeholder"
- Below (40px): mono 10px `#6B655C` at `opacity: 0.6` — "Real testimonials to be added"
- **Note to developer**: this quote is a placeholder — do not ship as-is. Either hide the section or wire it to a CMS entry.

#### 1.8 Contact / Footer (id `#contact`)
- `border-top: 1px solid #D9D3C6`, `padding-top: clamp(80px, 14vh, 200px)`
- Eyebrow "05 — Contact"
- Massive H2 (`clamp(56px, 10vw, 160px)`, letter-spacing `-0.035em`, max-width `12ch`):

  > Let's build something ***worth*** *making.*

  - "worth" is italic and coloured `#A66B2E`
  - "making." is italic, colour `#3A3630`
- 2-column grid `1.4fr 1fr`, `border-top: 1px solid #D9D3C6`, `padding-top: 48px`, collapses to 1 col ≤720px
- **Left — link list** (`gap: 24px`). Each row is an `<a>`:
  - Flex row: mono 11px uppercase label (left, `#6B655C`) — value (right, Newsreader `clamp(20px, 2vw, 28px)`)
  - `border-bottom: 1px solid #D9D3C6`, `padding-bottom: 12px`
  - Hover: colour + border shift to `#A66B2E` (200ms)
  - Rows:
    - Email — `boshanokutenda@gmail.com` → `mailto:boshanokutenda@gmail.com`
    - Phone / WhatsApp — `+263 77 970 7567` → `tel:+263779707567`
    - GitHub — `@Technock-flash ↗` → `https://github.com/Technock-flash`
    - WhatsApp — `Message directly ↗` → `https://wa.me/263779707567`
- **Right — side note**:
  - Mono 11px uppercase label "Currently"
  - "Available for freelance web design & development projects — remote, worldwide. Typical reply within 24 hours."
  - Secondary paragraph in `#6B655C`: "Prefer email? Copy the address above or use the mailto link. I'll reply from Harare (CAT · UTC+2)."
- **Footer** (`padding: 40px 0 60px`, flex row, mono 11px uppercase `#6B655C`):
  - Left: "© 2026 Nokutenda Bosha"
  - Center: "Harare, Zimbabwe · CAT"
  - Right: "Handcrafted with care"

---

### 2) Project Detail Pages

All four detail pages share the same shell and rhythm. Files:
- `projects/shumba-wheels.html`
- `projects/raindrop-driving.html`
- `projects/kingdom-power.html`
- `projects/zimmarket.html`

#### 2.1 Detail-page structure (identical across all 4)

1. **Header** — same sticky header as home; brand mark links back to `../index.html`; nav points to `../index.html#work`, `#about`, `#process`, `#contact`
2. **Detail hero** (`.detail-hero`)
   - Breadcrumb: mono 11px uppercase, `margin-bottom: 48px` — `Home / Work / <Project name>`
   - H1: `clamp(52px, 8vw, 128px)`, letter-spacing `-0.035em`, max-width `14ch`. Second word italic in `#3A3630`.
   - Meta `<dl>` — 4 columns, `gap: 32px`, `border-top: 1px solid #D9D3C6`, `padding-top: 32px` (collapses to 2 cols ≤720px):
     - **Project** / **Role** / **Year** / **Live** (or **Type** if no live URL)
     - `dt` mono 11px uppercase `#6B655C`; `dd` 18px `#1A1815`
     - Live URL `dd a` has `border-bottom: 1px solid #D9D3C6`, hover shifts to accent
3. **Hero screenshot** (`.hero-shot`): aspect `16/10`, `#EFEBE2`, `1px solid #D9D3C6`, full shell width, `margin-bottom: clamp(60px, 8vh, 96px)`
4. **Body** (`.detail-body`): 2-column grid `1fr 2fr`, gap `clamp(40px, 6vw, 96px)`, `border-top: 1px solid #D9D3C6`, vertical padding `clamp(60px, 10vh, 120px)`. Collapses to 1 col ≤900px.
   - Left: mono eyebrow "01 — Overview" + H3 "The *brief.*"
   - Right (`.body-col`): overview paragraphs (`clamp(18px, 1.3vw, 21px)`, `#3A3630`, line-height 1.6, max-width `58ch`)
   - H4 sub-heads for **Key features / Approach / Outcome / Stack** at 22px, letter-spacing `-0.015em`
   - Features `<ul.features>`: 2-column CSS `columns`, no bullets; each `<li>` has a `→` prefix in `#A66B2E`, `border-bottom: 1px solid #D9D3C6`, `padding: 10px 0`, 16px `#3A3630`. Single column ≤900px.
5. **Gallery** (`.gallery`): eyebrow "02 — Screens", then a 2-column grid of screenshot slots (aspect `16/10`, `#EFEBE2`, `1px solid #D9D3C6`). Each has a top-left frame label pill (mono 10px uppercase). Single column ≤720px.
6. **Next project** (`.next-project`): `border-top: 1px solid #D9D3C6`, flex row, `justify-content: space-between`
   - Left: mono "Next project →" label + H3 next project name (italic second word). Hover: title turns `#A66B2E`.
   - Right: mono "0N / 04" progress indicator
7. **Contact section** (compact re-render of the home contact block: same H2, 3 link rows — email / phone / GitHub — and same footer). Kept identical for consistency.

#### 2.2 Per-project detail content

**Shumba Wheels** (`projects/shumba-wheels.html`)
- Meta: Project = "Driving school management system"; Role = "Designer & Developer"; Year = 2025; Live = `https://shumbawheels.co.zw`
- Overview paragraphs (verbatim):
  1. "Shumba Wheels is a web-based driving school management system built to streamline the day-to-day operations of a busy driving school. The platform centralises students, driving instructors, lessons, bookings, payments and inquiries into one place."
  2. "I worked as both the web designer and web developer — gathering requirements, designing the user interface, and developing the application to ensure it was responsive, user-friendly and efficient. The goal was to digitise many of the school's manual processes so administrators could focus on teaching rather than paperwork."
- **Key features** (10, in `<ul.features>`): Student registration & profiles · Instructor management · Lesson booking & scheduling · Course management · Online inquiries · Payment tracking · Dashboard with key statistics · User authentication & login · Responsive mobile / desktop · Contact forms & notifications
- **Approach**: "Usability was the north star. I focused on a clean interface that non-technical staff could learn quickly — clear navigation, generous spacing, forms that read like conversations. On the technical side, PHP and MySQL handle the data model, with Bootstrap providing a reliable responsive shell."
- **Outcome**: "The school moved from paper-based records and phone-call bookings to a centralised digital workflow. Administrators now see enrolment, schedules and payments at a glance, and prospective students can inquire and book directly through the site."
- Gallery labels: **Dashboard · Bookings · Student profile · Mobile view**
- Next project → Raindrop Driving (02 / 04)

**Raindrop Driving** (`projects/raindrop-driving.html`)
- Meta: Project = "Driving school website"; Role = "Designer & Developer"; Year = 2024; Live = `https://raindropdriving.co.zw`
- Overview (verbatim, 3 paragraphs):
  1. "Raindrop Driving School is a web-based platform built to strengthen the school's online presence and make it easier for prospective students to access information and services. Visitors can learn about available driving courses, register their interest, contact the school, and browse important information in a simple, user-friendly way."
  2. "I worked as both the web designer and web developer on the project. My responsibilities included gathering requirements, designing the user interface, and developing the website to ensure it was responsive, visually appealing, and easy to navigate. I focused on a clean user experience that works well on both desktop and mobile."
  3. "From the development side, I implemented the site's structure, navigation, forms, and responsive layouts while optimising for performance and usability. The design reflects the driving school's brand and makes it easy for visitors to find key information such as courses, pricing, contact details and enrolment options."
- **What I built** (8): Marketing home page · Courses & pricing pages · Enrolment / inquiry forms · Contact page with map · Responsive mobile layouts · Basic SEO best practices · Performance optimisation · Branded visual identity
- **Stack**: "HTML5, CSS3, JavaScript, Bootstrap on the front-end; PHP and MySQL powering the back-end forms and content. Responsive design principles applied throughout, with basic SEO best practices to improve usability and search visibility."
- Gallery labels: **Home page · Courses · Enrolment form · Mobile view**
- Next project → Kingdom Power (03 / 04)

**Kingdom Power Royal Assembly** (`projects/kingdom-power.html`)
- Meta: Project = "Church management system"; Role = "Designer & Developer"; Year = 2024; Type = "Personal project"
- Overview (verbatim, 2 paragraphs):
  1. "Kingdom Power Royal Assembly is a management system designed to support a growing church community. The platform helps administrators register members, coordinate events, communicate announcements, and keep records of ministries and small groups in one calm, organised place."
  2. "The goal was to give a lean administrative team the tools of a much larger organisation — without demanding technical fluency from the people using it. Clear labels, forgiving forms, and a dashboard that surfaces the numbers that matter this week."
- **Key modules** (8): Member registration & directory · Event scheduling · Announcements & communications · Ministry & group management · Attendance tracking · Contributions / offerings log · Admin dashboard · Roles & permissions
- **Approach**: "I approached the interface with a light hand — the church context calls for warmth rather than corporate density. Typography leads the design; colour is used sparingly, mostly to draw the eye to the day's important actions. Built with PHP, MySQL and Bootstrap, with vanilla JavaScript sprinkled where it improved the experience."
- Gallery labels: **Dashboard · Members · Events · Mobile view**
- Next project → Zimmarket (04 / 04)

**Zimmarket** (`projects/zimmarket.html`)
- Meta: Project = "Local marketplace platform"; Role = "Designer & Developer"; Year = 2023; Type = "Personal project"
- Overview (verbatim, 2 paragraphs):
  1. "Zimmarket is a local marketplace concept that connects Zimbabwean sellers with buyers. The platform lets vendors list products with photos and descriptions, and lets shoppers browse by category, search, and reach out to sellers directly."
  2. "Given the local context, performance on modest connections was a hard requirement. I kept the front-end lean — semantic HTML, minimal JavaScript, image handling tuned for mobile data — and shaped the database schema to keep queries fast even with a lot of listings."
- **What's included** (8): Product listings with images · Category browsing · Search & filtering · Seller profiles · Inquiry / contact system · Lightweight admin panel · User registration & login · Mobile-first responsive UI
- **Stack & considerations**: "Built with PHP, MySQL, HTML5, CSS3 and JavaScript. Special attention went into image optimisation, minimal payload, and clear navigation for first-time visitors. The admin surface is deliberately small — enough to moderate listings and manage users, no more."
- Gallery labels: **Homepage · Product listings · Product detail · Mobile view**
- Next project → "Back to work / All projects" (End / 04)

---

## Interactions & Behaviour

- **Sticky header shadow** — on scroll, toggle a `1px` bottom border on `.site-header` once `window.scrollY > 8`
- **In-page anchor smooth scroll** — every `a[href^="#"]` intercepts click, prevents default, and scrolls to the target with a `-60px` top offset so content clears the sticky header
- **Reveal-on-scroll** — elements with class `.reveal` start at `opacity: 0; transform: translateY(20px)` and animate to `1 / none` when they intersect the viewport at threshold `0.12`. Transition: `700ms cubic-bezier(.2,.7,.2,1)` on both properties. Uses an `IntersectionObserver` that unobserves after firing (one-shot).
- **Marquee** — continuous CSS keyframe scroll, 45s linear infinite. Duplicate content once inline for the seamless loop.
- **Availability-pill dot** — 2.4s ease-in-out infinite `pulse` on the shadow ring (10% → 25% opacity swing)
- **Arrow-link hover** — `gap` grows from `10px` → `14px`, colour + underline shift to accent `#A66B2E` (200ms ease)
- **Project card image hover** — currently no zoom (intentionally restrained). Optional enhancement: subtle 200ms `scale(1.02)` on the image only, not the frame.
- **Nav-link hover** — animated underline slides in left→right (240ms ease)
- **Contact-link hover** — colour + border-bottom shift to `#A66B2E` (200ms ease)
- **Reduced motion** — with `prefers-reduced-motion: reduce`: disable reveal transition (elements are visible by default), stop marquee, stop pill pulse

## State Management

Very light. The prototype uses only:

- A boolean `scrolled` state on the header (DOM class toggle on scroll)
- A one-shot `IntersectionObserver` for reveal animations
- Local drag-drop image persistence via the prototype's `<image-slot>` web component — **not needed in production**; replace slots with `<img>` tags fed from a CMS or asset directory

No data fetching or client state beyond the above.

## Responsive Breakpoints

The design uses `clamp()` fluid sizing throughout, plus these hard breakpoints:

- **≤900px** — About grid collapses to 1 column; skills grid → 2 cols; process grid → 2 cols; project cards → 1 col (reverse cards reset `order`); detail body → 1 col; features list → 1 col
- **≤720px** — Hero lower row → 1 col; contact grid → 1 col; detail meta grid → 2 cols; gallery grid → 1 col
- **≤520px** — Skills grid → 1 col; process grid → 1 col

## Design Tokens

### Colours

| Token | Hex | Usage |
|---|---|---|
| `--paper` | `#F7F4EE` | Page background |
| `--paper-2` | `#EFEBE2` | Image-slot / card fill |
| `--ink` | `#1A1815` | Primary text, brand mark, borders on process steps |
| `--ink-2` | `#3A3630` | Body copy, italic secondary text |
| `--ink-3` | `#6B655C` | Meta labels, mono uppercase captions |
| `--line` | `#D9D3C6` | Hairline dividers, borders |
| `--accent` | `#A66B2E` | Warm ochre — ampersand, hover state, "worth", quote mark, `→` bullets |
| `--accent-soft` | `#C9A47A` | Reserved (soft-hover state) |
| Availability dot | `#2E9A5A` | Green presence indicator |

### Typography

- **Serif** — [Newsreader](https://fonts.google.com/specimen/Newsreader), variable, weights 300–600, italics enabled, optical size 6–72. Loaded from Google Fonts.
- **Mono** — [JetBrains Mono](https://fonts.google.com/specimen/JetBrains+Mono), weights 400 & 500. Loaded from Google Fonts.
- Base body: 18px / 1.55 / weight 380 (variable) / letter-spacing default
- Body `text-wrap: pretty`, headings `text-wrap: balance`
- Type scale (via `clamp()`):
  - `h1` — `clamp(52px, 9vw, 148px)` / line-height 1.02 / letter-spacing `-0.02em` (hero uses `-0.035em`)
  - `h2` — `clamp(40px, 5.5vw, 88px)`
  - `h3` — `clamp(28px, 3vw, 44px)` / line-height 1.1
  - `h4` — `clamp(20px, 1.6vw, 26px)` / line-height 1.2
  - Lede — `clamp(19px, 1.4vw, 22px)`
  - Body — 18px
  - Meta / eyebrow (mono) — 11–12px uppercase, letter-spacing `0.12em`–`0.14em`

### Spacing

- Shell horizontal padding: `clamp(20px, 4vw, 56px)`
- Section vertical padding: `clamp(80px, 12vh, 160px)`
- Section-head bottom rule + spacing: `padding-bottom: 56px`, `margin-bottom: 56px`
- Project card vertical padding: `clamp(48px, 8vh, 96px)`
- Detail hero → hero-shot spacing: `margin-bottom: clamp(60px, 8vh, 96px)`
- Grid gaps (varies by section): 24px (galleries), 32px (facts / detail meta), 40px (skills rows), `clamp(40px, 6vw, 96px)` (major two-column layouts)

### Borders & radii

- Hairline: `1px solid #D9D3C6`
- Pills: `border-radius: 999px`
- Cards / image slots: no radius (square corners are intentional — editorial feel). Do **not** round these.
- Contact CTA pill: `padding: 10px 18px`, `border-radius: 999px`

### Shadows

- **None used.** The design relies on hairlines and typography for hierarchy. Do not introduce drop-shadows.

### Motion

- Standard easing: `cubic-bezier(.2,.7,.2,1)` (used for reveal)
- Standard hover duration: `200ms ease` (arrow-link, contact-link, header border)
- Nav underline: `240ms ease`
- Reveal: `700ms`
- Marquee: `45s linear infinite`
- Pill pulse: `2.4s ease-in-out infinite`

## Assets

- **Fonts** — Newsreader + JetBrains Mono via Google Fonts. In production, self-host or use the target codebase's font-loading strategy (e.g. `next/font`, `astro:assets`). Include italic + full variable range for Newsreader.
- **Project screenshots** — not yet supplied. The design expects **1 hero shot** per project card on the home page and **4 gallery screens** (Dashboard/Bookings/Profile/Mobile, etc.) per detail page. Owner intends to provide screenshots of the live Shumba Wheels and Raindrop Driving sites; Kingdom Power and Zimmarket screenshots may need to be captured from local builds. Serve WebP + fallback JPEG, `srcset` for 1× / 2×, `loading="lazy"` except above-the-fold.
- **Portrait photo** — one 4:5 portrait of Nokutenda for the About section. Not yet supplied.
- **Favicon / social image** — not yet created. Recommend a 32×32 favicon of the "NB" mark on `#1A1815` disc, and a 1200×630 OG image reusing the hero title on `#F7F4EE`.
- **Icons** — the design uses only text-based glyphs (`→`, `↗`, `●`, `“`) rendered from the fonts. No icon library required.

## Files

The design files bundled in this handoff:

- `README.md` — this document
- `index.html` — home page
- `styles.css` — all styles (single stylesheet, ~700 lines)
- `image_slot.js` — the drag-drop prototype component. **Not needed in production**; documented here only so the developer understands what the `<image-slot>` tags in the HTML represent.
- `projects/shumba-wheels.html`
- `projects/raindrop-driving.html`
- `projects/kingdom-power.html`
- `projects/zimmarket.html`

## Implementation Notes for the Developer

1. **Component decomposition suggestion** (for React/Vue/Svelte):
   - `<SiteHeader />`, `<SiteFooter />`, `<ContactSection />` — reused across all pages
   - `<SectionHead eyebrow title aside />` — reused 4× on home
   - `<ProjectCard idx year title stack summary caseUrl liveUrl image reverse />` — repeats 4× on home
   - `<SkillColumn number title items />` — 4× in skills section
   - `<ProcessStep n title body />` — 4× in process section
   - `<Marquee items />` — one instance
   - `<DetailShell breadcrumb title meta cover>{overview}{gallery}{next}</DetailShell>` — pattern for all 4 detail pages
   - Model detail-page content as data (title, meta, paragraphs, features, gallery labels, nextProject) and render from a single template
2. **Accessibility**
   - All interactive elements are keyboard-accessible; keep the focus-visible outlines from your framework's defaults (don't remove them)
   - Marquee is `aria-hidden="true"` (decorative)
   - Reveal-on-scroll must not hide content when JS is off — start `.reveal` visible and only apply the initial-hidden state after JS boots, **or** hydrate with SSR-safe fallback
   - `prefers-reduced-motion` respected in `styles.css` — preserve that behaviour
3. **SEO**
   - Set unique `<title>` and `<meta description>` per page (home + 4 detail pages)
   - Add OG tags with the 1200×630 image once designed
   - JSON-LD `Person` schema on home (name, url, jobTitle, address, sameAs → GitHub)
   - Sitemap.xml + robots.txt
4. **Performance**
   - Preconnect + preload the Newsreader italic variant used above the fold
   - Serve images as WebP with JPEG fallback; lazy-load below-the-fold
   - Inline critical CSS (hero + header) if using a static host
5. **Content-editability**
   - The site owner is not a developer of the target codebase — consider wiring project entries, testimonials, and contact fields through a lightweight CMS (Sanity, Contentful, or Markdown files in the repo) so Nokutenda can update copy and screenshots without deploys
6. **Replace before shipping**
   - The testimonial quote is a placeholder — do not publish as-is
   - The `<image-slot>` elements must be replaced with real `<img>` (or framework equivalent)
   - Verify all external links (`shumbawheels.co.zw`, `raindropdriving.co.zw`, `github.com/Technock-flash`, `wa.me/263779707567`) resolve correctly at deploy time
