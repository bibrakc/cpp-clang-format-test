CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -Iinclude
SRCDIR = src
INCDIR = include
OBJDIR = obj
BINDIR = bin

SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/calculator

.PHONY: all clean format check-format

all: $(TARGET)

$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

clean:
	rm -rf $(OBJDIR) $(BINDIR)

format:
	@VERSION=$$(clang-format --version | grep -oE '[0-9]+\.[0-9]+' | head -1); \
	if [ "$$(echo "$$VERSION < 18.1" | bc -l)" -eq 1 ]; then \
		echo "Error: clang-format version $$VERSION is too old. Version 18.1+ required for .clang-format-ignore support."; \
		exit 1; \
	fi; \
	clang-format -i $(SRCDIR)/*.cpp $(INCDIR)/*.h

check-format:
	@VERSION=$$(clang-format --version | grep -oE '[0-9]+\.[0-9]+' | head -1); \
	if [ "$$(echo "$$VERSION < 18.1" | bc -l)" -eq 1 ]; then \
		echo "Error: clang-format version $$VERSION is too old. Version 18.1+ required for .clang-format-ignore support."; \
		exit 1; \
	fi; \
	clang-format --dry-run --Werror $(SRCDIR)/*.cpp $(INCDIR)/*.h