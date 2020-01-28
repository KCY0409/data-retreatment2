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

# 글자 순서
# order와 sort가 글자를 기준으로 동작
x <- c("f", "a", "d")
str_order(x)

str_sort(x)

# 패턴 매칭
# 정규표현식과 함께 쓰이는 패턴 매칭 함수들입니다.
strings <- c(
  "apple",
  "219 733 8965",
  "329-293-8753",
  "Work: 579-499-7527; Home: 543.355.3679"
)
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
str_subset(strings, phone)

str_detect(strings, phone)
str_count(strings, phone)

# 위치 정보
# 패턴에 해당하는 글자의 위치를 시작과 끝이라는 형태로 결과를 줌
# str_locate_all(strings, phone)를 실행해서 아래와 어떻게 결과가 다른지 확인
str_locate_all(strings, phone)
str_locate(strings, phone)

# 패턴 추출
# 정규표현식을 활용해 해당되는 패턴의 텍스트만 가져오는 함수
# simpify옵션이 어떻게 동작한 것인지 str_extract_all(strings, phone)를 실행해 비교
str_extract_all(strings, phone)
str_extract(strings, phone)
str_extract_all(strings, phone, simplify = TRUE)

# 그룹정보 보기
# str_extract()는 해당되는 텍스트를 가져오는 함수라면 str_match()를 해당되는 것의 정보를 보여주는 함수
# 그래서 그룹으로 묶인 텍스트의 정보를 함께 파악 가능
str_match(strings, phone)
str_match_all(strings, phone)

# 글자 바꾸기
# sub()와 gsub()에 해당하는 함수로 데이터가 맨 앞에 쓰인다는 점대문에
# 파이프연산자와 상성이 좋다.
str_replace(strings, phone, "XXX-XXX-XXXX")
str_replace_all(strings, phone, "XXX-XXX-XXXX")

# 글자 나누기
# 하나의 데이터 상태로 있는 character를 기준 글자로 나누어 여러 개의 데이터로 바꾸는 동작
str_split("a-b-c-d-e", "-")
str_split_fixed("a-b-c-d-e", "-", n = 3)


# 1. 아래 조건에 해당하는 정규표현식 패턴을 작성
# 국내 휴대전화번호
# ^([0-1]{3})?[-]?[0-9]{4}?[-]?[0-9]{4}$
# html의 주석 <! -- 주석내용 -->
# ^(<! --)?([\w\d\a-zA-Z\0-9\가-힣])?(-- >)$
# IPv4
# Class A
# ^([0-1][0-2][0-6])?[.]?([0-2][0-5][0-5][.]){2}?([0-2][0-5][0-4])$
# Class B
# ^([1][2-8][0-9])|([1][9][0-1])


