# ---------
#  20-1
# ---------
# ---------------------------------------------------------- #

acs <- read.table("http://jaredlander.com/data/acs_ny.csv", sep = ",",
                   header = TRUE, stringsAsFactors = FALSE)

# ---------------------------------------------------------- #

acs$Income <- with(acs, FamilyIncome >= 150000)
library(ggplot2)
library(useful)
ggplot(acs, aes(x=FamilyIncome)) +
       geom_density(fill="grey", color="grey") +
       geom_vline(xintercept=150000) +
       scale_x_continuous(label=multiple.dollar, limits=c(0, 1000000))

# ---------------------------------------------------------- #

head(acs)

# ---------------------------------------------------------- #

income1 <- glm(Income ~ HouseCosts + NumWorkers + OwnRent +
               NumBedrooms + FamilyType,
               data=acs, family=binomial(link="logit"))
summary(income1)

library(coefplot)
coefplot(income1)

# ---------------------------------------------------------- #

invlogit <- function(x)
{
   1/(1 + exp(-x))
}
invlogit(income1$coefficients)

# ---------------------------------------------------------- #