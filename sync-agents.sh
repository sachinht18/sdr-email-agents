#!/bin/bash

# Sync script for SDR Email Agents
# Usage: ./sync-agents.sh "commit message"

set -e

AGENT_DIR="$HOME/.claude/agents"
REPO_DIR="$HOME/sdr-email-agents"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔄 Syncing SDR Email Agents to GitHub${NC}"
echo ""

# Check if we're in the repo directory
cd "$REPO_DIR"

# Copy agent files from Claude to repo
echo -e "${BLUE}📋 Copying agent files...${NC}"
cp "$AGENT_DIR/sdr-cold-email-drafter.md" .
cp "$AGENT_DIR/cold-email-reviewer.md" .

# Check if there are changes
if git diff --quiet && git diff --cached --quiet; then
    echo -e "${GREEN}✅ No changes detected. Agents are already in sync.${NC}"
    exit 0
fi

# Show what changed
echo -e "${BLUE}📝 Changes detected:${NC}"
git diff --stat

# Get commit message
if [ -z "$1" ]; then
    echo -e "${RED}❌ Error: Commit message required${NC}"
    echo "Usage: ./sync-agents.sh \"your commit message\""
    exit 1
fi

COMMIT_MSG="$1"

# Stage changes
git add sdr-cold-email-drafter.md cold-email-reviewer.md

# Commit
echo -e "${BLUE}💾 Committing changes...${NC}"
git commit -m "$COMMIT_MSG"

# Push to GitHub
echo -e "${BLUE}🚀 Pushing to GitHub...${NC}"
git push origin main

echo ""
echo -e "${GREEN}✅ Sync complete! Agents updated on GitHub${NC}"
echo -e "${BLUE}📦 View at: https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\.git/\1/')${NC}"
