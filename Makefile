# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chrhu <chrhu@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 10:08:42 by chrhu             #+#    #+#              #
#    Updated: 2024/05/28 11:57:15 by chrhu            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#COLORS
RESET = \033[0m
RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
BLUE = \033[34m
BOLD = \033[1m
ITALIC=\033[3m

#PATHS
ALLOCATION_DIRS = allocation
CONVERT_DIRS = convert
DBL_LINK_LIST_DIRS = double_link_list
PRINTF_DIRS = ft_printf
GNL_DIRS = gnl
LINK_LIST_DIRS =  link_list
MEMORY_DIRS = memory
PUT_DIRS = put
STRING_DIRS = string
VERIFY_IS_DIRS = verify_is

#FILE NAMES
ALLOCATION_FILES = ft_bzero.c ft_calloc.c

CONVERT_FILES = ft_abs.c ft_atoi.c ft_atol.c ft_atoll.c ft_free_split.c \
			ft_itoa.c ft_split_ps.c ft_split.c
		

DBL_LINK_LIST_FILES = ft_dbl_lstadd_back.c ft_dbl_lstadd_front.c \
			ft_dbl_lstclear.c ft_dbl_lstnew.c

PRINTF_FILES = ft_printf_char.c ft_printf_dec.c ft_printf_hex.c \
		ft_printf_ptr.c ft_printf_str.c ft_printf.c

GNL_FILES = get_next_line_utils.c  get_next_line.c

LINK_LIST_FILES =  ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c \
			ft_lstdelone.c ft_lstiter.c ft_lstlast.c \
			ft_lstmap.c ft_lstnew.c ft_lstsize.c

MEMORY_FILES = ft_memchr.c ft_memcmp.c ft_memcpy.c \
		ft_memmove.c ft_memset.c

PUT_FILES = ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c

STRING_FILES = ft_strcat.c ft_strchr.c ft_strcmp.c \
		ft_strcpy.c ft_strdup.c ft_striteri.c \
		ft_strjoin.c ft_strlcat.c ft_strlcpy.c \
		ft_strlen.c ft_strmapi.c ft_strncat.c \
		ft_strncmp.c ft_strnstr.c ft_strrchr.c \
		ft_strstr.c ft_strtrim.c ft_substr.c

VERIFY_IS_FILES = ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c \
		ft_isprint.c ft_isspace.c ft_tolower.c ft_toupper.c

#COMPLETE PATHS
ALLOCATION = $(ALLOCATION_FILES:%=$(ALLOCATION_DIRS)/%)
CONVERT = $(CONVERT_FILES:%=$(CONVERT_DIRS)/%)
DBL_LINK_LIST = $(DBL_LINK_LIST_FILES:%=$(DBL_LINK_LIST_DIRS)/%)
PRINTF = $(PRINTF_FILES:%=$(PRINTF_DIRS)/%)
GNL = $(GNL_FILES:%=$(GNL_DIRS)/%)
LINK_LIST = $(LINK_LIST_FILES:%=$(LINK_LIST_DIRS)/%)
MEMORY = $(MEMORY_FILES:%=$(MEMORY_DIRS)/%)
PUT = $(PUT_FILES:%=$(PUT_DIRS)/%)
STRING = $(STRING_FILES:%=$(STRING_DIRS)/%)
VERIFY_IS = $(VERIFY_IS_FILES:%=$(VERIFY_IS_DIRS)/%)

SRCS = $(ALLOCATION) $(CONVERT) $(PRINTF) $(MEMORY) $(PUT) $(VERIFY_IS) \
       $(LINK_LIST) $(DBL_LINK_LIST) $(GNL) $(STRING)

OBJS = $(SRCS:.c=.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror

NAME = libft.a

all: $(NAME)

$(NAME): $(OBJS)
	@echo "\n$(BOLD)$(GREEN)✅ Building library $(ITALIC)$(NAME)$(RESET)"
	@ar rcs $(NAME) $(OBJS)

%.o: %.c
	@echo "$(YELLOW)$(CC) $(CFLAGS) $(BOLD)$(GREEN)$<$(RESET)"
	@$(CC) $(CFLAGS) -c $< -o $@


clean:
	@echo "$(BOLD)$(YELLOW)Clean - Remove files"
	@rm -f $(OBJS)

fclean:	clean
	@echo "$(BOLD)$(YELLOW)Clean - Remove $(NAME)"
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
