all: compile

compile:
	lex ./main/cmm.lex
	g++ lex.yy.c -o cmm

test_valid:
	./cmm < ./main/test_cases/valid/valid_code.cmm

test_invalid:
	./cmm < ./main/test_cases/invalid/invalid_identifier.cmm