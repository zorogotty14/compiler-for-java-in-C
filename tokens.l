
%{
	#include<stdio.h>
	#include<string.h>
	#include "y.tab.h"
	int scope=0;
	int scope_count=0;
	int line=1;
%}

white  		[ |\t]+
id  		[_a-zA-Z][_a-zA-Z0-9]{0,30}
num 		[0-9]+
fnum		[0-9]+\.[0-9]+

unop		"++"|"--"
lit		\".*\"


relop		>|<|>=|<=|==
Dimension	\[\]

%%


{white}			{;}
{lit}			{printf("<str:%s>\n",yytext);return STRING ;}

[\n]                           {line++; }
{num}			{yylval.ival =atoi(yytext);printf("<int:%s>\n",yytext);return NUM  ;}
{fnum}			{printf("<float:%s>\n",yytext);	return FNUM ;}

{relop}			{ printf("<oper:%s>\n",yytext);return RELOP;}
"{"			{++scope; return '{' ;}
"}"			{--scope; if(!scope) ++scope_count; return '}' ;}
package 		{ printf("<oper:%s>\n",yytext);  return PACKAGE; }
class			{printf("<oper:%s>\n",yytext);return CLASS; }
import			{printf("<oper:%s>\n",yytext); return IMPORT; }
public			{printf("<oper:%s>\n",yytext); return PUBLIC; }
static			{ printf("<oper:%s>\n",yytext);return STATIC; }
void			{printf("<oper:%s>\n",yytext); return VOID; }
this			{printf("<oper:%s>\n",yytext); return THIS; }
{Dimension}		{printf("<dim :%s>",yytext); return OP_DIM;}
new 			{printf("<oper:%s>\n",yytext); return NEW; }
return 			{ printf("<oper:%s>\n",yytext);return RETURN; }
{unop}			{ printf("<oper:%s>\n",yytext);return UNOP; }
int				{ printf("<oper:%s>\n",yytext);return INT; }
char			{printf("<oper:%s>\n",yytext); return CHAR; }
float			{ printf("<oper:%s>\n",yytext);return FLOAT; }
dimension		{printf("<oper:%s>\n",yytext); return OP_DIM; }
while			{ printf("<oper:%s>\n",yytext);return WHILE; }
continue		{ printf("<oper:%s>\n",yytext);return CONTINUE; }
switch			{ printf("<oper:%s>\n",yytext);return SWITCH; }
case			{ printf("<oper:%s>\n",yytext);return CASE; }
break			{ printf("<oper:%s>\n",yytext);return BREAK; }
default			{printf("<oper:%s>\n",yytext); return DEFAULT; }
{id}			{yylval.id = (char *) strdup(yytext) ;printf("<IDENTIFER: %s>\n", yytext);return IDENTIFIER ;}
.			{ return yytext[0]; }
%%



int yywrap (){return 1;}




