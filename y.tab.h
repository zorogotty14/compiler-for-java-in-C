/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    CASE = 258,
    CHAR = 259,
    CLASS = 260,
    CONTINUE = 261,
    BREAK = 262,
    DEFAULT = 263,
    FLOAT = 264,
    STRING = 265,
    NUM = 266,
    FNUM = 267,
    IMPORT = 268,
    INT = 269,
    IDENTIFIER = 270,
    NEW = 271,
    LITERAL = 272,
    OP_DIM = 273,
    PACKAGE = 274,
    PUBLIC = 275,
    RETURN = 276,
    STATIC = 277,
    SWITCH = 278,
    THIS = 279,
    VOID = 280,
    UNOP = 281,
    WHILE = 282,
    RELOP = 283
  };
#endif
/* Tokens.  */
#define CASE 258
#define CHAR 259
#define CLASS 260
#define CONTINUE 261
#define BREAK 262
#define DEFAULT 263
#define FLOAT 264
#define STRING 265
#define NUM 266
#define FNUM 267
#define IMPORT 268
#define INT 269
#define IDENTIFIER 270
#define NEW 271
#define LITERAL 272
#define OP_DIM 273
#define PACKAGE 274
#define PUBLIC 275
#define RETURN 276
#define STATIC 277
#define SWITCH 278
#define THIS 279
#define VOID 280
#define UNOP 281
#define WHILE 282
#define RELOP 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 43 "parser.y" /* yacc.c:1909  */
int ival ; char *id; float fval;

#line 113 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
