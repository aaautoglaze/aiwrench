# aiWrench — Build Status

## What Was Built

### Landing Page (/)
- Dark-themed, mobile-responsive marketing site
- Hero section with circuit-grid background motif
- Services section showcasing three tiers: **Ignite** ($2,500), **Wrench** ($1,200/mo), **Blueprint** (Custom)
- How It Works section (3-step process)
- Lead capture form with all fields: Name, Company, Email, Phone, Industry (dropdown), Service Interest (dropdown), Message
- Honeypot field for spam protection
- hCaptcha integration (activates when `HCAPTCHA_SITE_KEY` env var is set)
- Flash message: "We'll be in touch within 1 business day."

### Admin Panel (/admin)
- Session-based authentication (AdminUser model with bcrypt)
- Lead list with all fields, sortable/filterable by status
- Status management: new → contacted → qualified → closed (inline dropdown)
- Bulk delete functionality with checkbox selection
- Individual lead delete with confirmation

### Design
- Background: #0a0a0f (near-black)
- Primary accent: #2563eb (electric blue)
- Secondary accent: #eab308 (electric yellow) — badges and highlights
- Font: Inter via Google Fonts
- Sharp, professional aesthetic — no rounded bubbly elements
- Subtle blue border glow on card hover
- Solid blue CTAs with glow shadow effects

### Tech Stack
- Rails 7.1.6 + Tailwind CSS v4
- PostgreSQL
- hCaptcha gem (7.1)
- rack-attack for rate limiting (5 req/5min on leads, 5 req/20s on admin login)
- bcrypt for admin auth

### Models
- **Lead** — name, company, email, phone, industry, service_interest, message, status (default: "new"), timestamps
- **AdminUser** — email (unique), password_digest, timestamps

### Deployment
- Heroku Procfile configured (web + release phase for migrations/seeds)
- Default admin: `admin@aiwrench.com` / password set via `ADMIN_PASSWORD` env var (default: `changeme123`)
- Required env vars: `HCAPTCHA_SITE_KEY`, `HCAPTCHA_SECRET_KEY`, `RAILS_MASTER_KEY`, `ADMIN_PASSWORD`

## Heroku URL
> _Set after deployment: `heroku create aiwrench`_
