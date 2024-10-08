# ---------
#  21-2
# ---------
# ---------------------------------------------------------- #

house2 <- lm(ValuePerSqFt ~ Units * SqFt + Boro, data=housing)
house3 <- lm(ValuePerSqFt ~ Units + SqFt * Boro + Class,
             data=housing)
house4 <- lm(ValuePerSqFt ~ Units + SqFt * Boro + SqFt*Class,
             data=housing)
house5 <- lm(ValuePerSqFt ~ Boro + Class, data=housing)

# ---------------------------------------------------------- #

multiplot(house1, house2, house3, house4, house5, pointSize = 2)

# ---------------------------------------------------------- #

anova(house1, house2, house3, house4, house5)

# ---------------------------------------------------------- #

AIC(house1, house2, house3, house4, house5)
BIC(house1, house2, house3, house4, house5)

# ---------------------------------------------------------- #

# 建立新的二元變數,其為ValuePerSqFt是否大於150的指標變數
housing$HighValue <- housing$ValuePerSqFt >= 150

# 建立幾個模型
high1 <- glm(HighValue ~ Units + SqFt + Boro,
             data=housing, family=binomial(link="logit"))
high2 <- glm(HighValue ~ Units * SqFt + Boro,
             data=housing, family=binomial(link="logit"))
high3 <- glm(HighValue ~ Units + SqFt * Boro + Class,
             data=housing, family=binomial(link="logit"))
high4 <- glm(HighValue ~ Units + SqFt * Boro + SqFt*Class,
             data=housing, family=binomial(link="logit"))
high5 <- glm(HighValue ~ Boro + Class,
             data=housing, family=binomial(link="logit"))

# 用ANOVA(偏差平方和,deviance),AIC和BIC來診斷模型
anova(high1, high2, high3, high4, high5)
AIC(high1, high2, high3, high4, high5)
BIC(high1, high2, high3, high4, high5)

# ---------------------------------------------------------- #