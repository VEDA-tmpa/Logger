# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -std=c++17 -fPIC
SRCDIR = src
OBJDIR = obj
TARGET_STATIC = liblogger.a
TARGET_SHARED = liblogger.so

# Source and object files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SOURCES))

# Default target
all: $(TARGET_STATIC) $(TARGET_SHARED)

# Create obj directory if not exists
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Build object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build static library
$(TARGET_STATIC): $(OBJECTS)
	ar rcs $@ $^

# Build shared library
$(TARGET_SHARED): $(OBJECTS)
	$(CXX) -shared -o $@ $^

# Clean build files
clean:
	rm -rf $(OBJDIR) $(TARGET_STATIC) $(TARGET_SHARED)

# Phony targets
.PHONY: all clean
