# Quick Start Guide - Specification-First Workflow

## 30-Second Overview

This workflow helps you build features, fix bugs, and refactor code with **zero errors** and **comprehensive documentation**.

**Just type:**
- `/spec <description>` - Plan a task (description required)
- `/implement <task-id>` - Build a task
- `/spec-and-implement` - Plan + build in one flow

## 5-Minute Tutorial

### Example: Fix a Bug

**1. Create specification with problem description**
```
You: /spec Fix the bulk update feature causing page reload and scroll position loss
```

**Note**: The description is REQUIRED. Don't type `/spec` alone - always include a description of what you want to fix/build.

Claude will:
- ✅ Analyze your codebase
- ✅ Find root causes
- ✅ Create `docs/tasks/TASK-20251018-BULKOPS001/TASK.md`
- ✅ Propose a phased solution

**3. Review and refine**
```
Claude: "Here's the specification. Phase 1: Fix stubs, Phase 2: Remove callbacks..."
You: "Looks good, but can you add a phase for performance optimization?"
Claude: "Absolutely! I've added Phase 4 for optimistic updates."
```

**4. Approve**
```
You: "Perfect! Go ahead and implement it."
```

**5. Watch it build**
```
Claude:
✅ Phase 1 complete - Tests: 2859/2859 passing
✅ Phase 2 complete - TypeScript: 0 errors
✅ Phase 3 complete - ESLint: 0 warnings
✅ Phase 4 complete - Performance: 95% faster!
```

**6. Done!**
- Bug fixed ✅
- Tests passing ✅
- Documentation complete ✅
- Commit made ✅

## Commands Cheat Sheet

| Command | Use When | Output |
|---------|----------|--------|
| `/spec` | Planning a new task | Specification document |
| `/implement TASK-ID` | Have approved spec | Code + docs + commit |
| `/spec-and-implement` | Want full workflow | Everything above |

## What Gets Created

### After `/spec`:
```
docs/tasks/TASK-20251018-BULKOPS001/
└── TASK.md  # Complete specification
```

### After `/implement`:
```
docs/tasks/TASK-20251018-BULKOPS001/
├── TASK.md                    # Original spec
├── IMPLEMENTATION-SUMMARY.md  # What was built
├── PHASE-1-SUMMARY.md        # Phase details
├── PHASE-2-SUMMARY.md        # Phase details
└── _drafts/                  # Iteration history
```

## Quality Guarantees

Every task completion guarantees:
- ✅ **0 TypeScript errors**
- ✅ **0 ESLint warnings**
- ✅ **100% tests passing**
- ✅ **Clean Architecture maintained**
- ✅ **Full documentation**

## Real Example

**TASK-20251018-BULKOPS001**:
- **Problem**: Bulk updates caused page reload and scroll loss
- **Solution**: 4-phase optimistic update implementation
- **Result**: 95% faster (1-2s → <50ms), 0 errors, 2859/2859 tests passing

See `docs/tasks/TASK-20251018-BULKOPS001/` for full example.

## Next Steps

1. **Try it now**: `/spec "add dark mode to settings"`
2. **Read more**: [README.md](./README.md)
3. **See example**: `docs/tasks/TASK-20251018-BULKOPS001/`

## Tips

💡 **Iterate on specs**: It's OK to refine the specification multiple times
💡 **One phase at a time**: Each phase is tested independently
💡 **Quality first**: Fix errors immediately, don't let them pile up
💡 **Ask questions**: If anything is unclear, just ask

---

**Ready to build something awesome?** Type `/spec` and describe your task!
