# 패키지 준비하기
install.packages("stringi")
install.packages("devtools")
library(devtools)
devtools::install_github("cardiomoon/kormaps2014", force = TRUE)
library(kormaps2014)

# 대한민국 시도별 인구 데이터 준비하기
str(korpop1)
library(dplyr)
korpop1 <- rename(korpop1, pop = 총인구_명, name = `행정구역별_읍면동`)
korpop1$name <- iconv(korpop1$name, from = "UTF-8", to = "CP949")

str(kormap1)

# 모든 문자열 열을 UTF-8로 변환
korpop1 <- data.frame(lapply(korpop1, function(x) {
  if (is.character(x)) {
    iconv(x, from = "CP949", to = "UTF-8")
  } else {
    x
  }
}), stringsAsFactors = FALSE)


#단계 구분도 만들기
ggChoropleth(data = korpop1, # 지도에 표현할 데이터
             aes(fill=pop, map_id = code, tooltip = name), #색깔로 표현할 수 변수
             map = kormap1,
             interactive=T)

# 대한 시도별 결핵 환자 수 단계 구분도 만들기

str(tbc)
tbc$name <- iconv(tbc$name, from = "UTF-8", to = "CP949")

# 대한 민국 시도별 결핵환자 수 단계 구분도 만들기

ggChoropleth(data = tbc, # 지도에 표현할 데이터
             aes(fill=NewPts, map_id = code, tooltip = name), #색깔로 표현할 수 변수
             map = kormap1,
             interactive=T)

