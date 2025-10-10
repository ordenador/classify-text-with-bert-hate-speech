# GitHub Copilot Instructions

## Commit Message Guidelines

### Conventional Commits
Use the Conventional Commits specification for all commit messages:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic changes)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `build`: Build system or dependencies changes
- `ci`: CI/CD configuration changes
- `chore`: Other changes that don't modify src or test files

### Best Practices

1. **Keep subject line short**: Max 50 characters
2. **Use imperative mood**: "add" not "added" or "adds"
3. **No period at the end**: Subject line should not end with a period
4. **Capitalize first letter**: Start subject with capital letter
5. **Separate subject from body**: Leave a blank line between subject and body
6. **Wrap body at 72 characters**: For better readability
7. **Use body to explain what and why**: Not how (code explains how)
8. **Reference issues**: Use footer to reference issues (e.g., "Closes #123")

### Examples

Good:
```
feat(api): add hate speech detection endpoint

Implement new REST API endpoint that uses BERT model
to classify text for hate speech content.

Closes #42
```

```
fix(deps): update backports-strenum to 1.2.8

Fixes Python 3.11 compatibility issue in Hugging Face Space build.
```

```
docs: update README with deployment instructions
```

Bad:
```
Fixed a bug in the code that was causing problems.
```

```
WIP: changes to the model
```

```
Updated dependencies and fixed some issues with the gradio interface and also refactored the code
```

## Code Quality Guidelines

- Follow PEP 8 for Python code
- Use type hints where applicable
- Write docstrings for functions and classes
- Keep functions small and focused (single responsibility)
- Use meaningful variable and function names
- Add comments for complex logic only
- Prefer composition over inheritance
- Write unit tests for new features
