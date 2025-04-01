# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -Wno-unused -Wno-missing-field-initializers -Wno-implicit-fallthrough -Iinclude -Iinclude/SDL3 -Iinclude/GL -Iinclude/glm
LDFLAGS = -Llib -Wl,-subsystem,windows
LIBS = -lmingw32 -lSDL3 -lSDL3_image -lSDL3_mixer -lSDL3_ttf -lglew32 -lopengl32

# Directories
SRC_DIR = src
OBJ_DIR = o

# Sources and objects
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

# Output executable
TARGET = Main

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

# Compile each source file to an object file
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create the object directory if it doesn't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Clean up build files
clean:
	rm -rf $(OBJ_DIR) $(TARGET)

# Phony targets
.PHONY: all clean