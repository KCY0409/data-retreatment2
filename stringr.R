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
