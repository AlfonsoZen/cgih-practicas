# Makefile for CGEH practices

# Compiler and flags
CXX = g++
# Added -Wall for better warnings
CXXFLAGS = -std=c++11 -Wall -DGLEW_STATIC 
# Libraries to link
LDFLAGS = -lGL -lglfw -lGLEW

# Phony targets to avoid conflicts with file names
.PHONY: all clean practica0 build-practica0 run-practica0 practica1 build-practica1 run-practica1

# 'all' target builds all practices
all: build-practica0 build-practica1

# --- Practica 0 ---
# Directory and source/executable file definitions
P0_DIR = practica0/Main
P0_SRC = $(P0_DIR)/Main.cpp
P0_EXEC = $(P0_DIR)/programa

# 'make practica0' will build and then run
practica0: build-practica0 run-practica0

# Target to build practica0
build-practica0: $(P0_EXEC)

# Rule to compile practica0
$(P0_EXEC): $(P0_SRC)
	$(CXX) $(CXXFLAGS) -o $(P0_EXEC) $(P0_SRC) $(LDFLAGS)

# Target to run practica0
run-practica0:
	@echo "--- Running Practica 0 ---"
	@cd $(P0_DIR) && ./programa

# --- Practica 1 ---
# Directory and source/executable file definitions
P1_DIR = practica1
P1_SRC = $(P1_DIR)/Main_Dibujo2D.cpp
P1_EXEC = $(P1_DIR)/main_dibujo

# 'make practica1' will build and then run
practica1: build-practica1 run-practica1

# Target to build practica1
build-practica1: $(P1_EXEC)

# Rule to compile practica1
$(P1_EXEC): $(P1_SRC)
	$(CXX) $(CXXFLAGS) -o $(P1_EXEC) $(P1_SRC) $(LDFLAGS)

# Target to run practica1
run-practica1:
	@echo "--- Running Practica 1 ---"
	@cd $(P1_DIR) && ./main_dibujo

# --- Clean ---
# 'make clean' removes all compiled executables
clean:
	@echo "Cleaning up..."
	@rm -f $(P0_EXEC) $(P1_EXEC)
