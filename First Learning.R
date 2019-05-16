x<-3
print(x)

msg<-"Hello world!"
print(msg) ## a beginning

sequence1<-1:50 ## : produces a sequence
print(sequence1)

x2<- 4L ## produce an integer
print(x2)

x3<-1/Inf ## Inf = infinity
print(x3)

x4<-c(123,345,567) ## Create a vector
x5<-c(TRUE,FALSE,T,F)
x6<-c(1+0i,5+4i)
x7<-c("lol","dfd")
print(x4,x5,x6,x7)

x8<-vector("integer", length = 5) ## Create a Vector with certain kind and length
print(x8)

x9<-c(123,TRUE) ## coertion will happen to make TRUE into 1
print(x9)

y1<-4:10 
print(y1)
as.logical(y1) ##转换vector类型，直接打印出来而不是进行赋值
print (y1)
as.character(y1)
print(y1)

y2<-list("I",34:36,TRUE,5L,6+2i,c(4,7,8)) ## a list can include different kinds of vectors or value
print(y2)

m1<- matrix(1:6,2,3) ## a table
print(m1)
dim(m1)
attributes(m1)

y3<-1:6
print(dim(y3)) 
dim(y3)<-c(3,2) ##将一个现成的向量赋值一定的结构成为表格
print(dim(y3))
print(y3)

y4<-4:8
y5<-14:18
print(cbind(y4,y5)) ##colomn binding to form a table
print(rbind(y4,y5))## row binding to form a table


y6<- factor(c("male","female","not sure","male")) ##withoout order factor
print(table(y6))
print(unclass(y6))

y7<- factor(c("primary school","high school","university"), levels=c("primary school","high school", "university"))
print(y7) ## with level of 

## missing values NA NaN
y8<- c(6,NaN,7,NA,44,NaN)
print(is.na(y8)) ##test if the object is NA
print(is.nan(y8))## test if the object is nan; nan belongs to one of the nas

y9<-data.frame(Serial=1:10, Score= 90:99)## 创造一个基本和SPSS类似的数据表格，列为变量，行为个案
print(nrow(y9))
print(ncol(y9))
print(y9)

z1<-1:3
names(z1)<-c("甲","乙","丙") ## name the numbers in the vector
print(z1)
print(names(z1))

z2<-list("jia" = 1, "yi"= 2, "bing"= "duzi") ## name the elements in the list
print(z2)

z3<- matrix(1:6,3,2) ## name the row and col in a matrix)
dimnames(z3)<-list(c("a","b","c"),c("j","k"))
print(z3)

z4<- c("a","c","b","b") #subsetting vector
print(z4[2])
print(z4[2:4])
print(z4[z4>"b"])
u<- z4>"b"
print(u)
print(z4[u])

z5<- list(first= 1:7, second= c(4.6, 6.7), third= "love") ## subsetting list
print(z5)
print(z5[1])
print(z5[[1]])
print(z5$third)
print(z5["third"])
print(z5[["third"]])
print(z5[c("first","third")]) ## sebseting more thatn one elements
name <- "first"
print(z5[[name]])## the [[]] can be used after computing, $ can not
print(z5$name)
print(z5[[c(1,3)]]) ##区别于99行的单中括号，双中括号能提取特定向量的特定元素
print(z5[[1]][[3]])## 同上
print(z5[[c(2,1)]])##同上
print(z5$sec) ## partial matching, use part of the name to match
print(z5[["sec", exact= FALSE]])

m2<- matrix(1:6,2,3)
print(m2[2,2]) ## the second row and second colomn
print(m2[2,]) ## the second row 
print(m2[,3])## the third colomn
print(m2[2,2, drop = FALSE]) ## return a 1*1 matrix
print(m2[2, , drop = FALSE]) ## return a 1*3 matrix

z6<-c(1,2,NA,3,NA,4) ## remove NA values in a vector
bad<- is.na(z6)
print(z6[!bad])

z7<- matrix(c(1,NA,2,3,4,4,5,6,NA,7,8,9),3,4,byrow = TRUE,list(c("a","b","c"),c("a","b","c","d")))
print(z7) 
good<- complete.cases(z7) ##选择表Z7中所有完整的行，标记为TRUE
print(z7[good])




