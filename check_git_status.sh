#!/bin/bash

echo "=========================================="
echo "Git Status Diagnostic"
echo "=========================================="
echo ""

# Check if in right directory
echo "1. Current directory:"
pwd
echo ""

# Check if git initialized
echo "2. Git initialized?"
if [ -d ".git" ]; then
    echo "✓ YES - Git repository exists"
else
    echo "✗ NO - Need to run: git init"
fi
echo ""

# Check git status
echo "3. Git status:"
git status 2>&1
echo ""

# Check remotes
echo "4. Git remotes:"
git remote -v 2>&1
echo ""

# Check branch
echo "5. Current branch:"
git branch 2>&1
echo ""

# Check commits
echo "6. Recent commits:"
git log --oneline -5 2>&1 || echo "No commits yet"
echo ""

echo "=========================================="
echo "What to do next:"
echo "=========================================="
echo ""

if [ ! -d ".git" ]; then
    echo "Run: git init"
fi

if ! git remote -v 2>/dev/null | grep -q "origin"; then
    echo "Run: git remote add origin https://github.com/mengsae123/diet_expert_system.git"
fi

if ! git log --oneline -1 >/dev/null 2>&1; then
    echo "Run: git add . && git commit -m 'Initial commit'"
fi

if [ -d ".git" ] && git remote -v 2>/dev/null | grep -q "origin" && git log --oneline -1 >/dev/null 2>&1; then
    echo "✓ Ready to push!"
    echo "Run: git push -u origin master"
fi

echo ""
