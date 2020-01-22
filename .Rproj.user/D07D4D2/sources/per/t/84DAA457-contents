# 정규표현식
# 특정한 규칙을 가진 문자열의 집합을 표현하는데 사용하는 형식 언어
# -> 문법을 외워야 해서 읽고 사용하기 어려움 / 익숙해지면 글자를 다루는 코드 작성 쉬움

# R의 정규표현식
# 표준문법인 POSIX와 perl방식의 PCRE 2가지가 대표적
# R은 POSIX의 basic과 Extended 중 Extended를 지원
# perl = T 옵션으로 PCRE방식을 사용가능

# 단순 매칭
# grep은 찾고자하는 문자열이 있는지 찾아주는 함수
# grep(찾고자하는 패턴, 대상벡터)
data <-c("apple", "banana", "banano")
grep("banana", data)

grepl("banana", data)

# 문자열의 시작
# 단순 매칭하는 상황에서 "안에 패턴을 작성할때 ^을 맨 앞에 같이 사용하면
# 그 뒤의 글자로 시작하는 데이터만 찾는다.
data <-c("apple", "banana", "banano", "a banana")
grep("banana", data)

grep("^banana", data)

# 문자열의 끝
# 단순 매칭하는 상황에서 "안에 패턴을 작성할 때 $을 맨 뒤에 같이
# 사용하면 그 앞의 글자로 끝나는 데이터만 찾는다.
data <-c("apple", "banana", "banano", "a banana", "a banana a")
grep("banana", data)

grep("banana$", data)

# 완전히 일치하는 경우만
data <-c("apple", "banana", "banano", "a banana", "a banana a")
grep("banana", data)

grep("^banana$", data)

# 사용해보기
# nycflights13 패키지의 airports 데이터에 이름이 New가 포함되는 데이터는 몇 개?
# 529개
if(!requireNamespace("nycflights13")) install.packages("nycflights13")
library("nycflights13")
library(dplyr)
head(airports)
View(airports)

airportD <- c(airports$name, airports$tzone)
grep("New",airportD)
# nycflights13 패키지의 airports 데이터에 이름이 New로 시작되는 데이터는 몇 개?
# 13개
grep("^New", airportD)

# 임의의 글자 한 개
# .은 정규표현식에서 무엇이든 한 개의 글자를 의미
x <- c("apple", "banana", "pear")
grep(".a.", x)

# 메타문자를 글자 그대로
# \를 메타문자 앞에 쓰면 글자 그대로로 인식합니다.
# 그런데 \또한 메타문자로서 동작하기 때문에 \\를 작성해줘야 함
x <- c("apple", "banana", "pear",".apple")
grep("\\.a.", x)

grep("\.a.", x)

# 문자 클래스
# 문자클래스를 표현하는 []는 대괄호 안에 있는 글자 하나하나가 문자클래스로 가능한 경우
x <- c("123", "1357", "999990", "1133")
grep("[02468]", x)

# 문자 클래스 내에서는 ^가 지정한 글자들을 제외하고라는 뜻
x <- c("123", "1357","999990","0200","02468")
grep("[^02468]", x)

#사용해 보기
# nycflights13 패키지의 airports데이터에 이름이 숫자로 끝나는 데이터는 몇개인가?
# 5926개
airportD2 <- c(airports$faa, airports$name, airports$lat , airports$lon, airports$alt, airports$tz, airports$dst, airports$tzone)
View(airportD2)
grep("[[:digit:]]$",airportD2)
997 + 4929

# 앞에 글자가 없거나 하나
# ?는 글자 뒤에 붙어서 그 글자가 한개 있거나 없는 경우 모두를 표현할 때 사용
x <- c("apple", "banana", "pear", "aple")
grep("app?", x)

# 앞의 글자가 하나 이상
# + 는 글자 뒤에 붙어서 그 글자가 한대 이상 연속하는 모두를 표현할 때 사용
x <- c("apple", "banana", "pear", "aple")
grep("p+", x)
grep("ap+", x)

# 앞의 긃자가 없거나 하나 이상
# *는 글자 뒤에 붙어서 그 글자가 없는 경우부터 여러 개 연속하는 모두를 표현할 때 사용
x <- c("apple", "banana", "pear", "aple", "abble", "appppppppppple")
grep("app*", x)

# 글자의 갯수를 조절하기
# {n} : 글자가 n개인 경우
# {n, } : 글자가 n개 이거나 더 많은 경우 
# { ,m} : 글자가 m개 이거나 더 적은 경우
# {n,m} : 글자가 n개에서 부터 m개 사이에 있는 경우

# 정말 그렇게 동작할까?
x <- c("a","aa","aaa","aaaa","aaaaa")
grep("a{3}", x)
grep("^a{3}$", x)
grep("a{3,}", x)
grep("a{,3}", x)
grep("a{2,3}", x)
