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

# [[:ascii:]] ASCII 문자(모두 128)
# [[:alpha:]] 알파벳 문자(영문자)
# [[:digit:]] 숫자
# [[:alnum:]] 영문자와 숫자
# [[:blank:]] 빈 문자(스페이스, 탭 등 전체)
# [[:space:]] 공백 문자
# [[:lower:]] 소문자
# [[:upper:]] 대문자

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

# ?를 활용한 조절
# ?? : 0또는 1개를 뜻하는데 0개를 선호
# +? : 1개 또는 이상을 뜻하는데 가능한 적은 갯수를 선호
# *? : 0개 또는 이상을 뜻하는데 가능한 적은 갯수를 선호
# {n,}? : n개 또는 이상을 뜻하는데 가능한 적은 갯수를 선호
# {n,m}? : n개에서 m개 사이를 뜻하는데 가능한 적은 갯수를 선호

# ?를 활용한 조절의 사용예
# 아무 글자(.)가 모든 갯수가 가능한(*) 구성이
# 사이에 있는 경우입니다. .*과 .*?가 어떻게 다르게 동작하는지 확인해 보세요.
stri<-"<p> <em>안녕</em>하세요 </p><p>테스트입니다.</p>"
sub("<p>.*</p>","tar",stri)

sub("<p>.*?</p>","tar",stri)

# 그룹
# 정규표현식에서는 글자 하나하나를 하나의 개체로 인식
x <- c("abc","abcabc", "abcabcadc", "abcabcabc", "adcabcabcabc")
grep("(abc){3}", x)

# 그룹의 캡쳐 및 사용
# 그룹은 sub등 치환 기능을 사용할 때 더 빛을 발합니다.
# 찾는 패턴에서 그룹을 지어둔 내용은 순서대로 \\1,\\2의 방법으로 바꿀 패턴에서 사용 가능
x <- c("^ab", "ab", "abc", "ab 12")
gsub("(ab) 12", "\\1 34", x)

# 또는 의 사용
# |는 or 의 뜻으롷 사용하는 글자
# 우선 단순 매칭에서 사용하는 경우 / ()과 함께 사용 가능
x <- c("^ab", "ab", "ac", "abc", "abd", "abe", "ab 12")
grep("abc|abd", x)

grep("a(c|bd)", x)
# 함께 사용하는 함수
# grep : 찾고자 하는 패턴이 있는 벡터의 위치를 결과로 줌
# grepl : 찾고자 하는 패턴 인지를 TRUE, FALSE 벡터로 표현

# sub : 찾고자 하는 첫번째 패턴을 두번째 인자로 바꿈
# gsub : 찾고자 하는 모든 패턴을 두번째 인자로 바꿈

# regexpr : 찾고자 하는 패턴의 글자내 시작점을 결과로 줌
# gregexpr: 찾고자 하는 패턴의 글자내 위치를 모두 결과로 줌

# dir : 찾고자 하는 패턴의 파일 이름을 결과로 줌

# strsplit: 자르고자 하는 패턴으로 글자 데이터를 자름

# apropos : Environment에 보여주지 않는 기본 객체들을 보여줌

# find : 객체가 어디에 포함되어있는지 보여줌


# 우편번호
# 우리나라는 새로운 방식인 "12345"와 "123-456" 두 가지 방식 사용
# ^[0-9]{3}([0-9]{2}|-[0-9]{3})&

# 주민등록번호
# ^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01]))-[1-4][0-9]{6}$

# 전화번호
# ^\\(?[0-9]{2,3}\\)?[-. ]?[0-9]{3,4}[-. ]?[0-9]{4}$
# 그룹과 gsub 양식을 통일시킬 수도 있음
gsub("^\\(?([0-9]{2,3})\\)?[-. ]?([0-9]{3,4})[-. ]?([0-9]{4})$",
     "(\\1) \\2-\\3",data)

# 이메일 주소
# /^([a-z0-9_\\.-]+)@([0-9a-z\\.-]+)\.([a-z\\.]{2,6})$/

# 인터넷 주소
# /^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/[[:word:]]_\\.-]*)*\\/?$/




