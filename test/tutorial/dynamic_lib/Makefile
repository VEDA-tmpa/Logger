CXX = g++
CXXFLAGS = -Wall -std=c++17 -Iinclude
LDFLAGS = -Llib -llogger

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

run: $(TARGET)
	LD_LIBRARY_PATH=/Users/jigiseong/study/veda/FINAL_PROJECT/logger/test/tutorial/dynamic_lib/lib:$$LD_LIBRARY_PATH ./$(TARGET)