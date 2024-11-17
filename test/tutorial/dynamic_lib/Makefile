CXX = g++
CXXFLAGS = -Wall -std=c++17 -Iinclude
LDFLAGS = -Llib -llogger -Wl,-rpath=./lib

TARGET = a.out
SOURCES = main.cpp Human.cpp
OBJECTS = $(SOURCES:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJECTS)
