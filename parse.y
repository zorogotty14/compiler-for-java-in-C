%{
	#include<stdio.h>
#include"y.tab.h"
	#include "lex.yy.c"
	int yylex();
	extern FILE *yyin, *yyout;
	void yyerror(const char*);
	extern int line ;

%}


%token CASE CHAR CLASS CONTINUE BREAK
%token DEFAULT
%token FLOAT STRING NUM FNUM
%token IMPORT INT IDENTIFIER
%token NEW LITERAL
%token  OP_DIM
%token PACKAGE PUBLIC
%token RETURN
%token STATIC SWITCH
%token THIS
%token VOID UNOP
%token WHILE
%token RELOP 

%start start1
%left '+' '-' '*' '/'
%right '=' 

%%
 
start1:	import start1|class start1 |method start1|declaration start1|;

import: IMPORT IDENTIFIER'.''*'| IMPORT IDENTIFIER'.'IDENTIFIER'.''*'| IMPORT IDENTIFIER'.'IDENTIFIER'.'IDENTIFIER;

class: modifiers CLASS IDENTIFIER '{' classbody'}'|CLASS IDENTIFIER '{' classbody'}';

modifiers: modifier | modifier modifiers;


modifier: PUBLIC |STATIC ;
classbody: declaration classbody | method classbody |;

method: modifiers type IDENTIFIER '(' arglist ')' '{' methodbody '}' ;

arglist:arg ',' arglist | arg ;

arg: type IDENTIFIER |IDENTIFIER OP_DIM IDENTIFIER | type OP_DIM IDENTIFIER ;

methodbody:  method methodbody | compoundst methodbody | ;

type: VOID |INT | FLOAT | CHAR |STRING ;

compoundst:  statement compoundst | statement |;



statement :declaration | label |assignment |while |switch | RETURN rel_exp ';'|BREAK';';

declaration: type id_list ';';

id_list: IDENTIFIER ',' id_list |IDENTIFIER  ;

assignment: IDENTIFIER '=' rel_exp ';' |type IDENTIFIER '=' rel_exp ';' ;

while : WHILE '('rel_exp')' '{' compoundst '}' ;

switch : SWITCH '('rel_exp')''{' compoundst '}';

label : CASE rel_exp ':'  | DEFAULT ':' ;



rel_exp :	rel_exp RELOP add_expression | add_expression ;

add_expression : add_expression '+' mul_expression | add_expression '-' mul_expression | mul_expression ;

mul_expression : mul_expression '*' cast_exp |  mul_expression '/' cast_exp | cast_exp ;

cast_exp : unary_exp | '(' type ')' cast_exp ;

unary_exp : exp | UNOP exp | exp UNOP| unary_op exp ;

unary_op : '-' | '+' | '&' | '!' ;

exp : base | exp '(' ')' | exp '(' id_list ')' ;

base : IDENTIFIER| NUM  | FNUM  | STRING  | '(' rel_exp')';


%%

int yywrap()
{
	return 1;
}
void yyerror(const char* msg)
{
	printf("%s",msg);
}

int main()
{
	printf("Beggining To Parse The Code\n");
	yyin=fopen("test2.java","r");
	
	yyparse();
	printf("Parsing completed Successfully\n");	
	
	printf("\n");
	return 0;
	
}
