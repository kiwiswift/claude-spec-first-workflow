# Installation Guide

## Quick Install

### Option 1: Direct Copy (Recommended)

1. **Copy the plugin directory to your project:**
   ```bash
   cp -r claude-spec-first-workflow/.claude/workflows/spec-first YOUR_PROJECT/.claude/workflows/
   ```

2. **That's it!** The workflow is now available in your project.

3. **Verify installation:**
   ```bash
   # In Claude Code, type:
   /spec
   ```

### Option 2: Clone and Link

1. **Clone this repository:**
   ```bash
   git clone https://github.com/YOUR-USERNAME/claude-spec-first-workflow.git
   cd claude-spec-first-workflow
   ```

2. **Symlink to your project:**
   ```bash
   ln -s $(pwd)/.claude/workflows/spec-first YOUR_PROJECT/.claude/workflows/spec-first
   ```

3. **Verify installation:**
   ```bash
   # In Claude Code, type:
   /spec
   ```

## First-Time Setup

### Zero Configuration Required! 🎉

The workflow automatically configures itself when you first use `/spec` or `/implement`:

1. **Detects your project stack** (TypeScript, Python, Go, etc.)
2. **Reads existing standards** (from CLAUDE.md if it exists)
3. **Creates steering documents** automatically
4. **Ready to use immediately!**

### Optional: Customize Steering Documents

If you want to customize the auto-generated steering documents:

```bash
# Run interactive setup
/setup-steering

# Or manually edit:
.claude/workflows/spec-first/steering/quality-standards.md
.claude/workflows/spec-first/steering/architecture-principles.md
```

## Available Commands

Once installed, you have access to:

- `/spec <description>` - Create a specification
- `/implement <task-id>` - Implement a specification in phases
- `/spec-and-implement <description>` - Full workflow with approval
- `/setup-steering` - Interactive steering document setup
- `/validate-steering` - Check if steering docs are up-to-date

## Verification

### Test the Installation

1. **Create a test specification:**
   ```bash
   /spec Add a hello world function to utils
   ```

2. **Check that it created:**
   - `docs/tasks/TASK-YYYYMMDD-CODE###/specification.md`
   - Steering documents (if first time)

3. **Validate steering docs:**
   ```bash
   /validate-steering
   ```

### Expected Directory Structure

After installation:

```
YOUR_PROJECT/
├── .claude/
│   └── workflows/
│       └── spec-first/
│           ├── commands/
│           │   ├── spec.md
│           │   ├── implement.md
│           │   ├── spec-and-implement.md
│           │   ├── setup-steering.md
│           │   └── validate-steering.md
│           ├── templates/
│           │   ├── task-specification.md
│           │   ├── implementation-summary.md
│           │   ├── phase-summary.md
│           │   └── commit-message.md
│           ├── steering/
│           │   ├── README.md
│           │   ├── quality-standards.template.md
│           │   └── architecture-principles.template.md
│           ├── manifest.json
│           └── README.md
```

## Upgrade Guide

### From v1.2.0 to v1.3.0

No breaking changes. New features:

1. **Steering document validator:**
   ```bash
   /validate-steering
   ```

2. **Dependency maps** automatically included in specifications

3. **Rollback strategies** for each implementation phase

### From v1.1.0 to v1.2.0

No breaking changes. Steering docs now auto-created on first use.

### From v1.0.0 to v1.1.0

**Action required:** Create steering documents:

```bash
/setup-steering
```

Or copy templates manually:

```bash
cp .claude/workflows/spec-first/steering/quality-standards.template.md \
   .claude/workflows/spec-first/steering/quality-standards.md

cp .claude/workflows/spec-first/steering/architecture-principles.template.md \
   .claude/workflows/spec-first/steering/architecture-principles.md
```

## Troubleshooting

### Commands Not Found

**Problem:** `/spec` command not recognized

**Solution:**
1. Verify the directory structure exists
2. Check that `manifest.json` is present
3. Restart Claude Code
4. Ensure files are in `.claude/workflows/spec-first/`

### Steering Documents Not Auto-Created

**Problem:** Steering docs weren't created automatically

**Solution:**
```bash
# Run interactive setup
/setup-steering

# Or quick mode
/setup-steering --quick
```

### Validation Warnings

**Problem:** `/validate-steering` shows warnings

**Solution:**
```bash
# Review the warnings
/validate-steering

# Update steering docs if project changed
# Edit: .claude/workflows/spec-first/steering/quality-standards.md

# Or re-run setup
/setup-steering
```

## Uninstallation

To remove the workflow:

```bash
rm -rf YOUR_PROJECT/.claude/workflows/spec-first
```

To keep steering documents for reference:

```bash
cp -r .claude/workflows/spec-first/steering /tmp/steering-backup
rm -rf .claude/workflows/spec-first
```

## Support

- **Issues:** https://github.com/YOUR-USERNAME/claude-spec-first-workflow/issues
- **Discussions:** https://github.com/YOUR-USERNAME/claude-spec-first-workflow/discussions
- **Documentation:** See README.md

## Next Steps

After installation:

1. **Read the Quick Start:** See [README.md](README.md#quick-start)
2. **Try an example:** `/spec Add user authentication`
3. **Customize steering docs:** Edit quality standards and architecture principles
4. **Validate setup:** `/validate-steering`

Happy coding! 🚀
