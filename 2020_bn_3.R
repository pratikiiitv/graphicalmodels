library(bnclassify)

course.grades<-read.table("2020_bn_nb_data.txt",head=TRUE)
nb.grades<-nb(class="QP",dataset=course.grades)
plot(nb.grades)
nb.grades<-lp(nb.grades, course.grades, smooth=0)

p<-predict(nb.grades, course.grades)
cm<-table(predicted=p, true=course.grades$QP)
cm
