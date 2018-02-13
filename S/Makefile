NAME0 = Colleen
NAME1 = Grace
NAME2 = Sully

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

Colleen:
	nasm -f macho64 Colleen.s
	ld -macosx_version_min 10.7.0 -lSystem -o Colleen Colleen.o

Grace:
	nasm -f macho64 Grace.s
	ld -macosx_version_min 10.7.0 -lSystem -o Grace Grace.o

Sully:
	nasm -f macho64 Sully.s
	ld -macosx_version_min 10.7.0 -lSystem -o Sully Sully.o

clean: 
	rm -f $(NAME0).o $(NAME1).o $(NAME2).o

fclean: clean
	rm -f $(NAME0) $(NAME1) $(NAME2)

re: fclean all