# Example Task: Dashboard Performance Optimization

This is a complete example of the Specification-First workflow in action.

## Scenario

User reports: "The dashboard is loading very slowly when there are 100+ transactions"

## Files in This Example

1. **TASK.md** - Complete specification created by `/spec` command
2. **IMPLEMENTATION-SUMMARY.md** - Summary of what was built
3. **PHASE-1-SUMMARY.md** - Details of database optimization phase
4. **PHASE-2-SUMMARY.md** - Details of query batching phase  
5. **PHASE-3-SUMMARY.md** - Details of pagination phase
6. **PHASE-4-SUMMARY.md** - Details of caching phase

## Workflow Used

```bash
# 1. Create specification
/spec User dashboard loads slowly with 100+ transactions

# 2. Review and refine
"Add a phase for caching frequently accessed data"

# 3. Implement
"Go ahead and implement!"

# Result: 4 phases implemented, 94% performance improvement
```

## Key Outcomes

- **Performance**: 2.5s → 150ms (94% faster)
- **Tests**: 445/445 passing (100%)
- **TypeScript**: 0 errors
- **ESLint**: 0 warnings
- **Documentation**: Complete and traceable

## What You Can Learn

1. How specifications are structured
2. How phases break down complex work
3. How quality gates are enforced
4. How documentation is auto-generated
5. How to track progress and decisions

## Try It Yourself

Use this as a template for your own tasks:

```bash
/spec Your problem description here
```

The workflow will guide you through the rest!
