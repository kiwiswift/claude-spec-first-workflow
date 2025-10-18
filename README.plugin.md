# Specification-First Workflow - Claude Code Plugin

**Version**: 1.3.0
**Type**: Development Workflow Plugin
**License**: MIT

A systematic, specification-first development workflow for Claude Code that ensures quality, maintainability, and traceability for all code changes.

## 🎯 What is This?

This plugin provides a complete workflow system for building features, fixing bugs, and refactoring code with:

- ✅ **Specification-first approach** - Design before code
- ✅ **Intelligent auto-configuration** - Zero-config setup
- ✅ **Quality gates enforcement** - Project-specific standards
- ✅ **Phased implementation** - Testable incremental changes
- ✅ **Dependency mapping** - Understand blast radius
- ✅ **Rollback strategies** - Safe phase reversals
- ✅ **Complete documentation** - Everything tracked and documented

## 🚀 Quick Install

### Method 1: Clone into Your Project

```bash
cd your-project
mkdir -p .claude/workflows
cd .claude/workflows
git clone https://github.com/yourusername/claude-spec-first-workflow.git spec-first

# Create command symlinks
cd ../..
mkdir -p .claude/commands
cd .claude/commands
ln -sf ../workflows/spec-first/commands/spec.md spec.md
ln -sf ../workflows/spec-first/commands/implement.md implement.md
ln -sf ../workflows/spec-first/commands/spec-and-implement.md spec-and-implement.md
ln -sf ../workflows/spec-first/commands/setup-steering.md setup-steering.md
ln -sf ../workflows/spec-first/commands/validate-steering.md validate-steering.md
```

### Method 2: Copy Plugin Directory

```bash
# Copy this entire directory into your project
cp -r claude-spec-first-workflow your-project/.claude/workflows/spec-first

# Then create symlinks as shown above
```

## 📋 Available Commands

Once installed, you can use these slash commands in Claude Code:

| Command | Description | Example |
|---------|-------------|---------|
| `/spec <description>` | Create specification | `/spec Fix transaction table alignment issues` |
| `/implement <task-id>` | Implement from spec | `/implement TASK-20251019-TABLE001` |
| `/spec-and-implement` | Full workflow | Creates spec → wait for approval → implement |
| `/setup-steering` | Configure standards | Interactive setup for quality gates |
| `/validate-steering` | Validate config | Check if steering docs are current |

## ✨ Features

### 1. Zero-Config Auto-Setup
- Detects your project stack automatically
- Reads CLAUDE.md if exists
- Creates intelligent steering document defaults
- Works with TypeScript, Python, Go, and more

### 2. Project-Specific Steering Documents
- **Quality Gates**: Your type checking, linting, testing requirements
- **Architecture Principles**: Your architecture style and patterns
- **Testing Strategy**: Your test coverage and requirements

### 3. Comprehensive Specifications
- Problem statement and root cause analysis
- **Solution Design**: High-level architecture decisions
- **Dependency Map**: Which files depend on changes
- Phased implementation with **rollback strategies**
- Success criteria and quality checklists

### 4. Phased Implementation
- Implement one phase at a time
- Quality gates after each phase
- **Explicit rollback strategy** for each phase
- User validation before completion

### 5. Complete Documentation
- Task specifications (TASK.md)
- Implementation summaries
- Phase summaries
- Progress tracking (PROGRESS.md)

## 📖 Documentation

- **[README.md](./README.md)** - Full workflow documentation
- **[QUICK-START.md](./QUICK-START.md)** - 5-minute tutorial
- **[AUTO-CONFIGURATION-SUMMARY.md](./AUTO-CONFIGURATION-SUMMARY.md)** - How auto-config works
- **[IMPROVEMENTS-SUMMARY.md](./IMPROVEMENTS-SUMMARY.md)** - Recent enhancements
- **[PLUGIN-CONVERSION-GUIDE.md](./PLUGIN-CONVERSION-GUIDE.md)** - Plugin publishing guide

## 🎛️ Steering Documents

Steering documents control all workflow behavior:

```
.claude/workflows/spec-first/steering/
├── README.md                          # Steering docs guide
├── quality-standards.template.md      # Template for quality gates
├── architecture-principles.template.md # Template for architecture
├── testing-strategy.template.md       # Template for testing
│
# These are auto-created on first use:
├── quality-standards.md               # YOUR quality gates
├── architecture-principles.md         # YOUR architecture rules
└── testing-strategy.md                # YOUR testing requirements
```

## 🔥 Battle-Tested

Successfully used on **TASK-20251018-BULKOPS001**:
- **95% performance improvement** (1-2s → <50ms)
- **2859/2859 tests passing**
- **0 TypeScript errors, 0 ESLint warnings**
- **Complete documentation** generated

## 💡 Example Workflow

```bash
# 1. Create specification
/spec Refactor transaction table to use unified grid architecture

# Agent will:
# - Auto-create steering docs (if first time)
# - Analyze the codebase
# - Create TASK-20251019-TABLE001 specification
# - Include dependency map
# - Include rollback strategy for each phase
# - Wait for your approval

# 2. Review and approve
You: "Looks good! Proceed with implementation"

# 3. Agent implements
# - Phase 1: Create cell components
# - Phase 2: Build unified grid
# - Phase 3: Refactor components
# - Quality gates after each phase
# - STOPS when pipeline green

# 4. Agent waits for your testing
Agent: "Ready for testing! Please test: [specific scenarios]"

# 5. You test and approve
You: "Tested, everything works!"

# 6. Agent completes
# - Marks task complete
# - Creates commit
# - Updates PROGRESS.md
# - Task done!
```

## 🎓 What You Get

### For Each Task

```
docs/tasks/TASK-YYYYMMDD-CODE###/
├── TASK.md                    # Specification with:
│                              # - Solution Design
│                              # - Dependency Map
│                              # - Rollback Strategies per phase
├── IMPLEMENTATION-SUMMARY.md  # What was built
├── PHASE-1-SUMMARY.md        # Phase details
├── PHASE-2-SUMMARY.md        # Phase details
└── _drafts/                   # Iteration history
```

### Progress Tracking

```
docs/PROGRESS.md               # Centralized progress log with:
                               # - Task summaries
                               # - Commit hashes
                               # - Quality metrics
                               # - Links to full docs
```

## 🌟 Key Improvements (v1.3.0)

1. **Steering Document Validator** (`/validate-steering`)
   - Checks if steering docs are current
   - Detects project changes
   - Validates consistency
   - Suggests updates

2. **Dependency Map** (in specifications)
   - Shows which files depend on changes
   - Identifies blast radius
   - Risk assessment per dependency

3. **Rollback Strategies** (per phase)
   - Explicit git rollback commands
   - Database rollback steps
   - Non-revertible change warnings
   - Phase dependency chain

## 🛠️ Requirements

- Claude Code v1.0.0 or higher
- Git (for version control)
- Project with code (any language)

## 📦 What's Included

- 5 slash commands
- 4 document templates
- 3 steering document templates
- Complete documentation
- Auto-configuration logic
- Validation tools

## 🤝 Contributing

Contributions welcome! See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

## 📄 License

MIT License - see [LICENSE](./LICENSE) file.

## 🆘 Support

- **Documentation**: See README.md in this directory
- **Issues**: GitHub Issues (if published)
- **Questions**: Create a discussion

## 🔗 Links

- Full README: [README.md](./README.md)
- Quick Start: [QUICK-START.md](./QUICK-START.md)
- Auto-Config Guide: [AUTO-CONFIGURATION-SUMMARY.md](./AUTO-CONFIGURATION-SUMMARY.md)

---

**Ready to build quality software?** Install the plugin and run `/spec <your problem>`!
