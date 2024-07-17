NAME = a.out
NASM = nasm
LD = ld
NASM_FLAGS = -f elf64 -g -F dwarf
LD_FLAGS = -g
SRC = loops.s
OBJ_DIR = obj
OBJ = $(OBJ_DIR)/$(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LD_FLAGS) $^ -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: %.s | $(OBJ_DIR)
	$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	rm -rf $(OBJ_DIR)/*.o

fclean: clean
	rm -rf $(NAME) $(OBJ_DIR)

re: fclean all