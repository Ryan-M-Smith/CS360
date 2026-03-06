/* globals.h - Global declarations */

#ifndef LAB09_GLOBALS_H
#define LAB09_GLOBALS_H

#include <stdio.h>

/* Global declarations */
/* Variables */
int charClass;
//this is to detect floating point literals
int prevClass;
char lexeme[100];
char nextChar;
char nextCharPlus;
int lexLen;
int token;
int nextToken;
//the goal is to look up and compare to see if the token that comes after will be a '*'
int prevToken = 0;
FILE* in_fp;

/* Character classes */
#define LETTER 0
#define DIGIT 1
#define COMMENT 2
#define UNKNOWN 99

/* Token codes */
#define INT_LIT 10
#define IDENT 11
#define ASSIGN_OP 20
#define ADD_OP 21
#define SUB_OP 22
#define MULT_OP 23
#define DIV_OP 24
#define LEFT_PAREN 25
#define RIGHT_PAREN 26

#endif /* LAB09_GLOBALS_H */