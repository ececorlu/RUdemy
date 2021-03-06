library(tidyverse)

heart %>% group_by(cp) %>% summarise(Normallik = shapiro.test(oldpeak)$p.value)
bartlett.test(heart$oldpeak ~ heart$cp)

?kruskal.test
kruskal.test( x = heart$oldpeak , g = as.factor(heart$cp))

# Ho : Gruplar arasında farklılık yoktur
# Ha: En az bir grup diğerlerinden farklıdır. 

heart %>% group_by(cp) %>% summarise(Medyan = median(oldpeak , na.rm = T))


install.packages("dunn.test")
library(dunn.test)

?dunn.test

dunn.test(x = heart$oldpeak , g = heart$cp)
dunn.test(x = heart$oldpeak , g = heart$cp , method = "bonferroni")
dunn.test(x = heart$oldpeak , g = heart$cp , method = "sidak")


