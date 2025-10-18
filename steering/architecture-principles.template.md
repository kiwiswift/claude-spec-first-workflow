# Architecture Principles

> **Purpose**: Define architecture standards and patterns for this project
> **Copy this file**: `cp architecture-principles.template.md architecture-principles.md` and customize

## Architecture Style

**Primary Architecture**: [Clean Architecture / Layered / Microservices / etc.]

**Core Principles**:
- Principle 1
- Principle 2
- Principle 3

## Layer Structure

Define your project's layers and dependencies:

### Domain Layer (Core)
**Location**: `src/lib/domain/`
**Contains**: Entities, Value Objects, Domain Events
**Dependencies**: None (zero external dependencies)
**Rules**:
- Pure business logic only
- No framework dependencies
- No infrastructure concerns

### Application Layer (Use Cases)
**Location**: `src/lib/application/`
**Contains**: Use Cases, Services, DTOs
**Dependencies**: Domain layer only
**Rules**:
- Orchestrates domain objects
- Defines application-specific business rules
- No UI or database code

### Infrastructure Layer
**Location**: `src/lib/infrastructure/`
**Contains**: Database, API clients, External services
**Dependencies**: Domain, Application layers
**Rules**:
- Implementation details
- Framework-specific code
- Database access code

### Presentation Layer (UI)
**Location**: `src/app/`, `src/components/`
**Contains**: Pages, Components, Hooks
**Dependencies**: Application, Infrastructure layers
**Rules**:
- UI logic only
- No business logic
- Uses dependency injection

## SOLID Principles

### Single Responsibility
- Each class/module has one reason to change
- Functions do one thing well

### Open/Closed
- Open for extension, closed for modification
- Use composition over inheritance

### Liskov Substitution
- Subtypes must be substitutable for base types

### Interface Segregation
- Many specific interfaces > one general interface
- Clients shouldn't depend on unused methods

### Dependency Inversion
- Depend on abstractions, not concretions
- Use dependency injection

## Design Patterns

### Required Patterns
List patterns that MUST be used:

- Repository Pattern (for data access)
- Dependency Injection (for loose coupling)
- [Add your required patterns]

### Recommended Patterns
List patterns that are encouraged:

- Factory Pattern (for complex object creation)
- Observer Pattern (for event handling)
- [Add your recommended patterns]

### Anti-Patterns to Avoid

List patterns or practices to avoid:

- ❌ Business logic in UI components
- ❌ Direct database access from UI
- ❌ God objects
- ❌ [Add your anti-patterns]

## Dependency Management

### Dependency Rules
- Inner layers never depend on outer layers
- Use interfaces to invert dependencies
- No circular dependencies

### Dependency Injection
**Container Location**: `src/lib/infrastructure/di/`
**Pattern**: [Constructor injection / Property injection / etc.]

## Code Organization

### Directory Structure
```
src/
├── lib/
│   ├── domain/         # Core business logic
│   ├── application/    # Use cases
│   └── infrastructure/ # Implementation details
├── app/                # UI routes (Next.js App Router)
├── components/         # React components
└── hooks/              # React hooks
```

### Module Organization
- Group by feature, not by type
- Each module is independently testable
- Clear public API via index files

## Error Handling

### Error Strategy
- Domain layer: Throw domain exceptions
- Application layer: Transform to application errors
- Infrastructure layer: Transform to domain/application errors
- UI layer: Display user-friendly messages

### Error Types
```typescript
// Example structure
DomainError          // Business rule violations
ValidationError      // Input validation
NotFoundError       // Resource not found
UnauthorizedError   // Permission denied
```

## State Management

**Strategy**: [Redux / Context / Zustand / etc.]

**Rules**:
- Business state in domain/application layers
- UI state in presentation layer
- No business logic in state management

## Testing Architecture

### Test Types Required
- Unit tests: Domain and Application layers (XX% coverage minimum)
- Integration tests: Infrastructure layer
- E2E tests: Critical user flows

### Test Organization
- Co-located with source: `__tests__/`
- Mirrors source structure
- One test file per source file

## Performance Considerations

- Lazy loading for routes
- Code splitting at [specify boundaries]
- Memoization for expensive calculations
- [Add your performance requirements]

## Security Architecture

- Authentication: [Your strategy]
- Authorization: [Your strategy]
- Data encryption: [Your requirements]
- Secret management: [Your approach]

## Scalability Considerations

- Horizontal scaling: [Yes/No and how]
- Caching strategy: [Your approach]
- Database optimization: [Your requirements]

## Migration Path

If evolving from legacy code:

**Current State**: [Description]
**Target State**: [Description]
**Migration Strategy**: [Your approach]

## Architecture Decision Records (ADRs)

**Location**: `docs/adr/`
**Format**: [Your format]
**When Required**: Major architectural decisions

## Non-Negotiable Architecture Rules

List rules that can NEVER be violated:

- [ ] Rule 1
- [ ] Rule 2
- [ ] Rule 3

## Recommended But Flexible

List guidelines that are encouraged but can be bent with good reason:

- Guideline 1
- Guideline 2

---

**Last Updated**: YYYY-MM-DD
**Applies To**: All new code and refactoring
**Review**: Quarterly or when project needs evolve
