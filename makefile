NAME = a.out
NASM = nasm
LD = ld
NASM_FLAGS = -f elf64 -g -F dwarf
LD_FLAGS = -g
SRC = calculs.s      
OBJ = $(SRC:.s=.o)

all : $(NAME)

$(NAME) : $(OBJ)
	$(LD) $(LD_FLAGS) obj/$^ -o $@

obj:
	mkdir obj

%.o : %.s obj
	$(NASM) $(NASM_FLAGS) $< -o obj/$@

clean :
	rm -rf obj/*.o

fclean : clean
	rm -rf $(NAME) obj

re : fclean all