# Commit Message Template

Use this template for commits related to specification-first development tasks.

## Format

```
<type>: <brief description> - <TASK-ID>

<Detailed description of what was implemented>

Phase 1: <Phase title>
<Phase summary - 1-2 sentences>

Phase 2: <Phase title>
<Phase summary - 1-2 sentences>

[Additional phases...]

Results:
- <Key metric 1>
- <Key metric 2>
- <Quality gate results>

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Type Values

- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code refactoring (no functionality change)
- `perf`: Performance improvement
- `test`: Adding or updating tests
- `docs`: Documentation changes only
- `chore`: Build process, dependencies, tooling

## Guidelines

### Brief Description (First Line)
- Keep under 72 characters
- Use imperative mood ("add" not "added")
- Don't end with a period
- Be specific but concise

### Detailed Description
- Explain WHAT and WHY, not HOW
- Include context for future developers
- Reference related issues/PRs if applicable

### Phase Summaries
- One section per implementation phase
- Start with phase title from specification
- 1-2 sentences summarizing changes
- Focus on business value, not technical details

### Results Section
- Include measurable outcomes
- List quality gates passed
- Include performance improvements if applicable
- Show before/after metrics when relevant

## Examples

### Example 1: Feature Implementation

```
feat: implement instant bulk operations with optimistic UI updates - TASK-20251018-BULKOPS001

Implemented 4-phase solution to fix bulk operation UX issues:

Phase 1: Fixed Account page "Function not implemented" errors
Added proper handleBulkUpdate and handleBulkDelete handlers to replace
stub functions with working implementations.

Phase 2: Simplified architecture by removing callback pattern
Updated useBulkOperations hook signature, removing callback parameters.
Updated all 6 handlers in TransactionsTableComponent and related hooks.
Updated 47 tests across 3 test files to match new architecture.

Phase 3: Implemented optimistic updates
Added immediate local state updates in useTransactionsPageData and
smart balance handling in Account page. Eliminates page reload and
scroll position loss.

Phase 4: TRUE optimistic updates for instant feedback
Reversed operation order so UI updates FIRST, then DB updates in
background. Achieves <50ms UI response time using fire-and-forget
pattern for background DB persistence.

Results:
- User-perceived latency: 1-2s → <50ms (~95% faster)
- UI blocking: eliminated (non-blocking background saves)
- All tests passing: 2859/2859
- 0 TypeScript errors, 0 ESLint errors
- Clean Architecture maintained

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Example 2: Bug Fix

```
fix: resolve infinite scroll pagination reset issue - TASK-20251019-SCROLL001

Fixed bug where infinite scroll would reset to page 1 when filtering
transactions, causing user frustration and lost context.

Phase 1: Add pagination state persistence
Implemented pagination state management in useTransactionFilters hook
to preserve current page when filters change.

Phase 2: Update scroll position restoration
Modified InfiniteScrollContainer to restore scroll position after
filter operations complete.

Results:
- Scroll position preserved across filter changes
- Pagination state maintained correctly
- Tests: 523/523 passing
- 0 TypeScript errors, 0 ESLint errors

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Example 3: Refactoring

```
refactor: extract transaction validation into domain layer - TASK-20251020-VALID001

Refactored transaction validation logic from infrastructure layer to
domain layer, improving Clean Architecture compliance and testability.

Phase 1: Create domain validation value objects
Created Money, TransactionDate, and EntityId value objects with built-in
validation rules. Moved business validation from repository to domain.

Phase 2: Update repositories to use value objects
Modified FirebaseTransactionRepository and MockTransactionRepository to
use new value objects. Removed validation logic from infrastructure.

Phase 3: Update application layer services
Updated TransactionService to work with value objects. Simplified error
handling now that validation is in domain.

Results:
- Clean Architecture Grade: B+ → A-
- Validation logic centralized in domain layer
- 80% reduction in repository code complexity
- Tests: 2859/2859 passing
- 0 TypeScript errors, 0 ESLint errors

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Tips

1. **Be specific**: "Fix bulk update bug" vs "Implement instant bulk operations with optimistic UI updates"
2. **Include metrics**: Show measurable improvements
3. **Reference the spec**: Task ID makes it traceable
4. **Explain phases**: Help future developers understand the progression
5. **Show quality**: Demonstrate that quality gates passed
6. **Use present tense for results**: "Tests pass" not "Tests passed"
