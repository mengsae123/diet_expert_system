# 🚀 Deployment Cheat Sheet

## ⚡ Super Quick Deploy (5 Minutes)

### Prerequisites
- ✅ Code on GitHub
- ✅ Render.com account

### 3 Commands to Deploy
```bash
# 1. Push to GitHub
git add . && git commit -m "Deploy" && git push

# 2. On Render.com
# - Click "New Web Service"
# - Connect repo
# - Click "Create"

# 3. Seed database (in Render shell)
python seeds/seed.py restore
```

**Done! App live at:** `https://your-app.onrender.com` 🎉

---

## 🎯 Platform Quick Reference

### Render (Recommended)
```bash
# Sign up
https://render.com

# Deploy
1. New Web Service
2. Connect GitHub
3. Create

# Database seeds
python seeds/seed.py restore
```

### Railway
```bash
# Install CLI
npm i -g @railway/cli

# Deploy
railway login
railway init
railway up

# Seeds
railway run python seeds/seed.py restore
```

### PythonAnywhere
```bash
# In PA console
git clone https://github.com/YOUR_REPO.git
cd your-repo
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python seeds/seed.py restore
```

### Vercel
```bash
# Install CLI
npm i -g vercel

# Deploy
vercel login
vercel

# Note: Need external database (Supabase)
```

### Fly.io
```bash
# Install CLI
powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"

# Deploy
fly auth login
fly launch
fly deploy

# Seeds
fly ssh console
python seeds/seed.py restore
```

---

## 🗄️ Database Connection Strings

### PostgreSQL (Render, Railway, Fly.io)
```
DATABASE_URL=postgresql://user:pass@host:5432/dbname
```

### MySQL (PythonAnywhere)
```
DB_HOST=username.mysql.pythonanywhere-services.com
DB_USER=username
DB_PASSWORD=yourpassword
DB_NAME=username$dbname
```

### Supabase (Vercel)
```
SUPABASE_DB_URL=postgresql://postgres:[password]@db.[project].supabase.co:5432/postgres
```

---

## 🔐 Essential Environment Variables

```bash
# Production .env
SECRET_KEY=<random-32-char-string>
DATABASE_URL=<database-connection-string>
SKIP_DB_CREATE_ALL=0
SESSION_COOKIE_SECURE=1
REMEMBER_COOKIE_SECURE=1
```

---

## 🔧 Common Commands

### Local Development
```bash
python run.py                    # Start server
python seeds/seed.py restore     # Load data
python seeds/seed.py dump        # Export data
python seeds/seed.py reseed-users # Generate users
```

### Git Operations
```bash
git add .                        # Stage all
git commit -m "message"          # Commit
git push                         # Deploy (auto)
git log --oneline               # View history
```

### Database Management
```bash
# Backup PostgreSQL
pg_dump $DATABASE_URL > backup.sql

# Restore PostgreSQL
psql $DATABASE_URL < backup.sql

# Backup MySQL
mysqldump -h $DB_HOST -u $DB_USER -p $DB_NAME > backup.sql

# Restore MySQL
mysql -h $DB_HOST -u $DB_USER -p $DB_NAME < backup.sql
```

---

## 🐛 Quick Troubleshooting

### Build Failed
```bash
# Check logs
# Verify requirements.txt has all dependencies
# Check Python version in runtime.txt
pip freeze > requirements.txt  # Update deps
```

### App Won't Start
```bash
# Check environment variables
# Verify DATABASE_URL is set
# Check Procfile/start command
gunicorn run:app --bind 0.0.0.0:$PORT  # Test locally
```

### Database Connection Error
```bash
# Verify DATABASE_URL
echo $DATABASE_URL

# Test connection
python -c "from app import create_app; app = create_app(); print('OK')"

# Reset database
python seeds/seed.py restore
```

### Slow Response
```bash
# Free tier limitation
# Use UptimeRobot to keep awake
# Upgrade to paid tier if needed
```

---

## 📊 Free Tier Limits

| Platform | Hours/Month | RAM | Database | Sleep |
|----------|------------|-----|----------|-------|
| Render | 750 | 512MB | 1GB | 15 min |
| Railway | ~$5 credit | Varies | 1GB | No |
| PythonAnywhere | Unlimited | Limited | 500MB | No |
| Vercel | Unlimited | 1GB | External | Cold start |
| Fly.io | Unlimited | 256MB | 3GB | Variable |

---

## 🎯 URLs & Access

### Your App URLs
```
Local:      http://127.0.0.1:5000
Render:     https://[app-name].onrender.com
Railway:    https://[app-name].up.railway.app
PA:         https://[username].pythonanywhere.com
Vercel:     https://[app-name].vercel.app
Fly.io:     https://[app-name].fly.dev
```

### Platform Dashboards
```
Render:     https://dashboard.render.com
Railway:    https://railway.app
PA:         https://www.pythonanywhere.com/dashboard
Vercel:     https://vercel.com/dashboard
Fly.io:     https://fly.io/dashboard
```

---

## 🔑 Default Login Credentials

```
Admin:
  Username: Admin
  Password: 123456

Doctor:
  Username: Doctor
  Password: 123456

User:
  Username: thearo
  Password: 123456
```

⚠️ **CHANGE THESE IMMEDIATELY AFTER DEPLOYMENT!**

---

## 📱 Keep App Awake (Free Tier)

### UptimeRobot Setup
1. Go to https://uptimerobot.com
2. Sign up (free)
3. Add New Monitor
4. Type: HTTP(s)
5. URL: Your app URL
6. Interval: 5 minutes
7. Save

Your app won't sleep anymore! 🎉

---

## 🔄 Update Deployed App

```bash
# Make changes
git add .
git commit -m "Update feature X"
git push

# Render/Railway/Vercel auto-deploy
# PythonAnywhere: Manual pull + reload
```

---

## 🆘 Emergency Commands

### Reset Everything
```bash
# Delete database
rm instance/*.db  # Local

# On server
python seeds/seed.py restore  # Reset data

# Full rebuild
git push --force  # Trigger redeploy
```

### View Logs
```bash
# Render
render logs [service-name]

# Railway
railway logs

# Vercel
vercel logs

# Fly.io
fly logs
```

---

## 💡 Pro Tips

```bash
# Generate secure SECRET_KEY
python -c "import secrets; print(secrets.token_hex(32))"

# Check disk usage
du -sh *

# Monitor database size
# Render: Dashboard → Database → Usage
# Railway: Dashboard → PostgreSQL → Metrics

# Test before deploy
python run.py  # Run locally first
```

---

## 📞 Support Links

```
Render:     https://render.com/docs
Railway:    https://docs.railway.app
PA:         https://help.pythonanywhere.com
Vercel:     https://vercel.com/docs
Fly.io:     https://fly.io/docs
```

---

## ✅ Pre-Deploy Checklist

```
[ ] Code on GitHub
[ ] requirements.txt updated
[ ] .gitignore configured
[ ] .env excluded (not in Git!)
[ ] runtime.txt created
[ ] Procfile/render.yaml created
[ ] Database seeds ready
[ ] Test locally first
```

---

## 🎉 Post-Deploy Checklist

```
[ ] App accessible at URL
[ ] HTTPS working
[ ] Database connected
[ ] Seeds loaded
[ ] Login works
[ ] Default passwords changed
[ ] All features tested
[ ] Monitoring set up (UptimeRobot)
[ ] Backup strategy planned
```

---

## 📚 Quick File Reference

```
render.yaml         → Render configuration
Procfile           → Railway/Heroku config
runtime.txt        → Python version
requirements.txt   → Dependencies
.gitignore         → Excluded files
.env              → Local secrets (not in Git!)
.env.example      → Template for .env
seeds/seed.py     → Database seeder
run.py            → App entry point
```

---

## 🚀 One-Liner Deploys

```bash
# Render (after setup)
git push && echo "Deploying..."

# Railway
railway up

# Vercel
vercel --prod

# Fly.io
fly deploy
```

---

*For detailed guides, see:*
- *`DEPLOY_NOW.md` - Step-by-step Render guide*
- *`DEPLOYMENT_GUIDE.md` - All platforms*
- *`HOSTING_COMPARISON.md` - Feature comparison*
