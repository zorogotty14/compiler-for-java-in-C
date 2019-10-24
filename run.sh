yacc -d -v parser.y
lex tokens.l
gcc y.tab.c lex.yy.c -ll -Lf
./a.out
