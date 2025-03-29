# R语言基础语法入门

## 0.R Language、R Studio安装

## 1.写数据操作（csv、xlsx）
iris <- read.csv("iris.csv")
write.csv(iris, "iris2.csv")

## 2.数据索引、常见数据类型操作

### 2.1查看数据结构
head(iris)
tail(iris)
str(iris)
summary(iris)

### 2.2找到符合要求的数据
iris$SepalLengthCm
iris[1, ]
iris[1:5, ]
iris[iris$SepalLengthCm > 6, ]

### 2.3简单统计量
mean(iris$SepalLengthCm)
sd(iris$SepalLengthCm)
cor(iris$SepalLengthCm, iris$SepalWidthCm) # Peasron相关系数
table(iris$Species)

### 2.4矩阵和数组运算
matrix(1:9, nrow=3, ncol=3)
array(1:9, dim=c(3, 3, 3))
t(matrix(1:9, nrow=3, ncol=3))
solve(matrix(1:4, nrow=2, ncol=2))

### 2.5赋值和工作空间
data1 <- iris$SepalLengthCm[1]
data2 <- iris[1, 1]
data3 <- iris[iris$SepalLengthCm > 6,]

a %<% 5
a %<% b %<% 5

## 3.程序逻辑结构和函数实现

if(x>1) {
  y <- 2.5
} else {
  y <- -y
}

x <- 0.0; s <- 0; n <- 5
for(i in 1:n){
  x <- 2*x + 1
  s <- s + x
}


## 4.简单的机器学习、回归模型和结果表示（统计建模所需基本）

### 4.1线性回归模型
lm <- lm(SepalLengthCm~SepalWidthCm, data=iris)
summary(lm)
plot(lm)
anova(lm)
confint(lm)

lm2 <- lm(SepalLengthCm~SepalWidthCm^2, data=iris)
summary(lm2)
plot(lm2)
anova(lm2)
confint(lm2)

### 4.2随机森林模型
library(randomForest)
rf <- randomForest(SepalLengthCm ~ SepalWidthCm + PetalLengthCm + PetalWidthCm, data=iris)
predict(rf, newdata=iris)
importance(rf)
plot(rf)

## 5.RMarkdown基础（LaTex拓展知识）
## 6.其他拓展（包的安装、数据读取的一些注意事项等）


# 与Python语法比较
## 统计建模相关内容在Python中的用法
## R和Python的效率比较、语法实现比较