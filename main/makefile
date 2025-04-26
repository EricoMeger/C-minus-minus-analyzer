all: compile

compile:
	lex cmm.lex
	g++ lex.yy.c -o cmm

test_valid:
	./cmm < ./test_cases/valid/valid_code.txt

test_invalid:
	./cmm < ./test_cases/invalid/invalid_identifier.txt
