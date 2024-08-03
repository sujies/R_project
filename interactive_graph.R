#패키지 준비
install.packages("plotly")
library(plotly)

# ggplot2로 그래프 만들기
library(ggplot2)
p <- ggplot(data=mpg,aes(x = displ, y = hwy, col = drv)) +geom_point()

# 인터랙티브 그래프 만들기
ggplotly(p)

# 인터랙티브 막대 그래프 만들기
p2 <-ggplot(data = diamonds, aes(x= cut, fill = clarity))+geom_bar(position="dodge")
ggplotly(p2)

#dygraphs 패키지로 인터랙티브 시계열 그래프 만들기
install.packages("dygraphs")
library(dygraphs)
economics <- ggplot2::economics
head(economics)

library(xts)
eco <- xts(economics$unemploy, order.by=economics$date)
head(eco)

dygraph(eco)

dygraph(eco) %>% dyRangeSelector()


# 저축률
eco_a <-xts(economics$psavert, order.by=economics$date)

#실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

eco2 <- cbind(eco_a, eco_b) #데이터 결합
colnames(eco2) <- c("psavert","unemploy") # 변수명 바꾸기
head(eco2)

dygraph(eco2) %>% dyRangeSelector()
