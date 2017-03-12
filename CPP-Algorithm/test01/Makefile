SOURCES = $(wildcard *.cpp)
INCLUDE_DIRS =
TARGET= a.out
LIBS=
OBJECTS = $(patsubst %.cpp,%.o,$(SOURCES))
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXLIBS) $(LIBS) $^ -o $@
$(OBJECTS): %.o : %.cpp
	$(CXX) $(INCLUDE_DIRS) -c $(CFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf $(TARGET) $(OBJECTS)
