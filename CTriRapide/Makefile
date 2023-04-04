# https://gl.developpez.com/tutoriel/outil/makefile/

# CFLAGS=-W -Wall -ansi -pedantic
CFLAGS=-g -Og -std=c18

EXEC=a.out

all: $(EXEC)

$(EXEC): fichier.o tri_tab_de_string.o tri_string.o tri_tab_de_int.o tri_int.o main.o
	gcc -o $@ $^

fichier.o: fichier.c
	gcc -o $@ -c $< $(CFLAGS)

tri_tab_de_string.o: tri_tab_de_string.c fichier.h
	gcc -o $@ -c $< $(CFLAGS)

tri_tab_de_int.o: tri_tab_de_int.c fichier.h
	gcc -o $@ -c $< $(CFLAGS)

tri_string.o: tri_string.c
	gcc -o $@ -c $< $(CFLAGS)

tri_int.o: tri_int.c
	gcc -o $@ -c $< $(CFLAGS)

main.o: main.c fichier.h tri_tab_de_string.h tri_string.h tri_tab_de_int.h tri_int.h
	gcc -o $@ -c $< $(CFLAGS)

clean:
	rm -rf *.o

mrproper: clean
	rm -rf $(EXEC)

test: mrproper all
	valgrind --leak-check=full ./a.out
	
