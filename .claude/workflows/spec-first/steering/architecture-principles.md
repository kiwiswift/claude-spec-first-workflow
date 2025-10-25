# Architecture Principles - Example Template

> **Project**: [Your Project Name]
> **Architecture**: [Your Architecture Pattern]
> **Last Updated**: [Date]
>
> **Note**: This is an example steering document from the original project where this workflow was developed.
> When you run `/setup-steering`, this will be auto-configured for YOUR project.

## Architecture Overview

This project follows **Clean Architecture** and **SOLID** principles to ensure long-term stability, scalability, and maintainability.

### Why This Matters

- **Maintainability**: Separated concerns make code easier to understand, modify, and debug
- **Testability**: Core business logic is independent of UI and database, enabling robust unit testing
- **Scalability**: New features can be added with confidence without breaking existing code

## Layer Structure

The application is organized into concentric layers with a strict dependency rule: **dependencies only point inwards**.

### 1. Domain (Core) Layer

**Location**: `src/lib/domain/`

**Contains**:
- **Entities**: `Transaction`, `Account` (rich domain objects with business methods)
- **Value Objects**: `Money`, `TransactionDate`, `EntityId`
- **Business Rules**: Domain validation and constraints

**Dependencies**: ZERO external dependencies (most stable layer)

**Rules**:
- ✅ Pure business logic only
- ✅ Rich domain model with business methods
- ✅ No framework dependencies
- ✅ No infrastructure concerns
- ✅ Proper domain validation
- ❌ NO database code
- ❌ NO UI code
- ❌ NO external service calls

**Example**:
```typescript
// Rich domain entity with business logic
const transaction = Transaction.create({
  amount: Money.create(100.5),
  date: TransactionDate.today(),
  description: 'Grocery shopping',
});

const splitTransaction = transaction.split([...]); // Business method
const clearedTransaction = transaction.clear();     // Business method
```

### 2. Application (Use Cases) Layer

**Location**: `src/lib/application/`

**Contains**:
- **Services**: `TransactionService` (business logic orchestration)
- **Use Cases**: Application-specific business rules
- **DTOs**: Data Transfer Objects

**Dependencies**: Domain layer only

**Rules**:
- ✅ Orchestrates domain objects
- ✅ Application-specific business rules
- ✅ Proper business logic (not in infrastructure)
- ❌ NO UI code
- ❌ NO database implementation details

**Example**: Transfer handling in `TransactionService`, not in repositories

### 3. Infrastructure Layer

**Location**: `src/lib/infrastructure/`

**Contains**:
- **Repositories**: `FirebaseTransactionRepository`, `BaseMockRepository`
- **Database**: Firebase client
- **External Services**: API integrations
- **Dependency Injection**: DI container

**Dependencies**: Domain and Application layers

**Rules**:
- ✅ Implementation details only
- ✅ Use base repository classes (`BaseFirebaseRepository`, `BaseMockRepository`)
- ✅ Proper error handling and validation
- ✅ No business logic (moved to Application layer)
- ❌ NO business logic here

**Example**: Repositories use `BaseFirebaseRepository<T>` which provides 80% code reduction

### 4. Presentation Layer (UI)

**Location**: `src/app/`, `src/components/`, `src/hooks/`

**Contains**:
- **Pages**: Next.js App Router pages
- **Components**: React components
- **Hooks**: React hooks

**Dependencies**: Application and Infrastructure layers via DI

**Rules**:
- ✅ UI logic only
- ✅ Use dependency injection (`useDI()` hook)
- ✅ No business logic in components
- ❌ NO direct repository instantiation
- ❌ NO business logic

**Example**:
```typescript
// ✅ Correct: Use DI container
import { useDI } from '@/lib/infrastructure/di/container';

function MyComponent() {
  const { transactionRepository } = useDI();
  // Use repository...
}

// ❌ Avoid: Direct instantiation
const repo = new FirebaseTransactionRepository();
```

## SOLID Principles

All five SOLID principles must be followed:

### Single Responsibility Principle
- Each class/module has ONE reason to change
- Functions do one thing well
- Clear separation of concerns

### Open/Closed Principle
- Open for extension, closed for modification
- Use composition over inheritance
- Extend behavior without modifying existing code

### Liskov Substitution Principle
- Subtypes must be substitutable for base types
- Derived classes honor base class contracts

### Interface Segregation Principle
- Many specific interfaces > one general interface
- Clients don't depend on methods they don't use

### Dependency Inversion Principle
- Depend on abstractions, not concretions
- High-level modules don't depend on low-level modules
- Use dependency injection

## Design Patterns

### Required Patterns

- **Repository Pattern**: All data access
- **Dependency Injection**: For loose coupling (DI container)
- **Value Objects**: For domain concepts (`Money`, `TransactionDate`)
- **Rich Domain Model**: Entities with business methods

### Base Classes

Use base repository classes to reduce duplication:

- `BaseFirebaseRepository<T>`: 80% code reduction for Firebase repositories
- `BaseMockRepository<T>`: 80% code reduction for mock repositories
- Comprehensive error handling and validation built-in

### Anti-Patterns to Avoid

- ❌ Anemic domain model (avoid)
- ❌ Business logic in UI components
- ❌ Business logic in infrastructure layer
- ❌ Direct database access from UI
- ❌ God objects
- ❌ Hardcoded repository instantiation

## Dependency Injection

### DI Container

**Location**: `src/lib/infrastructure/di/container.ts`

**Usage**: React Context provider for UI layer

**Rules**:
- ✅ All repositories accessed via DI
- ✅ No hardcoded instantiation
- ✅ Proper dependency inversion

### Example
```typescript
// In UI components
const { transactionRepository, accountRepository } = useDI();

// In tests
const mockRepo = new MockTransactionRepository();
```

## Error Handling

- **Domain layer**: Throw domain exceptions
- **Application layer**: Transform to application errors
- **Infrastructure layer**: Transform to domain/application errors
- **UI layer**: Display user-friendly messages

## Testing Architecture

### Test Coverage by Layer
- **Domain layer**: High coverage (business logic is critical)
- **Application layer**: High coverage (use cases are critical)
- **Infrastructure layer**: Integration tests
- **UI layer**: Component tests + E2E for critical paths

### Test Organization
- Co-located with source: `__tests__/`
- One test file per source file
- Use factories for test data

## Recent Improvements (2025-07-04)

The codebase achieved **Grade A- Clean Architecture** with these improvements:

1. ✅ Dependency Injection Container
2. ✅ Rich Domain Model (entities + value objects)
3. ✅ Base Repository Classes (80% code reduction)
4. ✅ Business Logic Extraction (to Application layer)
5. ✅ Currency Formatting Utility (centralized)

## Current Architecture Grade: A- (90/100)

**To reach A+**, continue:
- Eliminating any remaining business logic from infrastructure
- Enhancing domain model richness
- Improving test coverage in domain layer

## Non-Negotiable Architecture Rules

- [ ] Dependencies only point inward
- [ ] No business logic in infrastructure layer
- [ ] No business logic in UI layer
- [ ] Use DI container for all repositories
- [ ] Follow SOLID principles
- [ ] Maintain Clean Architecture layering

## Violations Result In

- Code review rejection
- Refactoring required before merge
- Architecture degradation (must be prevented)

---

**Current Grade**: A- (90/100)
**Target Grade**: A+ (95/100)
**Review**: Quarterly or when refactoring
**Enforcement**: Code review and architecture validation
