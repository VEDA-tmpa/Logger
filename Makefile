# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -std=c++17 -fPIC
SRCDIR = src
OBJDIR = obj
BUILDDIR = build
TARGET_STATIC = $(BUILDDIR)/liblogger.a
TARGET_SHARED = $(BUILDDIR)/liblogger.so

# Source and object files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SOURCES))

# Default target
all: $(BUILDDIR) $(TARGET_STATIC) $(TARGET_SHARED)

# Create obj and build directories if not exists
$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Build object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build static library
$(TARGET_STATIC): $(OBJECTS) | $(BUILDDIR)
	ar rcs $@ $^

# Build shared library
$(TARGET_SHARED): $(OBJECTS) | $(BUILDDIR)
	$(CXX) -shared -o $@ $^

# Clean build files
clean:
	rm -rf $(OBJDIR) $(BUILDDIR)

# Phony targets
.PHONY: all clean
