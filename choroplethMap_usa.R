# 패키지 설치
install.packages("mapproj")
install.packages("ggiraphExtra")
library(ggiraphExtra)

# 미국 주별 범죄 데이터 준비하기
str(USArrests)
head(USArrests)
library(tibble)

crime <- rownames_to_column(USArrests, var = "state")
crime$state <-tolower(crime$state)

# 미국 주 지도 데이터 준비하기
install.packages("maps")
library(ggplot2)
states_map <- map_data("state")
str(states_map)

# 단계 구분도 만들기
ggChoropleth(data = crime, # 지도에 표현할 데이터
             aes(fill=Murder, map_id=state), # 색깔로 표현할 변수, 지역 기준 변수
             map = states_map) #지도 데이터

# 인터랙티브 단계 구분도 만들기
ggChoropleth(data = crime, # 지도에 표현할 데이터
             aes(fill=Murder, map_id=state), # 색깔로 표현할 변수, 지역 기준 변수
             map = states_map, #지도 데이터
             interactive = T) 

