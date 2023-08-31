NAME			=	manager

BIN_DIR			=	bin/

LIBFT_DIR		=	libft/

CC				=	gcc
CFLAGS			=	-Wextra -Wall -Werror
LIBFT			=	$(LIBFT_DIR)libft.a

PROMPT_SRCS		=	main.c

PROMPT_OBJS		=	$(addprefix ${BIN_DIR}, ${PROMPT_SRCS:.c=.o})

OBJS			=	$(PROMPT_OBJS) \

${BIN_DIR}%.o: ${PROMPT_DIR}%.c
	@${CC} ${CFLAGS} -c $< -o $@

all: $(BIN_DIR) libft built-in $(NAME)
	@echo "manager compiled!"

$(NAME): $(OBJS)
	@echo "Manager compiling"
	@$(CC) $(CFLAGS) $(OBJS) $(LIBFT) -o $(NAME)

$(BIN_DIR):
	@mkdir -p $(BIN_DIR)

libft:
	@$(MAKE) -sC $(LIBFT_DIR)

built-in:
	@$(MAKE) -sC $(BUILT_DIR)

clean:
	@rm -fr $(BIN_DIR)
	@$(MAKE) -sC $(LIBFT_DIR) clean
	@$(MAKE) -sC $(BUILT_DIR) clean

fclean: clean
	@rm -f $(NAME)
	@$(MAKE) -sC $(LIBFT_DIR) fclean
	@$(MAKE) -sC $(BUILT_DIR) fclean

re: fclean all

val: re
	valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes --suppressions=$(PWD)/supp.txt $(NAME)

.PHONY:	all clean fclean re libft