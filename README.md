# C++ Code Formatting Test Repository

This is a test repository designed to learn and practice GitHub Actions for automated code formatting checks using clang-format.

## Purpose

This repository serves as a learning platform for:
- Setting up GitHub Actions workflows
- Implementing automated code formatting checks on Pull Requests
- Understanding CI/CD pipeline stages for code quality enforcement
- Testing clang-format integration in a C++ project

## Project Structure

```
.
├── include/           # Header files
│   ├── calculator.h   # Calculator class declaration
│   └── utils.h        # Utility functions declaration
├── src/               # Source files
│   ├── calculator.cpp # Calculator implementation
│   ├── utils.cpp      # Utility functions implementation
│   └── main.cpp       # Main application
├── Makefile          # Build configuration
├── .clang-format     # Code formatting rules
└── README.md         # This file
```

## Building the Project

```bash
# Build the project
make

# Clean build artifacts
make clean

# Format code using clang-format
make format

# Check if code is properly formatted (for CI)
make check-format
```

## Code Formatting

This project uses clang-format with a Google-based style configuration. The formatting rules are defined in `.clang-format`.

## GitHub Actions Integration

The repository is configured to run automated checks on Pull Requests that verify:
1. Code compiles successfully
2. Code follows the formatting standards defined in `.clang-format`

## Usage for Learning

1. Create a Pull Request with intentionally poorly formatted code
2. Observe the GitHub Actions workflow execution
3. See how the CI pipeline catches formatting violations
4. Learn to fix formatting issues and re-run checks

## Requirements

- g++ compiler with C++11 support
- clang-format tool
- make utility