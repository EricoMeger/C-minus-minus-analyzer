EXEC = cmm

all: compile

compile: lex.yy.c cmm.tab.c
	g++ lex.yy.c cmm.tab.c -o $(EXEC) -lfl

lex.yy.c: cmm.lex cmm.tab.h
	flex cmm.lex

cmm.tab.c cmm.tab.h: cmm.y
	bison -d cmm.y

test_valid: compile
	./$(EXEC) ./test_cases/valid/valid_code.cmm

test_invalid: compile
	./$(EXEC) ./test_cases/invalid/invalid_declaration.cmm

clean:
	rm -f lex.yy.c cmm.tab.c cmm.tab.h $(EXEC)
