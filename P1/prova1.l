%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

LETTER  [a-zA-Z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT}|_)*
NUM     {DIGIT}+
STRING  \"[^\"\n]*\"
COMMENT "//"[^\n]*

%%

{COMMENT}       {}
[ \t\n]+        {}

"print"         { return PRINT;  }
"concat"        { return CONCAT; }
"length"        { return LENGTH; }

{NUM}           { return NUM;    }
{STRING}        { return STRING; }
{ID}            { return ID;     }

"+"             { return PLUS;   }
"-"             { return MINUS;  }
"*"             { return TIMES;  }
"/"             { return DIV;    }
"="             { return ASSIGN; }
"("             { return LPAR;   }
")"             { return RPAR;   }
","             { return COMMA;  }

.               { return ERROR;  }

%%
