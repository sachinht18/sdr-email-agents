# Quick Setup Guide

## ✅ What's Already Done

Your SDR email agents are now on GitHub at:
**https://github.com/sachinht18/sdr-email-agents**

The repository includes:
- `sdr-cold-email-drafter.md` - Agent for drafting emails
- `cold-email-reviewer.md` - Agent for reviewing emails
- `sync-agents.sh` - Script to sync improvements to GitHub
- `README.md` - Full documentation
- `examples/` - Example workflows

## 🔄 How the Sync Workflow Works

### Your Agents Live in Two Places:

1. **Active Location (Claude Code uses this):**
   ```
   ~/.claude/agents/
   ├── sdr-cold-email-drafter.md
   └── cold-email-reviewer.md
   ```

2. **GitHub Backup (version controlled):**
   ```
   ~/sdr-email-agents/
   ├── sdr-cold-email-drafter.md
   └── cold-email-reviewer.md
   ```

### When You Improve an Agent:

**Option A: Edit in Claude directory, then sync to GitHub**
```bash
# 1. Edit the agent
vim ~/.claude/agents/sdr-cold-email-drafter.md

# 2. Sync to GitHub
cd ~/sdr-email-agents
./sync-agents.sh "Added new banned phrases for hype words"
```

**Option B: Edit in repo, then sync to Claude**
```bash
# 1. Edit in repo
cd ~/sdr-email-agents
vim sdr-cold-email-drafter.md

# 2. Copy to Claude
cp *.md ~/.claude/agents/

# 3. Commit to GitHub
git add *.md
git commit -m "Updated agent rules"
git push
```

**Option C: Use symlinks (recommended for seamless sync)**
```bash
# Remove copies and create symlinks
rm ~/.claude/agents/sdr-cold-email-drafter.md
rm ~/.claude/agents/cold-email-reviewer.md

ln -s ~/sdr-email-agents/sdr-cold-email-drafter.md ~/.claude/agents/
ln -s ~/sdr-email-agents/cold-email-reviewer.md ~/.claude/agents/

# Now editing in either location automatically syncs!
# Just commit and push when ready:
cd ~/sdr-email-agents
git add *.md
git commit -m "Your changes"
git push
```

## 🚀 Quick Commands

```bash
# View current agents
claude /agents

# Test the workflow
# (In Claude Code, just say:)
# "Use sdr-cold-email-drafter to draft an email for [prospect]"

# Sync improvements to GitHub
cd ~/sdr-email-agents
./sync-agents.sh "Your commit message"

# Pull latest from GitHub
cd ~/sdr-email-agents
git pull
cp *.md ~/.claude/agents/

# Check what changed
cd ~/sdr-email-agents
git log --oneline
git diff
```

## 📝 Making Improvements

1. **Test the agents** with real scenarios
2. **Note what needs improvement**
3. **Edit the `.md` files**:
   - Update rules (word count, banned phrases, etc.)
   - Refine instructions
   - Add examples
4. **Sync to GitHub** using `sync-agents.sh`
5. **The agents learn over time** in their memory files

## 🔗 Links

- **Your Repo:** https://github.com/sachinht18/sdr-email-agents
- **Agent Memory:** `~/.claude/agent-memory/[agent-name]/MEMORY.md`
- **Claude Code Docs:** https://docs.anthropic.com/claude/docs

---

**Next Steps:**
1. Consider using symlinks (Option C above) for seamless editing
2. Test the agents with different prospect scenarios
3. Document improvements as you make them
4. Share with your team!
