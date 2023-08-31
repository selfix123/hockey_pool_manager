#--- LIBRARY NAME ---#
NAME	= manager

#--- COMMAND VARIABLES ---#
CC		= gcc
CFLAGS	= -Wall -Wextra -Werror -g
RM		= rm -f
AR		= ar rcs
MK		= mkdir -p

#--- COLORS ---#
GREEN	=    \033[1;32m
RED		=    \033[1;31m
RESET	=     \033[0m

#--- INCLUDE ---#
INCDIR	= inc

LIB_DIR = lib_ft/
LIB_FT = libft.a


#--- SOURCE ---#
SRCDIR 	= src
SRC		=	main.c\
			parsing.c

VPATH	=    ${SRCDIR}

#--- OBJECT ---#
OBJDIR	=   obj
OBJ		= $(addprefix ${OBJDIR}/, ${SRC:.c=.o})

#--- RULES ---#
${OBJDIR}/%.o:	%.c
	@${CC} ${CFLAGS} -I${INCDIR} -I. -c $< -o $@

all: libft $(NAME)

${NAME}: $(OBJDIR) $(OBJ)
	@${CC} ${CFLAGS} -I${INCDIR} -o ${NAME} ${OBJ} $(LIB_DIR)$(LIB_FT)
	@echo "$(NAME)${GREEN} sucessefully compiled :file_folder:.${RESET}"

$(OBJDIR):
	@$(MK) ${OBJDIR}

run:	all
	@./${NAMES}

libft:
	@make -C lib_ft

clean:
	@$(RM) $(OBJ)
	@$(RM)r $(OBJDIR)

fclean: clean
	@$(RM) $(NAME)
	@echo "$(NAME)${GREEN} object files and executable successfully removed :wastebasket:.${RESET}"

re:	fclean all

.PHONY:	all clean fclean re