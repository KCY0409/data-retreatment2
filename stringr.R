# stringr 은 tidyverse패키지에 포함되어 있는 글자 조작용 패키지로 ICU라고 불리는
# C library의 wrapper의 stringi패키지를 기반으로 함

if(!require(tidyverse)) install.packages("tidyverse")
library(stringr)

# 글자의 길이
# nchar()와 같이 길이를 결과로 주는 함수를 제공
str_length(c("abc","한글","ㅎㄱㅏ"))

# 글자의 일부만 가져오기
# 위치를 기준으로 일부만 가져오는 기능을 제공
x <- c("abcdef", "ghifjk")
str_sub(x, 3, 3)
str_sub(x, 3, 4)
str_sub(x, -4, -2)

# 일부분 바꾸기
# 일반적인 data.frame의 subset동작처럼 일부분을 지정하고, 값을 선언함으로써 바꾸는 것이 동작
str_sub(x, 3, 3) <- "X"
x

# 글자 반복해서 생성
x <- c("abcdef", "ghifjk")
str_dup(x, c(2, 3))

# 공백문자 제거
# 글자를 다루는데 가장 많이 쓴느 기능
# 좌우의 공백문자를 제거
x <- c("  a   ", "b   ",  "   c", "  c \n","\t   c  \n")
str_trim(x)

str_trim(x, "left")

# 패딩
# character vector의 length를 맞추기 위해 띄어쓰기를 추가
x <- c("abc", "defghi")
str_pad(x, 10)
str_pad(x, 10, "both")
str_pad(x, 4)

# 말줄임표현 만들기
x <- c("Short", "This is a long string")
x %>%
  str_trunc(10)

# 알파벳 조절
# 대소문자를 3가지 함수로 조절 가능
x <- "I like horses"
str_to_upper(x)
str_to_title(x)
str_to_lower(x)
