cmake_minimum_required(VERSION 3.0.0)
project(cd-lab VERSION 0.1.0)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

# Flex linking - this removes the need to put noyywrap
link_libraries(${FLEX_LIBRARIES} ${BISON_LIBRARIES})

# this is one program
FLEX_TARGET(lexer00b ${PROJECT_SOURCE_DIR}/src/000-basics/grm/fl.l ${PROJECT_SOURCE_DIR}/src/000-basics/fl.yy.c)
add_executable(000intro ${FLEX_lexer00b_OUTPUTS})

# Write a scanner to count the number of words, characters, lines and whitespaces.
FLEX_TARGET(lexer00c ${PROJECT_SOURCE_DIR}/src/001-counter/grm/fl.l ${PROJECT_SOURCE_DIR}/src/001-counter/fl.yy.c)
add_executable(001counter ${FLEX_lexer00c_OUTPUTS})


# Write a program to recognize variable names, operators and keywords used in C
FLEX_TARGET(lexer00v ${PROJECT_SOURCE_DIR}/src/002-varname/grm/fl.l ${PROJECT_SOURCE_DIR}/src/002-varname/fl.yy.c)
add_executable(002varname ${FLEX_lexer00v_OUTPUTS})


# Write a LEX program to count the number of ‘scanf’ and ‘printf’ statements in a C  program. Replace them with ‘readf’ and ‘writef’ statements respectively. 
FLEX_TARGET(lexer00p ${PROJECT_SOURCE_DIR}/src/003-replacer/grm/fl.l ${PROJECT_SOURCE_DIR}/src/003-replacer/fl.yy.c)
add_executable(003replacer ${FLEX_lexer00p_OUTPUTS})

# yacc program to recognize a^n b^n
BISON_TARGET(parser010 ${PROJECT_SOURCE_DIR}/src/010-matcher/grm/y.y ${PROJECT_SOURCE_DIR}/src/010-matcher/y.tab.c DEFINES_FILE ${PROJECT_SOURCE_DIR}/src/010-matcher/y.tab.h)
FLEX_TARGET(lexer010 ${PROJECT_SOURCE_DIR}/src/010-matcher/grm/fl.l ${PROJECT_SOURCE_DIR}/src/010-matcher/fl.yy.c )

ADD_FLEX_BISON_DEPENDENCY(lexer010 parser010)
add_executable(010sample ${BISON_parser010_OUTPUTS} ${FLEX_lexer010_OUTPUTS})
include_directories(010-sample ${BISON_parser010_OUTPUT_HEADER})


BISON_TARGET(parser011 ${PROJECT_SOURCE_DIR}/src/011-postfix/grm/y.y ${PROJECT_SOURCE_DIR}/src/011-postfix/y.tab.c DEFINES_FILE ${PROJECT_SOURCE_DIR}/src/011-postfix/y.tab.h)
FLEX_TARGET(lexer011 ${PROJECT_SOURCE_DIR}/src/011-postfix/grm/fl.l ${PROJECT_SOURCE_DIR}/src/011-postfix/fl.yy.c )
ADD_FLEX_BISON_DEPENDENCY(lexer011 parser011)
add_executable(011-postfix ${BISON_parser011_OUTPUTS} ${FLEX_lexer011_OUTPUTS})


# YACC program that reads the input expression and convert it to post fix expression.