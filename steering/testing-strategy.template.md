# Testing Strategy

> **Purpose**: Define testing requirements and conventions for this project
> **Copy this file**: `cp testing-strategy.template.md testing-strategy.md` and customize

## Testing Philosophy

**Our Approach**: [Test-Driven Development / Behavior-Driven Development / Test After / etc.]

**Core Beliefs**:
- Belief 1 (e.g., "Tests are documentation")
- Belief 2 (e.g., "100% coverage is not the goal, meaningful coverage is")
- Belief 3

## Test Types and Requirements

### Unit Tests

**Purpose**: Test individual functions/classes in isolation
**Location**: `src/**/__tests__/*.test.ts`
**Framework**: [Jest / Vitest / etc.]

**Requirements**:
- Minimum coverage: XX%
- Test file naming: `ComponentName.test.ts`
- Mock external dependencies
- Fast execution (< X ms per test)

**What to Test**:
- ✅ Business logic
- ✅ Edge cases
- ✅ Error handling
- ✅ Domain entities and value objects
- ❌ External libraries
- ❌ Framework code

### Integration Tests

**Purpose**: Test interaction between modules
**Location**: `src/**/__tests__/*.integration.test.ts`
**Framework**: [Same as unit tests]

**Requirements**:
- Test realistic scenarios
- Use test database/fixtures
- Clean up after each test

**What to Test**:
- ✅ Repository implementations
- ✅ API integrations
- ✅ Database queries
- ✅ Service layer interactions

### E2E Tests

**Purpose**: Test complete user workflows
**Location**: `tests/e2e/`
**Framework**: [Playwright / Cypress / etc.]

**Requirements**:
- Critical user paths only
- Run in CI/CD pipeline
- Stable and reliable

**What to Test**:
- ✅ Happy paths for core features
- ✅ Authentication flows
- ✅ Critical business processes
- ❌ Every possible variation

## Test Coverage Standards

### Overall Coverage
- Minimum: XX%
- Target: XX%
- Critical paths: 100%

### Per-Layer Coverage
- Domain layer: XX% (higher threshold)
- Application layer: XX%
- Infrastructure layer: XX%
- UI layer: XX% (may be lower)

### Coverage Exclusions
Files/patterns excluded from coverage requirements:
- `*.config.ts`
- `*.d.ts`
- `__tests__/*`
- [Add your exclusions]

## Test Structure and Patterns

### Test File Structure
```typescript
describe('ComponentName', () => {
  describe('methodName', () => {
    it('should do X when Y', () => {
      // Arrange
      // Act
      // Assert
    });

    it('should throw error when invalid input', () => {
      // Test error cases
    });
  });
});
```

### Naming Conventions
- Test suites: Component/function name
- Test cases: "should [expected behavior] when [condition]"
- Variables: Descriptive, not abbreviated

### Arrange-Act-Assert Pattern
```typescript
it('should calculate total correctly', () => {
  // Arrange: Set up test data
  const items = [{ price: 10 }, { price: 20 }];

  // Act: Execute the function
  const total = calculateTotal(items);

  // Assert: Verify the result
  expect(total).toBe(30);
});
```

## Mocking Strategy

### What to Mock
- External APIs
- Database calls
- File system operations
- Time/dates
- Random number generation

### What NOT to Mock
- Code you own and control
- Simple utilities
- Pure functions

### Mocking Tools
- [jest.mock / vi.mock / etc.]
- [MSW for API mocking / etc.]
- [Your mocking library]

## Test Data Management

### Test Fixtures
**Location**: `src/**/__tests__/fixtures/`
**Format**: [JSON / TypeScript / etc.]

### Test Database
**Strategy**: [In-memory / Docker / etc.]
**Reset Strategy**: [Before each test / After each suite / etc.]

### Factories and Builders
Use factories for creating test data:
```typescript
// Example
const user = UserFactory.create({ name: 'Test User' });
const transaction = TransactionBuilder()
  .withAmount(100)
  .cleared()
  .build();
```

## Performance Testing

### Unit Test Performance
- Maximum duration: X ms per test
- Test suite timeout: X minutes
- Fail slow tests: Yes/No

### Load Testing
**Tools**: [k6 / Artillery / etc.]
**When Required**: [Before major releases / etc.]
**Thresholds**: [Your requirements]

## Snapshot Testing

**Usage**: [Encouraged / Discouraged / Specific cases only]
**Location**: `__snapshots__/`
**Review Process**: [How to review snapshot changes]

## Test Requirements by Change Type

### Bug Fixes
- [ ] Regression test that fails before fix
- [ ] Test passes after fix
- [ ] Edge cases covered

### New Features
- [ ] Unit tests for business logic
- [ ] Integration tests for external interactions
- [ ] E2E test for happy path (if user-facing)

### Refactoring
- [ ] Existing tests still pass
- [ ] Coverage maintained or improved
- [ ] No test changes needed (ideally)

## Continuous Integration

### Pre-commit
```bash
# Tests that run before commit
npm test -- --onlyChanged
```

### Pre-push
```bash
# Tests that run before push
npm test
npm run test:integration
```

### CI Pipeline
```bash
# Full test suite in CI
npm test -- --coverage
npm run test:integration
npm run test:e2e
```

## Test Maintenance

### When to Update Tests
- When requirements change
- When bugs are found
- When tests become flaky

### Flaky Test Policy
- Investigate immediately
- Fix or disable (with ticket)
- Never ignore

### Test Debt
- Review quarterly
- Remove obsolete tests
- Refactor brittle tests

## Test Documentation

### README Requirements
Each test file should have a comment block:
```typescript
/**
 * Tests for TransactionService
 *
 * Covers:
 * - Transaction creation validation
 * - Transfer logic
 * - Error handling for invalid data
 */
```

### Complex Test Logic
Document non-obvious test setup or assertions:
```typescript
// We test with Feb 29 to ensure leap year handling
const testDate = new Date('2024-02-29');
```

## Tools and Libraries

### Testing Framework
- Primary: [Jest / Vitest / etc.]
- Version: X.X.X

### Assertion Library
- [Jest expect / Chai / etc.]

### Mocking
- [Jest mocks / Sinon / etc.]

### Coverage
- Tool: [Istanbul / c8 / etc.]
- Reporter: [lcov / html / etc.]

### E2E
- Framework: [Playwright / Cypress / etc.]
- Browser: [Chromium / All / etc.]

## Non-Negotiable Testing Rules

List rules that can NEVER be violated:

- [ ] All tests must pass before merging
- [ ] No skipped tests in main branch
- [ ] Critical paths have 100% coverage
- [ ] [Your non-negotiable rules]

## Recommended But Flexible

List guidelines that are encouraged but can be bent:

- Aim for high coverage but focus on meaningful tests
- Property-based testing for complex logic (encouraged)
- [Your recommendations]

---

**Last Updated**: YYYY-MM-DD
**Test Framework Version**: X.X.X
**Review**: When testing strategy evolves
