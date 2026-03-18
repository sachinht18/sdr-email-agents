# SDR Email Agents for Claude Code

Two specialized Claude Code agents for drafting and reviewing outbound cold emails with best-in-class SDR practices.

## 🎯 Agents

### 1. SDR Cold Email Drafter
**File:** `sdr-cold-email-drafter.md`

An elite SDR email drafter that creates concise, signal-driven cold emails following proven B2B outbound best practices.

**Key Features:**
- Starts with specific account signals (funding, hiring, launches)
- Maintains 75-120 word count
- One clear idea per sentence
- Bans hype words and generic flattery
- Includes proof or concrete capabilities
- Low-friction CTAs

### 2. Cold Email Reviewer
**File:** `cold-email-reviewer.md`

A strict quality gate that reviews cold emails against 8 critical criteria before sending.

**Review Criteria:**
- Account signal opener
- Word count (75-120 words)
- One idea per sentence
- Structural order
- No hype words
- Question count (max 1)
- Declinable CTA
- Metric attribution

## 🚀 Installation

1. **Copy agents to Claude Code:**
   ```bash
   cp sdr-cold-email-drafter.md ~/.claude/agents/
   cp cold-email-reviewer.md ~/.claude/agents/
   ```

2. **Verify installation:**
   ```bash
   claude /agents
   ```

## 📖 Usage

### Draft → Review → Rewrite Workflow

```bash
# In Claude Code:
# 1. Draft initial email
Use sdr-cold-email-drafter to draft a cold email for [prospect details]

# 2. Review the draft
Use cold-email-reviewer to review the draft

# 3. Rewrite based on feedback
Use sdr-cold-email-drafter to rewrite based on reviewer feedback
```

### Example

**Input:**
```
Prospect: Arjun, Head of Sales at FintechCo
Signal: Hired 6 SDRs in last 45 days, expanded to Southeast Asia
Product: Helps sales teams handle complex product questions during live conversations
```

**Output:** See [examples/](examples/) directory

## 🔧 Customization

### Modify Rules

Edit the agent `.md` files to customize:

**Drafter:**
- Word count range (line 14)
- Banned phrases (line 25)
- Structure requirements (lines 18-23)
- Style guidelines (lines 34-40)

**Reviewer:**
- Review checklist criteria (lines 16-37)
- Priority fix limit (line 54)
- Review standards (lines 38-43)

### Agent Memory

Both agents have persistent memory that learns from usage:
```
~/.claude/agent-memory/sdr-cold-email-drafter/MEMORY.md
~/.claude/agent-memory/cold-email-reviewer/MEMORY.md
```

## 🔄 Keeping Agents in Sync

### Option 1: Use Sync Script (Recommended)

```bash
# After editing agents in ~/.claude/agents/
./sync-agents.sh "Added new banned phrases"
```

This will:
- Copy updated agents to this repo
- Commit changes
- Push to GitHub

### Option 2: Manual Sync

```bash
# Copy from Claude to repo
cp ~/.claude/agents/*.md .

# Commit and push
git add *.md
git commit -m "Updated agent configurations"
git push origin main
```

### Option 3: Use Symlinks

```bash
# Link repo files to Claude directory
ln -sf ~/sdr-email-agents/sdr-cold-email-drafter.md ~/.claude/agents/
ln -sf ~/sdr-email-agents/cold-email-reviewer.md ~/.claude/agents/

# Now editing in either location syncs automatically
```

## 📊 Improvement Workflow

1. **Test agents** with real prospect scenarios
2. **Note what works/doesn't work**
3. **Update agent `.md` files**
4. **Run sync script** to push to GitHub
5. **Review agent memory files** for learned patterns

## 🧪 Testing

Create test scenarios in `examples/` directory with:
- Prospect details
- Account signals
- Expected output quality

## 🤝 Contributing

Improvements welcome! Please:
1. Test changes with multiple scenarios
2. Document the improvement rationale
3. Update examples if needed

## 📝 License

MIT License - Feel free to fork and customize for your team

## 🔗 Related

- [Claude Code Documentation](https://docs.anthropic.com/claude/docs)
- [Cold Email Best Practices](./docs/best-practices.md)

---

**Last Updated:** 2026-03-18
**Version:** 1.0.0
