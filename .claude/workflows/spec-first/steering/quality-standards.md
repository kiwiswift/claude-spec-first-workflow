# Quality Standards - Example Template

> **Project**: [Your Project Name]
> **Stack**: [Your Tech Stack]
> **Last Updated**: [Date]
>
> **Note**: This is an example steering document from the original project where this workflow was developed.
> When you run `/setup-steering`, this will be auto-configured for YOUR project.

## Quality Gates

All quality gates must pass after EVERY implementation phase. This is non-negotiable.

### Type Checking
```bash
# Command:
npm run typecheck

# Success criteria:
- ✅ 0 TypeScript errors
- ✅ 0 TypeScript warnings
- ✅ Strict mode enabled
- ✅ NO 'any' types allowed (including casting to 'any')
```

**IMPORTANT**: The use of TypeScript `any` type is strictly prohibited, including casting to `any` (e.g., `property as any`). If strong typing is not possible, the design should be reconsidered.

### Linting
```bash
# Command:
npm run lint

# Success criteria:
- ✅ 0 ESLint errors
- ✅ 0 ESLint warnings
```

ESLint must be free of errors and warnings at all times.

### Testing
```bash
# Command:
npm test

# Success criteria:
- ✅ 100% tests passing
- ✅ Tests are reliable and meaningful
- ✅ All new features have tests
- ✅ All bug fixes have regression tests
```

Solid test coverage is required for all features and components — tests must be reliable, meaningful, and run green before any code is committed.

### Build
```bash
# Command:
npm run build

# Success criteria:
- ✅ Build succeeds without errors
- ✅ No warnings in production build
```

## Code Quality Principles

### Naming Conventions
- ✅ All functions, properties, fields, and attributes must have clear, meaningful, and consistent names
- ✅ Names must accurately reflect their purpose
- Functions: camelCase, descriptive verbs (e.g., `calculateTotal`, `fetchUserData`)
- Components: PascalCase, noun phrases (e.g., `TransactionList`, `AccountSummary`)
- Constants: UPPER_SNAKE_CASE (e.g., `MAX_RETRY_ATTEMPTS`)
- Types/Interfaces: PascalCase (e.g., `TransactionData`, `UserProfile`)

### Code Organization
- One component per file
- Tests co-located with source in `__tests__/` directories
- Group by feature, not by type

### Maintainability
- ✅ New code should be written with maintainability in mind
- ✅ Avoid hacks, workarounds, or shortcuts that compromise structure
- ✅ Code must be easy to understand, modify, and debug

## Architecture Compliance

### Clean Architecture (Grade A- Target)
- ✅ No violations of Clean Architecture principles
- ✅ Proper layer separation (Domain, Application, Infrastructure, Presentation)
- ✅ Dependencies point inward only
- ✅ No business logic in infrastructure layer

### SOLID Principles
- ✅ All SOLID principles must be followed
- ✅ Single Responsibility: Each class/module has one reason to change
- ✅ Open/Closed: Open for extension, closed for modification
- ✅ Liskov Substitution: Subtypes substitutable for base types
- ✅ Interface Segregation: Many specific interfaces over one general
- ✅ Dependency Inversion: Depend on abstractions, not concretions

### Dependency Injection
- ✅ Use DI container: `src/lib/infrastructure/di/container.ts`
- ✅ No hardcoded repository instantiation
- ✅ Proper dependency inversion

## Non-Negotiable Requirements

These requirements can NEVER be compromised:

- [ ] TypeScript compilation free of errors and warnings
- [ ] ESLint free of errors and warnings
- [ ] All tests passing (green pipeline)
- [ ] NO `any` types (strictly prohibited)
- [ ] Clean Architecture principles maintained
- [ ] SOLID principles followed
- [ ] No business logic leakage in infrastructure layer

## Code Review Requirements

Code reviews should explicitly check for adherence to these principles — anything that falls short should be addressed before merging.

### Review Checklist
- [ ] All quality gates pass
- [ ] No `any` types used
- [ ] Clean Architecture maintained
- [ ] SOLID principles followed
- [ ] Tests are comprehensive and meaningful
- [ ] Code is maintainable and well-named
- [ ] No hacks or workarounds

## Documentation Requirements

- [ ] Complex algorithms explained with comments
- [ ] Non-obvious decisions documented
- [ ] Public APIs have clear documentation
- [ ] README updated when needed

## Performance Standards

- Time-to-interactive: Reasonable for web app
- Bundle optimization: Code splitting where appropriate
- Lazy loading: Used for routes and heavy components

## Currency Formatting

- ✅ Use centralized utility: `src/lib/utils/currency.ts`
- ✅ Never duplicate currency formatting logic
- ✅ Use `formatCurrency()` and related functions

## Development Workflow

- ✅ **Always check for TypeScript errors and failing tests**
- ✅ **Iterate until there are no issues**
- ✅ Quality gates are NOT optional
- ✅ Fix errors immediately, don't let them accumulate

---

**Pipeline Status**: Must be green before any commit
**Enforcement**: Non-negotiable at all times
**Review**: When project standards evolve
