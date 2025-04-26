all: compile

compile:
	lex cmm.lex
	g++ lex.yy.c -o cmm