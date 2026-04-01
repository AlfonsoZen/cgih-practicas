# Makefile for practica8

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -DGLEW_STATIC -I../practica3/glm -I../practica6 -I../practica6/SOIL2 -I.
# Libraries to link
LDFLAGS = -lGL -lglfw -lGLEW -lassimp -lz

# SOIL2 source files from practica6
SOIL_DIR = ../practica6/SOIL2
SOIL_SRC = $(SOIL_DIR)/etc1_utils.c $(SOIL_DIR)/image_DXT.c $(SOIL_DIR)/image_helper.c $(SOIL_DIR)/SOIL2.c

SRC = Iluminacion.cpp
EXEC = main_p8

.PHONY: all clean run

all: $(EXEC)

$(EXEC): $(SRC) $(SOIL_SRC)
	$(CXX) $(CXXFLAGS) -fpermissive -o $(EXEC) $(SRC) $(SOIL_SRC) $(LDFLAGS)

run: all
	@echo "--- Running Practica 8 ---"
	./$(EXEC)

clean:
	rm -f $(EXEC)
