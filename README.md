# 📋 Specification-First Development Workflow

### A Claude Code Plugin for Building Features the Right Way™

**Stop shipping broken code. Start shipping quality.**

This Claude Code plugin enforces a specification-first development workflow that ensures every feature, bug fix, and refactoring is thoroughly planned, properly implemented, and completely documented—before a single line of code is committed.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-blue)](https://docs.claude.com/en/docs/claude-code)
[![Version](https://img.shields.io/badge/version-1.3.0-green)](https://github.com/christianogontijo/claude-spec-first-workflow)

---

## ⚡ Quick Start

### Installation

Claude Code plugins can be installed using the `/plugin` command:

```bash
# In Claude Code, run:
/plugin install spec-first-workflow@christianogontijo

# Or for local development/testing:
/plugin install /path/to/claude-spec-first-workflow
```

**That's it!** The plugin auto-configures on first use.

### Your First Task

```bash
# Create a specification
/spec Fix the user profile page not updating after save

# Claude will:
# ✅ Analyze your codebase
# ✅ Identify root causes
# ✅ Create a detailed specification
# ✅ Propose a phased solution

# Review the spec, then approve:
"Looks good! Implement it."

# Claude implements with quality gates:
# ✅ Phase 1 complete - Tests: 100% passing
# ✅ Phase 2 complete - TypeScript: 0 errors
# ✅ All phases complete - Documentation generated
```

**That's it!** You now have a fully implemented, tested, and documented solution.

---

## 🚀 Key Features

### 🎨 Auto-Configuration

**No setup required.** The plugin detects your:

-   Tech stack (TypeScript, Python, Go, etc.)
-   Testing framework (Jest, pytest, etc.)
-   Linting tools (ESLint, flake8, etc.)
-   Architecture patterns (from your CLAUDE.md)

Then creates **project-specific** steering documents automatically.

### 📝 Comprehensive Specifications

Every task gets a complete spec including:

-   Problem statement and root cause analysis
-   Solution design with architecture diagrams
-   Phased implementation plan
-   Impact analysis (breaking changes, performance, security)
-   Success criteria and quality checklist
-   Alternatives considered and why not chosen

### 🔒 Non-Negotiable Quality Gates

After **every phase**, these must pass:

-   ✅ All tests passing (100%)
-   ✅ Type checking (0 errors)
-   ✅ Linting (0 warnings)
-   ✅ Build succeeds
-   ✅ Architecture principles maintained

**No exceptions. Ever.**

### 📊 Complete Documentation

Auto-generates:

-   `TASK.md` - Full specification
-   `IMPLEMENTATION-SUMMARY.md` - What was built
-   `PHASE-N-SUMMARY.md` - Per-phase details
-   Git commits with detailed messages
-   Progress tracking in `docs/PROGRESS.md`

### 🎯 Phased Implementation

Complex changes broken into logical, testable phases:

-   Each phase is independently verified
-   Quality gates after every phase
-   Easy to review and rollback if needed
-   Clear dependency mapping

### 🔄 Iterative Refinement

Specifications aren't set in stone:

-   Iterate on specs before implementing
-   Drafts saved in `_drafts/` folder
-   Full history preserved
-   User approval required before coding

---

## 📋 Available Commands

| Command                | Description          | When to Use                              |
| ---------------------- | -------------------- | ---------------------------------------- |
| `/spec <description>`  | Create specification | Starting any new task                    |
| `/implement <task-id>` | Implement from spec  | After spec approval                      |
| `/spec-and-implement`  | Full workflow        | Complete flow with review checkpoint     |
| `/setup-steering`      | Configure standards  | First time or updating project standards |
| `/validate-steering`   | Check steering docs  | After project changes                    |

## 🏷️ Task Naming Convention

Tasks are automatically classified and numbered using the format: `TASK-YYYYMMDD-TYPE###`

### Task Types:
- **FIX** - Bug fixes and corrections
- **FEAT** - New features and enhancements  
- **CHORE** - Maintenance, updates, configuration changes
- **REFACTOR** - Code restructuring without changing functionality
- **PERF** - Performance optimizations
- **TEST** - Test additions or improvements
- **DOCS** - Documentation updates

### Sequential Numbering:
Each type maintains its own sequence across all dates:
- `TASK-20251021-FIX001` → First bug fix
- `TASK-20251025-FIX002` → Second bug fix (different date, same sequence)
- `TASK-20251027-FEAT001` → First feature (independent sequence)
- `TASK-20251027-CHORE001` → First chore task

**The system automatically detects task type from your description and assigns the next sequential number.**

---

## 📁 What Gets Created

After using this workflow, your project will have:

```
your-project/
├── docs/
│   ├── PROGRESS.md                          # Centralized progress tracking
│   └── tasks/
│       ├── TASK-20251025-FIX001/            # First bug fix
│       ├── TASK-20251027-FIX002/            # Second bug fix
│       ├── TASK-20251025-FEAT001/           # First feature
│       └── TASK-20251027-CHORE001/          # First chore task
│           ├── TASK.md                      # Complete specification
│           ├── IMPLEMENTATION-SUMMARY.md    # Overall summary
│           ├── PHASE-1-SUMMARY.md          # Phase details
│           ├── PHASE-2-SUMMARY.md          # Phase details
│           └── _drafts/                    # Iteration history
│               ├── TASK-...-DRAFT-01.md
│               └── TASK-...-DRAFT-02.md
└── steering/                                # Plugin creates these
    ├── quality-standards.md                 # Your quality gates
    ├── architecture-principles.md           # Your architecture rules
    └── testing-strategy.md                  # Your testing requirements
```

---

## 🏗️ Project-Specific Steering Documents

**What makes this plugin special:** It adapts to YOUR project, not the other way around.

### Auto-Creation

On first use, the plugin:

1. Detects your tech stack (package.json, pyproject.toml, etc.)
2. Reads your CLAUDE.md (if exists) for project standards
3. Creates intelligent steering documents
4. Continues with your task

### Steering Documents Define:

-   **Quality Gates**: What must pass before code is committed
-   **Architecture Principles**: How code should be structured
-   **Testing Strategy**: What tests are required and when

### Examples:

**TypeScript/React Project:**

```markdown
## Quality Gates

-   ✅ 0 TypeScript errors (strict mode)
-   ✅ 0 ESLint warnings
-   ✅ 100% tests passing (Jest)
-   ✅ NO 'any' types allowed
```

**Python/FastAPI Project:**

```markdown
## Quality Gates

-   ✅ 0 mypy errors
-   ✅ 0 flake8 warnings
-   ✅ 100% tests passing (pytest)
-   ✅ Test coverage > 80%
```

**Customize anytime** by editing `.claude/workflows/spec-first/steering/*.md`

---

## 🎨 Real-World Workflow Example

### Scenario: Fix a Performance Bug

```bash
You: /spec User dashboard loads slowly with 100+ transactions

Claude:
Analyzing codebase...
✅ Found 15 files related to transaction rendering
✅ Identified root cause: N+1 query problem
✅ Created TASK-20251025-PERF001

Specification created with 3-phase solution:
  Phase 1: Add database indices
  Phase 2: Implement query batching
  Phase 3: Add pagination

Please review: docs/tasks/TASK-20251025-PERF001/TASK.md

You: "Add a phase for caching frequently accessed data"

Claude:
✅ Added Phase 4: Redis caching layer
✅ Updated specification

Ready to implement?

You: "Go ahead!"

Claude:
Implementing Phase 1: Database indices
✅ Added indices to transactions table
✅ Tests: 427/427 passing
✅ TypeScript: 0 errors
✅ Performance: Query time 850ms → 45ms

Implementing Phase 2: Query batching
✅ Implemented DataLoader pattern
✅ Tests: 432/432 passing
✅ Performance: Query time 45ms → 12ms

Implementing Phase 3: Pagination
✅ Added cursor-based pagination
✅ Tests: 438/438 passing
✅ Initial load: 100 items → 25 items

Implementing Phase 4: Redis caching
✅ Added Redis cache layer
✅ Tests: 445/445 passing
✅ Performance: Cached queries <5ms

All phases complete!

📊 Final Results:
- Load time: 2.5s → 150ms (94% faster)
- Tests: 445/445 passing
- TypeScript: 0 errors
- ESLint: 0 warnings

📝 Documentation:
- Specification: docs/tasks/TASK-20251025-PERF001/TASK.md
- Implementation: docs/tasks/TASK-20251025-PERF001/IMPLEMENTATION-SUMMARY.md

🎉 Committed with message:
perf: optimize dashboard loading with caching and pagination

TASK-20251025-PERF001: Dashboard Performance Optimization
[Full commit message with all details...]
```

---

## 🎯 Who This Is For

### Perfect For:

-   ✅ Teams maintaining legacy codebases
-   ✅ Solo developers who want discipline
-   ✅ Projects with strict quality requirements
-   ✅ Anyone tired of shipping broken code
-   ✅ Developers who value documentation
-   ✅ Projects using Clean Architecture

### Not For:

-   ❌ Quick prototypes or throwaway code
-   ❌ Teams that don't value documentation
-   ❌ Projects without tests
-   ❌ "Move fast and break things" culture

---

## 🔧 Advanced Features

### Dependency Mapping

Every specification includes a dependency map showing:

-   Which files depend on each other
-   What breaks if you change X
-   Hidden coupling in your codebase

### Rollback Strategies

Each phase includes:

-   Explicit rollback instructions
-   Risk assessment (low/medium/high)
-   Safe rollback procedures

### Progress Tracking

Centralized tracking with:

-   Task history and status
-   Commit hash links
-   Quality metrics per task
-   Impact summaries

### Template Customization

Override default templates:

```bash
# Copy template to your project
cp .claude/workflows/spec-first/templates/task-specification.md \
   .claude/templates/my-task-template.md

# Edit as needed
# Plugin will use your template
```

---

## 📊 Success Metrics

This workflow has been validated in production and delivers:

### Quality Standards

-   **Tests**: 100% passing (comprehensive coverage)
-   **Type Safety**: 0 errors, 0 warnings
-   **Code Quality**: Linting clean
-   **Architecture**: Clean Architecture maintained

### Process Benefits

-   **Phased Implementation**: Each phase independently verified
-   **Complete Documentation**: Never lose context
-   **Full Traceability**: Every change tracked to a task ID
-   **Confident Refactoring**: Specs guide safe changes

---

## 🤝 Contributing

We welcome contributions! This workflow is designed to evolve.

**Ways to contribute:**

1. 🐛 Report bugs or issues
2. 💡 Suggest new features
3. 📝 Improve documentation
4. 🎨 Share your templates
5. 🔧 Submit pull requests

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📚 Documentation

-   **[Installation Guide](INSTALL.md)** - Detailed setup instructions
-   **[Quick Start](QUICK-START.md)** - 5-minute tutorial
-   **[Examples](examples/)** - Real-world examples
-   **[Changelog](CHANGELOG.md)** - Version history
-   **[FAQ](#-frequently-asked-questions)** - Common questions

---

## ❓ Frequently Asked Questions

### How is this different from just asking Claude to build features?

**Without this plugin:**

-   Claude might miss edge cases
-   No structured specification
-   Inconsistent quality checks
-   Documentation is manual
-   Hard to review before coding

**With this plugin:**

-   Forced deep analysis first
-   Structured, complete specs
-   Automatic quality gates
-   Auto-generated documentation
-   Review checkpoint before coding

### Does this work with my tech stack?

**Yes!** The plugin auto-configures for:

-   **Languages**: TypeScript, JavaScript, Python, Go, Rust, Java, etc.
-   **Frameworks**: React, Next.js, FastAPI, Rails, etc.
-   **Testing**: Jest, Vitest, pytest, Go test, etc.
-   **Linting**: ESLint, Prettier, flake8, golangci-lint, etc.

If it's not detected, you can manually configure steering documents.

### Isn't writing specs too slow?

**Slower upfront, faster overall:**

-   Specs take 5-10 minutes
-   Implementation is faster (clear plan)
-   Debugging is minimal (quality gates)
-   No rewrites from misunderstandings

**Total time**: Usually faster than "just start coding"

### Can I use this for small tasks?

**Yes and no:**

-   Small bugs (< 3 steps): Maybe overkill
-   Medium tasks (3-10 steps): Perfect fit
-   Complex tasks (10+ steps): Absolutely essential

Use your judgment. The plugin works for any size, but shines on complexity.

### What if I want to change the spec during implementation?

**You can!**

-   Update the spec document
-   Explain why in IMPLEMENTATION-SUMMARY.md
-   Continue with implementation
-   Documentation shows the evolution

The spec is a guide, not a prison.

### Does this replace code review?

**No, it enhances it:**

-   Reviewers can read the spec first
-   Clear rationale for decisions
-   Quality gates already passed
-   Focus on design, not bugs

Code reviews become faster and more valuable.

### Can I use this on existing projects?

**Absolutely!**

-   Add the plugin to any project
-   It auto-configures to your existing setup
-   Start using it for new tasks
-   Gradually document existing code

No need to refactor everything first.

---

## 🌟 Why Developers Love This

> _"Finally, a workflow that matches how I should be working, not how I actually work."_
> — Developer who ships less bugs now

> _"The auto-generated docs are better than what I write manually. And it's automatic!"_
> — Developer who hates writing docs

> _"Quality gates forced me to fix issues I would have 'gotten to later' (never)."_
> — Honest developer

> _"Onboarding new devs is 10x easier. They just read the task specs and understand everything."_
> — Tech lead who's tired of explaining things

---

## 📜 License

MIT License - see [LICENSE](LICENSE) for details.

---

## 🔗 Links

-   **GitHub**: [christianogontijo/claude-spec-first-workflow](https://github.com/christianogontijo/claude-spec-first-workflow)
-   **Issues**: [Report a bug](https://github.com/christianogontijo/claude-spec-first-workflow/issues)
-   **Claude Code Docs**: [docs.claude.com/claude-code](https://docs.claude.com/en/docs/claude-code)

---

## 🚀 Get Started Now

```bash
# Install the plugin
/plugin install spec-first-workflow@christianogontijo

# Use it immediately
/spec "Your first task description here"
```

**Stop shipping broken code. Start shipping quality.**

---

**Version**: 1.3.0
**Type**: Claude Code Plugin
**License**: MIT
**Maintained**: ✅ Active
