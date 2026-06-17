#!/bin/bash

# Push to GitHub Script
# Run this in Git Bash: bash push_to_github.sh

echo "================================"
echo "Pushing to GitHub..."
echo "================================"

# Check if we're in the right directory
if [ ! -f "run.py" ]; then
    echo "ERROR: Not in project directory!"
    echo "Please run: cd /d/nutrition_diet_expert_system-main"
    exit 1
fi

# Add all files
echo ""
echo "Step 1: Staging files..."
git add .

# Commit
echo ""
echo "Step 2: Committing changes..."
git commit -m "Initial commit: Ready for deployment" || echo "Nothing to commit or already committed"

# Remove existing remote if it exists
echo ""
echo "Step 3: Setting up remote..."
git remote remove origin 2>/dev/null || true

# Add your GitHub remote
git remote add origin https://github.com/mengsae123/diet_expert_system.git

# Verify remote
echo ""
echo "Remote configured:"
git remote -v

# Push to GitHub
echo ""
echo "Step 4: Pushing to GitHub..."
git push -u origin master

echo ""
echo "================================"
echo "✓ SUCCESS!"
echo "================================"
echo ""
echo "Your code is now on GitHub!"
echo "Repository: https://github.com/mengsae123/diet_expert_system"
echo ""
echo "NEXT STEP: Deploy to Render.com"
echo "1. Go to: https://render.com"
echo "2. Sign up with GitHub"
echo "3. New Web Service"
echo "4. Connect: diet_expert_system"
echo "5. Click Create"
echo "6. Wait 5 minutes - Done!"
echo ""
