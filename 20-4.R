# ---------
#  20-4
# ---------
# ---------------------------------------------------------- #

library(survival)
head(bladder)

# ---------------------------------------------------------- #

# 首先查看一部份資料
bladder[100:105, ]

# 現在查看透過Surv所建立的反應變數
survObject <- with(bladder[100:105, ], Surv(stop, event))

# 把它顯示出來
survObject

# 以matrix(矩陣)呈現它們
survObject[, 1:2]

# ---------------------------------------------------------- #

cox1 <- coxph(Surv(stop, event) ~ rx + number + size + enum,
              data=bladder)
summary(cox1)

plot(survfit(cox1), xlab="Days", ylab="Survival Rate",
     conf.int=TRUE)

cox2 <- coxph(Surv(stop, event) ~ strata(rx) + number + size + enum,
              data=bladder)
summary(cox2)

plot(survfit(cox2), xlab="Days", ylab="Survival Rate",
     conf.int=TRUE, col=1:2)
legend("bottomleft", legend=c(1, 2), lty=1, col=1:2,
       text.col=1:2, title="rx")

# ---------------------------------------------------------- #

cox.zph(cox1)
cox.zph(cox2)
head(bladder2)

ag1 <- coxph(Surv(start, stop, event) ~ rx + number + size + enum +
                  cluster(id), data=bladder2)
ag2 <- coxph(Surv(start, stop, event) ~ strata(rx) + number + size +
                  enum + cluster(id), data=bladder2)

plot(survfit(ag1), conf.int=TRUE)
plot(survfit(ag2), conf.int=TRUE, col=1:2)
legend("topright", legend=c(1, 2), lty=1, col=1:2,
       text.col=1:2, title="rx")

# ---------------------------------------------------------- #