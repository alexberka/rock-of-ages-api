#!/bin/bash

# FOR SQLITE INTEGRATIONS
# rm db.sqlite3
# rm -rf ./rockapi/migrations
# python3 manage.py migrate
# python3 manage.py makemigrations rockapi
# python3 manage.py migrate rockapi
# python3 manage.py loaddata users
# python3 manage.py loaddata tokens
# python3 manage.py loaddata types
# python3 manage.py loaddata rocks

echo "🗄️  Setting up PostgreSQL database..."

# Create Django's built-in tables (users, sessions, etc.)
echo "⚙️  Running Django migrations..."
pipenv run python manage.py migrate

# Generate migration files for our Rock app
echo "📋 Creating app-specific migrations..."
pipenv run python manage.py makemigrations rockapi

# Create our app's tables (Rock, Type)
echo "🔧 Applying app migrations..."
pipenv run python manage.py migrate rockapi

# Load sample data from JSON files
echo "📊 Loading seed data..."
pipenv run python manage.py loaddata users
pipenv run python manage.py loaddata tokens  
pipenv run python manage.py loaddata types
pipenv run python manage.py loaddata rocks

echo "✅ Database setup complete!"
