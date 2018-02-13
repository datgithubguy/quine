NAME0 = Colleen
NAME1 = Grace
NAME2 = Sully
FLAGS = -Wall -Wextra  -Werror

.PHONY: re clean fclean all

all: $(NAME0) $(NAME1) $(NAME2)

$(NAME):
	@echo "     #####           "
	@echo "    #### _\_  ________"
	@echo "    ##=-[.].]| \      \ "
	@echo "    #(    _\ |  |------| "
	@echo "     #   __| |  |||||||| "
	@echo "      \  _/  |  ||||||||"
	@echo "   .--'--'-. |  | ____ |"
	@echo "  / __      \|__|[o__o]|"
	@echo "_(____nm_______ /____\____"

	gcc $@.c -o $@ $(FLAGS)

clean: 
	@cd .

fclean: clean
	rm -f $(NAME0) $(NAME1) $(NAME2)

re: fclean all