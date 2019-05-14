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


y6<- factor(c())






