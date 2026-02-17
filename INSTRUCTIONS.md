# How to use the Makefile

I've created a `Makefile` in this directory (`cgih-practicas`) to help you compile and run your projects easily.

## Basic Usage

1.  **Navigate to the `cgih-practicas` directory** in your terminal. All `make` commands should be run from here.

2.  **To compile and run a specific practice**, use the practice name as the target. For example:
    ```bash
    # To compile and run practica1
    make practica1
    ```
    ```bash
    # To compile and run practica0
    make practica0
    ```
    This command first compiles the source code (if it has changed) and then immediately runs the resulting executable. The `cd` command is used internally to ensure your program can find its shaders.

3.  **To only compile a practice** without running it, use the `build-<practice_name>` target:
    ```bash
    make build-practica1
    ```

4.  **To clean up** and delete all the compiled executables, run:
    ```bash
    make clean
    ```

## How to add a new practice (e.g., `practica2`)

To add a new practice, you can simply copy and paste one of the existing blocks in the `Makefile` and update the file paths.

For example, to add `practica2`, assuming it has a `practica2/Main.cpp` file:

1.  **Open the `Makefile`**.

2.  **Copy the entire "Practica 1" block** and paste it at the end of the file.

3.  **Change all the `P1` variables to `P2`** and update the file names. It would look like this:

    ```makefile
    # --- Practica 2 ---
    # Directory and source/executable file definitions
    P2_DIR = practica2
    P2_SRC = $(P2_DIR)/Main.cpp  # <-- Make sure this is the correct source file name
    P2_EXEC = $(P2_DIR)/main_executable # <-- Choose a name for your executable

    # 'make practica2' will build and then run
    practica2: build-practica2 run-practica2

    # Target to build practica2
    build-practica2: $(P2_EXEC)

    # Rule to compile practica2
    $(P2_EXEC): $(P2_SRC)
        $(CXX) $(CXXFLAGS) -o $(P2_EXEC) $(P2_SRC) $(LDFLAGS)

    # Target to run practica2
    run-practica2:
        @echo "--- Running Practica 2 ---"
        @cd $(P2_DIR) && ./main_executable # <-- Make sure this matches P2_EXEC
    ```

4.  **Add `practica2` to the `.PHONY` list** and the `all` target at the top of the file to keep things tidy:
    ```makefile
    .PHONY: all clean ... build-practica1 run-practica1 practica2 build-practica2 run-practica2

    all: build-practica0 build-practica1 build-practica2
    ```
5. **Add the new executable to the `clean` target**
   ```makefile
   clean:
	@echo "Cleaning up..."
	@rm -f $(P0_EXEC) $(P1_EXEC) $(P2_EXEC)
   ```

Now you can run `make practica2` just like the others.
