# Getting Started with Specification-First Workflow

> 🚀 **From zero to your first quality-enforced feature in 10 minutes**

## Prerequisites

- Claude Code installed and running
- A project with a codebase (any language)
- Git repository (recommended)

## Step-by-Step Guide

### 1. Install the Plugin (30 seconds)

```bash
# In Claude Code, run:
/plugin install spec-first-workflow@christianogontijo
```

Verify it's installed by typing:
```bash
/spec
```

You should see an error asking for a description. That means it's working! ✅

### 2. Your First Specification (5 minutes)

Let's create a specification for a simple feature:

```bash
/spec Add a utility function to calculate the sum of an array of numbers
```

Claude will:
1. ✅ Analyze your project structure
2. ✅ Auto-create steering documents (first time only)
3. ✅ Create a complete specification
4. ✅ Propose implementation phases

You'll see output like:
```
⚙️ Setting up steering documents...

I detected this is a TypeScript project with:
- TypeScript strict mode
- ESLint configuration
- Jest testing

I've created steering documents based on your project.

---

Creating specification for: Add utility function...

Analysis complete:
✅ Found existing utilities in src/utils/
✅ Identified testing patterns
✅ Created TASK-20251025-FEAT001

Specification created with 2-phase solution:
  Phase 1: Implement sum function with type safety
  Phase 2: Add comprehensive tests

Please review: docs/tasks/TASK-20251025-FEAT001/TASK.md
```

### 3. Review the Specification (1 minute)

Open the generated specification:
```bash
cat docs/tasks/TASK-20251025-FEAT001/TASK.md
```

You'll see:
- Problem statement
- Solution design
- Implementation phases
- Quality checklist
- Success criteria

**Review it carefully!** This is your chance to:
- Ask questions
- Suggest changes
- Add requirements
- Refine the approach

### 4. Approve and Implement (2 minutes)

If the spec looks good:
```
You: "Looks great! Go ahead and implement it."
```

Claude will:
1. Implement Phase 1
2. Run tests ✅
3. Check TypeScript ✅
4. Run linter ✅
5. Implement Phase 2
6. Run tests again ✅
7. Generate documentation
8. Create commit (if requested)

You'll see progress like:
```
Implementing Phase 1: Utility function implementation
✅ Created src/utils/sum.ts
✅ Added type definitions
✅ Tests: 125/125 passing
✅ TypeScript: 0 errors
✅ ESLint: 0 warnings

Implementing Phase 2: Comprehensive tests
✅ Added edge case tests
✅ Added performance tests
✅ Tests: 132/132 passing
✅ Coverage: 100%

All phases complete!

📊 Final Results:
- Tests: 132/132 passing
- TypeScript: 0 errors
- ESLint: 0 warnings
- Files created: 2
- Documentation: Complete

Would you like me to create a commit?
```

### 5. Review the Output (1 minute)

Check what was created:

```bash
# The implementation
cat src/utils/sum.ts

# The documentation
cat docs/tasks/TASK-20251025-FEAT001/IMPLEMENTATION-SUMMARY.md

# The tests
cat src/utils/__tests__/sum.test.ts
```

Everything is:
- ✅ Fully tested
- ✅ Type-safe
- ✅ Linted
- ✅ Documented

---

## What Just Happened?

You experienced the complete Specification-First workflow:

1. **Analysis** → Claude understood your project
2. **Planning** → Created a detailed specification
3. **Review** → You approved the plan
4. **Implementation** → Phased, quality-gated coding
5. **Validation** → Automatic quality checks
6. **Documentation** → Auto-generated docs

**No broken code. No missing tests. No incomplete docs.**

---

## 🏷️ Understanding Task Names

Notice the task ID: `TASK-20251025-FEAT001`

- **TASK** - Fixed prefix
- **20251025** - Today's date (YYYYMMDD)
- **FEAT** - Automatically detected task type (new feature)
- **001** - Sequential number for this type

**Task Types:**
- **FIX** - Bug fixes: "Fix the dashboard not loading"
- **FEAT** - Features: "Add user authentication" 
- **CHORE** - Maintenance: "Update dependencies to latest versions"
- **REFACTOR** - Code restructuring: "Extract validation logic to domain layer"
- **PERF** - Performance: "Optimize database queries for dashboard"
- **TEST** - Testing: "Add integration tests for payment flow"
- **DOCS** - Documentation: "Update API documentation"

The system automatically classifies your description and maintains separate sequences for each type.

---

## Try Something More Complex

Now that you understand the basics, try a real feature:

```bash
/spec Add user authentication with JWT tokens and password hashing
```

Or fix a bug:

```bash
/spec Fix the infinite loop in the transaction processing service
```

Or refactor code:

```bash
/spec Refactor the user service to follow Clean Architecture principles
```

The workflow handles complexity by:
- Breaking it into phases
- Quality gates after each phase
- Clear rollback strategies
- Complete documentation

---

## Customize for Your Project

### Option 1: Use Auto-Generated Steering Docs

The plugin auto-created steering documents for you. They're good defaults based on your project.

**Location**: `.claude/workflows/spec-first/steering/`

### Option 2: Run Interactive Setup

For more control:

```bash
/setup-steering
```

Answer a few questions about your project:
- What quality gates do you want?
- What architecture patterns do you follow?
- What testing strategy do you use?

### Option 3: Manual Configuration

Edit the files directly:

```bash
# Your quality gates
vim .claude/workflows/spec-first/steering/quality-standards.md

# Your architecture principles
vim .claude/workflows/spec-first/steering/architecture-principles.md

# Your testing strategy (optional)
vim .claude/workflows/spec-first/steering/testing-strategy.md
```

---

## Common Workflows

### Bug Fix Workflow
```bash
# 1. Create spec
/spec Fix the memory leak in the dashboard component

# 2. Review and approve
"Looks good, implement it!"

# Result: Fixed + tested + documented
```

### Feature Workflow
```bash
# 1. Plan and implement together
/spec-and-implement Add dark mode toggle to settings

# 2. Review spec
"Add a phase for persisting user preference"

# 3. Approve
"Perfect, go ahead!"

# Result: Feature + tests + docs + commit
```

### Refactoring Workflow
```bash
# 1. Create spec
/spec Refactor payment service to use dependency injection

# 2. Review phases
"Can we do this in smaller phases?"

# 3. Refine and implement
"Yes, I've split it into 4 smaller phases"

# Result: Refactored + no regressions + documented
```

---

## Tips for Success

### 💡 Writing Good Descriptions

**Good**:
```bash
/spec Fix the dashboard loading slowly with 100+ transactions
/spec Add pagination to the user list with 50 items per page
/spec Refactor transaction validation into domain layer following DDD
```

**Less Good**:
```bash
/spec Fix dashboard  # Too vague
/spec Make it faster  # What is "it"?
/spec Add feature     # What feature?
```

### 💡 Iterating on Specs

It's OK to refine:
```
You: /spec Add user profile page

Claude: [Creates spec with 3 phases]

You: "Can you add a phase for profile image upload?"

Claude: [Updates spec with Phase 4]

You: "Perfect! Implement it."
```

### 💡 Trusting the Process

- Let quality gates catch issues
- Don't skip phases
- Review the spec before implementing
- Trust but verify the documentation

---

## Next Steps

1. **Read the [FAQ](README.md#frequently-asked-questions)** - Common questions answered
2. **Check out [examples](examples/)** - See real-world specifications
3. **Customize [steering docs](./claude/workflows/spec-first/steering/)** - Match your standards
4. **Join the [discussions](https://github.com/christianogontijo/claude-spec-first-workflow/discussions)** - Share your experience

---

## Need Help?

- **Documentation**: [README.md](README.md)
- **Installation Issues**: [INSTALL.md](INSTALL.md)
- **Quick Reference**: [QUICK-START.md](QUICK-START.md)
- **Report Bugs**: [GitHub Issues](https://github.com/christianogontijo/claude-spec-first-workflow/issues)

---

**You're ready! Start building better software.** 🚀

```bash
/spec Your next amazing feature
```
