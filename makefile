all: compile

compile:
	lex ./main/cmm.lex
	g++ lex.yy.c -o cmm