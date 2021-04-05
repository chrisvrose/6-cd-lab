cmake_minimum_required(VERSION 3.0.0)
project(cd-lab VERSION 0.1.0)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)


# this is one program
FLEX_TARGET(parser00b src/00-basics/grm/fl.l src/00-basics/fl.yy.c)
add_executable(cd-lab0 ${FLEX_parser00b_OUTPUTS})
target_link_libraries(cd-lab0 fl)

# Write a scanner to count the number of words, characters, lines and whitespaces.
FLEX_TARGET(parser00c src/00-counter/grm/fl.l src/00-counter/fl.yy.c)
add_executable(counter ${FLEX_parser00c_OUTPUTS})
target_link_libraries(counter fl)


# Write a program to recognize variable names, operators and keywords used in C
FLEX_TARGET(parser00v src/00-varname/grm/fl.l src/00-varname/fl.yy.c)
add_executable(varname ${FLEX_parser00v_OUTPUTS})
target_link_libraries(varname fl)


# Write a LEX program to count the number of ‘scanf’ and ‘printf’ statements in a C  program. Replace them with ‘readf’ and ‘writef’ statements respectively. 
FLEX_TARGET(parser00p src/00-replacer/grm/fl.l src/00-replacer/fl.yy.c)
add_executable(replacer ${FLEX_parser00p_OUTPUTS})
target_link_libraries(replacer fl)
