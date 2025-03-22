# Compiler
CXX = g++
CXXFLAGS = -Wall -Wextra -g --coverage -O0

# Directories
BUILD_DIR = .output
COV_DIR = $(BUILD_DIR)/coverage_report
LCOV_INFO = $(BUILD_DIR)/coverage.info

# Files
SRC = main.cpp
OBJ = $(SRC:%.cpp=$(BUILD_DIR)/%.o)
EXE = $(BUILD_DIR)/main

# Default rule: build, run, and show coverage
all: $(EXE) run coverage display

# Ensure output directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile source files
$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link executable
$(EXE): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ --coverage

# Run the program
run:
	$(EXE)

# Generate coverage report
coverage:
	lcov --capture --directory $(BUILD_DIR) --output-file $(LCOV_INFO)
	genhtml $(LCOV_INFO) --output-directory $(COV_DIR)

# Display coverage result in terminal
display:
	lcov --list $(LCOV_INFO)

# Clean build files
clean:
	rm -rf $(BUILD_DIR)
