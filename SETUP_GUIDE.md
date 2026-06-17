# Nutrition Diet Expert System - Setup Guide

## Installation Complete! ✓

All Python dependencies have been installed and the application is now running.

## Current Status

- **Python Version**: 3.11.9
- **Server Status**: Running at http://127.0.0.1:5000
- **Database**: SQLite (local file-based database)
- **Database Location**: `instance/expert_system_real.db`
- **Seed Data**: Successfully loaded

## Installed Dependencies

All packages from `requirements.txt` have been installed:
- Flask 2.3.3
- Flask-WTF 1.1.1
- Flask-SQLAlchemy 3.1.1
- Flask-Login 0.6.3
- Flask-Migrate 4.0.5
- And all other dependencies

## How to Access the Application

1. **Open your web browser** and navigate to:
   ```
   http://127.0.0.1:5000
   ```
   or
   ```
   http://localhost:5000
   ```

2. **Login credentials** (from seeded data):
   - Check the `seeds/tbl_users.json` file for available users
   - Default password for test users: `123456`

## Running the Application

### Start the Server
```bash
python run.py
```

### Stop the Server
Press `CTRL+C` in the terminal where the server is running

### Run Database Seeds
```bash
# Restore seed data
python seeds/seed.py restore

# Export current database to seed files
python seeds/seed.py dump

# Generate random user data (30 users with 10-20 submissions each)
python seeds/seed.py reseed-users
```

## Database Commands

### Using Flask-Migrate for Database Migrations

```bash
# Initialize migrations (first time only)
flask db init

# Create a new migration
flask db migrate -m "Description of changes"

# Apply migrations
flask db upgrade

# Rollback last migration
flask db downgrade
```

## Project Structure

```
nutrition_diet_expert_system-main/
├── app/
│   ├── forms/          # WTForms for user input
│   ├── models/         # SQLAlchemy database models
│   ├── routes/         # Flask route handlers
│   ├── services/       # Business logic
│   ├── static/         # CSS, JS, images
│   └── templates/      # HTML templates
├── seeds/              # Database seed files
├── instance/           # SQLite database storage
├── .env               # Environment configuration
├── config.py          # Application configuration
├── run.py            # Application entry point
└── requirements.txt   # Python dependencies

```

## Environment Configuration

The `.env` file has been configured for local development:
- SECRET_KEY: Set for session management
- SKIP_DB_CREATE_ALL: Disabled (0) to allow database creation
- SESSION_COOKIE_SECURE: Disabled for local HTTP
- Database: SQLite (no external database server needed)

## Features

Based on the project structure, this appears to be a nutrition and diet expert system with:
- User authentication and authorization (RBAC)
- Role and permission management
- Diet rule management
- Food and meal tracking
- Dashboard for users and doctors
- User health insights

## Troubleshooting

### If the server won't start:
1. Check if another process is using port 5000:
   ```bash
   netstat -ano | findstr :5000
   ```
2. Change the port in `run.py` if needed

### If database errors occur:
1. Delete the database file:
   ```bash
   Remove-Item instance/expert_system_real.db
   ```
2. Restart the application (it will recreate the database)
3. Run seeds again:
   ```bash
   python seeds/seed.py restore
   ```

### If dependencies are missing:
```bash
python -m pip install -r requirements.txt
```

## Development Tips

1. **Debug Mode**: Edit `run.py` and set `debug=True` for auto-reload
2. **View Logs**: Check the console where `python run.py` is running
3. **Database Browser**: Use DB Browser for SQLite to view/edit the database
4. **API Testing**: Use tools like Postman or curl to test endpoints

## Next Steps

1. Open http://127.0.0.1:5000 in your browser
2. Explore the application features
3. Check the user accounts in `seeds/tbl_users.json`
4. Review the code structure in the `app/` directory

## Additional Resources

- Flask Documentation: https://flask.palletsprojects.com/
- SQLAlchemy Documentation: https://docs.sqlalchemy.org/
- Flask-Login Documentation: https://flask-login.readthedocs.io/

---

**Note**: This is a development setup. For production deployment, you should:
- Use a production WSGI server (like Gunicorn)
- Use PostgreSQL or MySQL instead of SQLite
- Set proper SECRET_KEY and security settings
- Enable HTTPS with proper SSL certificates
