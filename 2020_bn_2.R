library(bnlearn)

course.grades<-read.table("2020_bn_nb_data.txt",head=TRUE)
course.grades.net<-hc(course.grades,score="k2")
course.grades.net.fit<-bn.fit(course.grades.net, course.grades)
plot(course.grades.net)
