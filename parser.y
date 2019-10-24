%{
	#include<stdio.h>
	int yylex();
	extern FILE *yyin, *yyout;
	void yyerror(const char*);
#include "symtab.h"
	extern int line ;
	
	int temp ;
	int t ;
	int flag=0;
	void install (char *sym_name){
		sr *s ;
		s = getsym(sym_name) ;
		if(s == 0)
		s = putsym(sym_name, temp) ; //here
		else{
		//errors++ ;
		printf("%s is already defined, redefined @ line %d\n", sym_name, line) ;

		}
	}
	void context_check(char *sym_name){
		if(getsym(sym_name) == 0){
			printf("%s is an undeclared identifier @ line %d\n", sym_name, line) ;
			flag=1;
		}else{
			flag=0;
		}
	}
	void type_check(char *type, int type_2){
		int type_1 ;
		if(strcmp(type, "int") == 0)
			type_1 =  3 ;
		else if(strcmp(type, "float") == 0)
			type_1 = 4 ;
		else type_1 = 2 ;
		if(type_1 != type_2)
			printf("type mismatch @ line %d\n", line) ;
	}	
%}

%union {int ival ; char *id; float fval;}
%token CASE CHAR CLASS CONTINUE BREAK
%token DEFAULT 
%token FLOAT STRING NUM FNUM
%token IMPORT INT 
%token <id>IDENTIFIER
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

type: VOID  {temp = 1;}|INT{temp = 3;} | FLOAT {temp = 4;}| CHAR {temp = 2;}  ;

compoundst:  statement_list   ;

statement_list: statement| statement statement_list| ;

statement :declaration | label |assignment |while |switch | RETURN rel_exp ';'|BREAK';';

declaration: type id_list ';';

id_list: IDENTIFIER ',' id_list  {install($1) ;}|IDENTIFIER  {install($1) ;};

assignment: IDENTIFIER '=' rel_exp ';'{context_check($1) ; sr *ss = getsym($1) ;  if(flag==0)type_check(ss->type, t);}| type IDENTIFIER '=' rel_exp ';' {install($2);sr *ss = getsym($2) ;if(flag==0)type_check(ss->type, t);} ;

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

base : IDENTIFIER {context_check($1) ;sr *ss = getsym($1); if(!strcmp(ss->type, "int")) t = 3; else t = 4 ;}| NUM {t = 3;} | FNUM  {t = 4;}| STRING {t = 2;}  | '(' rel_exp')';


%%


void yyerror(const char* msg)
{
	printf("%s",msg);
}

int main()
{

	yyin=fopen("test2.java","r");
	printf("Beggining To Parse The Code \n");	
	yyparse();
	printf("Parsing Completed successfully \n");
    printf("name \t\t type \t\t lineno. \n ");
	printsym();
	
	printf("\n");
	return 0;
	
}
