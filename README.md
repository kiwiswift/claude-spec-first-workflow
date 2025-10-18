# Specification-First Development Workflow

A systematic approach to building features, fixing bugs, and refactoring code with quality and maintainability in mind.

## 🎯 Overview

This workflow implements a **specification-first development** approach where:

1. **Problems are analyzed** before code is written
2. **Specifications are documented** and reviewed
3. **Implementation happens in phases** with quality gates
4. **Everything is tested** and verified
5. **Changes are traceable** with task IDs

This approach was battle-tested on **TASK-20251018-BULKOPS001** which achieved a **95% performance improvement** (1-2s → <50ms) with **0 errors** and **100% test pass rate**.

## 🚀 Quick Start

### First Time Setup (Automatic!)

The workflow **automatically configures itself** on first use:

```bash
# Just run /spec with your problem description
/spec Fix the account balance not updating after transaction deletion
```

The agent will:
1. ✅ Detect your project stack (TypeScript/Python/etc.)
2. ✅ Read your CLAUDE.md (if exists) for project standards
3. ✅ Auto-create steering documents with intelligent defaults
4. ✅ Continue with specification creation

**Or use guided setup:**
```bash
/setup-steering
```

### For New Tasks

```bash
# Create a specification (with required description)
/spec <problem description>

# Example:
/spec Fix the bulk update feature causing page reload

# Or create spec and implement in one flow
/spec-and-implement
```

### For Existing Tasks

```bash
# Implement from an approved spec
/implement TASK-20251018-BULKOPS001
```

## 📋 Available Commands

### `/spec` - Create Specification

Creates a comprehensive specification document for a bug fix, feature, or refactoring.

**When to use:**
- Starting a new task
- Planning future work
- Exploring solution approaches

**What it does:**
1. Analyzes your problem description
2. Examines the codebase
3. Identifies root causes
4. Creates a phased implementation plan
5. Documents everything in `docs/tasks/TASK-YYYYMMDD-CODE/`

**Output:**
- `docs/tasks/TASK-YYYYMMDD-CODE/TASK.md` - Complete specification

### `/implement <task-id>` - Implement from Spec

Implements a task based on an existing specification.

**When to use:**
- After a spec has been approved
- Resuming paused work
- Implementing someone else's spec

**What it does:**
1. Reads the specification
2. Implements each phase sequentially
3. Runs quality checks after each phase
4. Creates documentation
5. Makes a commit

**Quality gates (after each phase):**
- ✅ TypeScript: 0 errors
- ✅ ESLint: 0 warnings
- ✅ Tests: 100% passing

**Output:**
- `IMPLEMENTATION-SUMMARY.md` - Overall summary
- `PHASE-N-SUMMARY.md` - Per-phase details (for significant phases)
- Git commit with detailed message

### `/spec-and-implement` - Full Workflow

Combines specification creation and implementation with a review checkpoint.

**When to use:**
- Complete workflow from problem to solution
- Well-understood problems
- Want to review spec before implementation

**What it does:**
1. Creates specification
2. **Waits for your approval** ⚠️
3. Implements the solution
4. Creates all documentation
5. Makes a commit

### `/setup-steering` - Configure Project Standards

Interactive setup for project-specific steering documents (quality gates, architecture principles, testing requirements).

**When to use:**
- First time setup (though auto-creation works too!)
- Customizing quality gates for your project
- Updating architecture standards
- Setting up testing requirements

**What it does:**
1. Detects your project stack and configuration
2. Asks questions about your standards (interactive)
3. Creates customized steering documents:
   - `quality-standards.md` - Your quality gates
   - `architecture-principles.md` - Your architecture rules
   - `testing-strategy.md` - Your testing requirements
4. These documents control ALL workflow behavior

**Quick modes:**
```bash
/setup-steering              # Interactive guided setup
/setup-steering --quick      # Auto-create with defaults
/setup-steering --from-claude-md  # Extract from CLAUDE.md
```

**Output:**
- `.claude/workflows/spec-first/steering/quality-standards.md`
- `.claude/workflows/spec-first/steering/architecture-principles.md`
- `.claude/workflows/spec-first/steering/testing-strategy.md` (optional)

## 🎛️ Steering Documents (Auto-Configured!)

**NEW**: The workflow now auto-creates steering documents if they don't exist!

### What Are Steering Documents?

Steering documents define YOUR project's standards (not generic defaults):
- Quality gates (TypeScript errors? ESLint warnings? Test coverage?)
- Architecture principles (Clean Architecture? Layered? SOLID?)
- Testing strategy (Unit? Integration? E2E? Coverage requirements?)

### Auto-Creation Behavior

When you run `/spec` or `/implement` for the first time:

1. ✅ **Agent checks** for steering documents
2. ✅ **If found**: Uses them immediately
3. ✅ **If not found**: Auto-creates them by:
   - Detecting your stack (package.json, etc.)
   - Reading your CLAUDE.md (if exists)
   - Creating intelligent defaults
   - Informing you what was created

### Example Auto-Creation

```
⚙️ Setting up steering documents...

I detected this is a TypeScript/React/Next.js project with:
- TypeScript strict mode
- ESLint configuration
- Jest testing
- Clean Architecture (from CLAUDE.md)

I've created steering documents based on your project:
✅ quality-standards.md (TypeScript + ESLint + Jest requirements)
✅ architecture-principles.md (Clean Architecture A- grade)

📝 These documents now control all quality gates and standards.

Please review and customize:
  .claude/workflows/spec-first/steering/quality-standards.md
  .claude/workflows/spec-first/steering/architecture-principles.md

Or run: /setup-steering for guided interactive setup

Continuing with specification creation...
```

### Customizing Steering Documents

Edit the markdown files anytime:
```bash
.claude/workflows/spec-first/steering/
├── quality-standards.md       # Edit your quality gates
├── architecture-principles.md # Edit your architecture rules
└── testing-strategy.md        # Edit your testing requirements
```

Or run `/setup-steering` for guided setup.

## 📁 Project Structure

```
docs/tasks/
└── TASK-20251018-BULKOPS001/
    ├── TASK.md                      # Main specification
    ├── IMPLEMENTATION-SUMMARY.md    # Overall implementation summary
    ├── PHASE-1-SUMMARY.md          # Phase 1 details
    ├── PHASE-2-SUMMARY.md          # Phase 2 details
    ├── PHASE-N-SUMMARY.md          # Phase N details
    └── _drafts/                    # Specification drafts (iteration history)
        ├── TASK-...-ORIGINAL.md
        ├── TASK-...-REFACTORED.md
        └── TASK-...-FINAL.md
```

## 🏗️ Task ID Format

```
TASK-YYYYMMDD-CODE###
```

- **YYYYMMDD**: Date task was created
- **CODE**: Descriptive code (FEAT, BUG, INFRA, CHORE, etc.)
- **###**: Sequence number (001, 002, etc.)

**Examples:**
- `TASK-20251018-FEAT001` - Bulk operations enhancement
- `TASK-20251019-BUG002` - Authentication bug fix
- `TASK-20251020-CHORE003` - Performance optimization

## 📝 Document Templates

Templates are located in `.claude/workflows/spec-first/templates/`:

1. **`task-specification.md`** - Main spec document
   - Problem statement
   - Current/expected behavior
   - Root cause analysis
   - Phased solution
   - Success criteria
   - Quality checklist

2. **`implementation-summary.md`** - Implementation overview
   - Phase summaries
   - Files changed
   - Test results
   - Quality metrics

3. **`phase-summary.md`** - Phase-level details
   - Specific changes made
   - Quality check results
   - Before/after comparison

4. **`commit-message.md`** - Commit message format
   - Conventional commits style
   - Phase summaries
   - Metrics and results

## ✅ Quality Standards

### Code Quality (Non-Negotiable)

- ✅ **TypeScript**: 0 errors, 0 warnings
- ✅ **ESLint**: 0 errors, 0 warnings
- ✅ **Tests**: 100% passing, comprehensive coverage
- ✅ **No `any` types**: Strong typing required
- ✅ **Clean Code**: Meaningful names, clear logic

### Architecture Quality

- ✅ **Clean Architecture**: Proper layer separation
- ✅ **SOLID Principles**: All principles followed
- ✅ **Dependency Injection**: Used appropriately
- ✅ **No Business Logic Leakage**: Infrastructure stays pure

### Documentation Quality

- ✅ **Complete Specs**: All sections filled
- ✅ **Accurate Documentation**: Matches implementation
- ✅ **Traceable**: Task IDs in commits
- ✅ **Comprehensive**: Future developers can understand

## 🔄 Typical Workflow

### Bug Fix Example

```
1. User reports: "Bulk updates cause page reload and scroll reset"

2. Run: /spec
   → Claude analyzes codebase
   → Identifies root causes
   → Creates TASK-20251018-BULKOPS001
   → Proposes 3-phase solution

3. Review spec, provide feedback
   → Claude refines specification
   → Save drafts in _drafts/ folder

4. Approve: "Go ahead with implementation"

5. Claude implements:
   ✅ Phase 1: Fix Account page stubs
   ✅ Phase 2: Remove callback pattern
   ✅ Phase 3: Add optimistic updates
   → All quality gates pass

6. User feedback: "Still has 1-2s delay"

7. Claude adds Phase 4:
   ✅ TRUE optimistic updates
   → 95% performance improvement

8. Final commit with comprehensive message
```

### Feature Implementation Example

```
1. User requests: "Add dark mode toggle to settings"

2. Run: /spec-and-implement
   → Creates specification
   → Waits for approval

3. Review and approve

4. Claude implements in phases:
   ✅ Phase 1: Theme value objects in domain
   ✅ Phase 2: Theme service in application layer
   ✅ Phase 3: UI components in infrastructure
   ✅ Phase 4: Persistence and user preferences

5. All quality gates pass, documentation created, commit made
```

## 🎨 Best Practices

### Writing Good Specifications

1. **Be specific**: Include file paths, function names, line numbers
2. **Explain why**: Don't just say what, explain why
3. **Consider impact**: Think about what else might break
4. **Phase logically**: Each phase should be independently testable
5. **Set quality bars**: Include non-negotiable quality requirements

### Implementing from Specs

1. **One phase at a time**: Don't skip ahead
2. **Run tests frequently**: After every significant change
3. **Fix errors immediately**: Don't let them pile up
4. **Document as you go**: Don't wait until the end
5. **Ask questions**: If spec is unclear, ask user

### Reviewing Specifications

1. **Check completeness**: All sections filled?
2. **Verify root causes**: Analysis sound?
3. **Evaluate solution**: Phases make sense?
4. **Consider alternatives**: Better approach?
5. **Approve explicitly**: Give clear go/no-go

## 🔧 Converting to Claude Code Plugin

This workflow is structured to be easily converted to a Claude Code Plugin for use across multiple repositories.

### Current Structure (Local)
```
.claude/workflows/spec-first/
├── manifest.json              # Plugin metadata
├── commands/                  # Slash commands
│   ├── spec.md
│   ├── implement.md
│   └── spec-and-implement.md
├── templates/                 # Document templates
│   ├── task-specification.md
│   ├── implementation-summary.md
│   ├── phase-summary.md
│   └── commit-message.md
└── README.md                  # This file
```

### To Convert to Plugin

1. **Package the workflow:**
   ```bash
   cd .claude/workflows/spec-first
   tar -czf spec-first-workflow-v1.0.0.tar.gz .
   ```

2. **Create plugin repository:**
   ```bash
   mkdir claude-spec-first-workflow
   cd claude-spec-first-workflow
   cp -r .claude/workflows/spec-first/* .
   git init
   git add .
   git commit -m "Initial commit: Spec-First Workflow v1.0.0"
   ```

3. **Publish plugin** (when Claude Code supports plugins):
   - Follow Claude Code plugin publishing guidelines
   - Upload to Claude Code plugin registry
   - Other users can install with: `claude install spec-first-workflow`

### Plugin Benefits

- ✅ **Reusable**: Use across all your projects
- ✅ **Shareable**: Team members can use the same workflow
- ✅ **Versionable**: Track workflow improvements over time
- ✅ **Maintainable**: Update once, apply everywhere

## 📊 Success Metrics

From **TASK-20251018-BULKOPS001** (the task that validated this workflow):

### Performance
- **User-perceived latency**: 1-2s → <50ms **(95% faster)**
- **UI blocking**: Eliminated (non-blocking background saves)
- **Scroll position**: Preserved (no page reload)

### Quality
- **Tests**: 2859/2859 passing **(100%)**
- **TypeScript errors**: 0
- **ESLint warnings**: 0
- **Clean Architecture**: Maintained (Grade A-)

### Process
- **Phases**: 4 (each independently verified)
- **Documentation**: 100% complete
- **Traceability**: Full task history preserved
- **User satisfaction**: ⭐⭐⭐⭐⭐

## 🤝 Contributing

This workflow is designed to evolve. If you discover improvements:

1. Document what worked/didn't work
2. Propose changes to templates or commands
3. Update this README
4. Share learnings with the team

## 📚 References

- Original task: `docs/tasks/TASK-20251018-BULKOPS001/`
- Clean Architecture principles: CLAUDE.md
- Quality standards: CLAUDE.md
- Git conventions: `.claude/settings.local.json`

## 🆘 Troubleshooting

### "Command not found"
- Ensure commands are in `.claude/commands/` or use the full workflow path

### "Quality gates failing"
- Fix errors before proceeding to next phase
- Run `npm run typecheck && npm run lint && npm test`

### "Spec unclear or incomplete"
- Iterate on the spec before implementing
- Use `_drafts/` folder to track refinements
- Ask clarifying questions

### "Implementation deviates from spec"
- Document deviations in IMPLEMENTATION-SUMMARY.md
- Explain why deviation was necessary
- Get user approval for major changes

---

**Version**: 1.0.0
**Last Updated**: 2025-10-19
**Tested On**: TASK-20251018-BULKOPS001 ✅
