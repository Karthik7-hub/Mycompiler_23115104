all:
	bison -d parser.y
	flex lexer.l
	g++ -c parser.tab.c
	g++ -c lex.yy.c
	g++ -c main.cpp
	g++ parser.tab.o lex.yy.o main.o -o mycompiler

clean:
	rm -f *.o parser.tab.* lex.yy.c mycompiler output.asm
