#################################################################################
# 2. EDA
#################################################################################

# �������� ����� �����ϸ� EDA�� �����սô�.

# 1. �غ��۾� ---------------------------------------------

# 1.1 �غ��۾� : �ʿ��� ���̺귯�� �ε�, �����ͼ� ��������
library(tidyverse)

setwd("D:/����/ȸ��_�����ͺм�_2020/7_����������Ʈ/1day")  #�۾����� ����
data <- read.csv("credit_NA.csv", na.strings = c("", "NA", "NULL","unkown"))
str(data)


# 1.2 ������ ������ ���캾�ϴ�.

data$Creditability <- as.factor(data$Creditability)
data$AccountBalance <- as.factor(data$AccountBalance)

data$Payment <- as.factor(data$Payment)
data$Purpose <- as.factor(data$Purpose)

data$Employment <- as.factor(data$Employment)
data$SexMarital <- as.factor(data$SexMarital)
data$CurrentAddress <- as.factor(data$CurrentAddress)
data$MostValuable <- as.factor(data$MostValuable)

data$AppartmentType <- as.factor(data$AppartmentType)
data$NoCredits <- as.factor(data$NoCredits)
data$Occupation <- as.factor(data$Occupation)
data$Telephone <- as.factor(data$Telephone)
data$ForeignWorker <- as.factor(data$ForeignWorker)

str(data)

str(data$Creditability)


# 2. EDA ----------------------------------------------------
# ��Ʈ �׸��� ������ �ƴմϴ�. 
# ��Ʈ�� �׸���, �����͸� ����, �ľ�(Ȥ�� ��������� ����)�Ǵ� ������ �ּ����� ����ô�.

# 2.1 1�ܰ� : ��� ������ ���ؼ�, ������跮�� �ð�ȭ�� ���� ���� ������ Ȯ���Ͻÿ�.

# ������跮 
summary(data)

# ������ ������
table(data$Creditability)
prop.table(table(data$Creditability))
qplot(Creditability, data= data, geom = 'bar')

# ������
qplot(Age, data= data, geom = 'histogram')
hist(data$Age, breaks = 50)
boxplot(data$Age, horizontal = T)
# ���� ������ 19~75, 2~30 


# 2.2 2�ܰ� : �������� ����� ���ΰ� Target �������� ���踦 �ð�ȭ�Ͽ� �ľ��Ͻÿ�.
# ���� ���� ������ �����Ͽ� ���� ���ô�.
# ��Ʈ �׸��� ������ �ƴ϶� �����͸� ����, �ľ�(Ȥ�� ��������� ����)�Ǵ� ������ ���� ���ô�.



#  ���� 1: ���� �ſ뵵�� ������ �̷��� �ſ뵵�� ���� ���̴�.
table(data$Creditability)

#  ���� 2: �����ܰ��� ������ �ſ뵵�� ���� ���̴�.
table(data$AccountBalance)
prop.table(table(data$AccountBalance))
qplot(AccountBalance, data= data, geom = 'bar')

mosaicplot(AccountBalance ~ Creditability, data = data, color = TRUE)
abline(a= 0.7, b=0, col = 'red')
# �ּ�: �ܰ��� �ִ� ����� �ſ뵵�� ����, ������ ������ ������ ���� ������� �ſ뵵�� ����.

#  ���� 3: ��û�� ����Ⱓ�� ����� �ſ뵵�� ���� ���̴�
qplot(CreditDuration, data= data, geom = 'histogram')
hist(data$CreditDuration, breaks = 50)
boxplot(data$CreditDuration, horizontal = T)

qplot(CreditDuration, data = data, geom = 'density', colour = Creditability)
# �ּ�: ����Ⱓ�� ª������ �ſ뵵�� ���� ������ �ִ�.


#  ���� 4: ��û�� ����ݾ��� �������� �ſ뵵�� ���� ���̴�
qplot(CreditAmount, data= data, geom = 'histogram')
hist(data$CreditAmount, breaks = 50)
boxplot(data$CreditAmount, horizontal = T)

qplot(CreditAmount, data = data, geom = 'density', colour = Creditability)
# �ּ�: ����ݾ��� �������� �ſ뵵�� ���� ������ �ִ�.


#  ���� 5: �ٹ��Ⱓ�� ��� �ſ뵵�� ���� ���̴�
table(data$Employment)
prop.table(table(data$Employment))
qplot(Employment, data= data, geom = 'bar')

mosaicplot(Employment ~ Creditability, data = data, color = TRUE)
abline(a= 0.7, b=0, col = 'red')
# �ּ�: �ٹ��Ⱓ�� ����� �ſ뵵�� ���� ������ �ִ�.


#  ���� 6: ���ֱⰣ�� ��� �ſ뵵�� ���� ���̴�
table(data$CurrentAddress)
prop.table(table(data$CurrentAddress))
qplot(CurrentAddress, data= data, geom = 'bar')

mosaicplot(CurrentAddress ~ Creditability, data = data, color = TRUE)
abline(a= 0.7, b=0, col = 'red')
# �ּ�: ���ǹ��� ���̰� ���°����� ���δ�.


#  ���� 7: �ε����� ���� ��ġ�ִ� �ڻ��� ��� �ſ뵵�� ���� ���̴�
table(data$MostValuable)
prop.table(table(data$MostValuable))
qplot(MostValuable, data= data, geom = 'bar')

mosaicplot(MostValuable ~ Creditability, data = data, color = TRUE)
abline(a= 0.7, b=0, col = 'red')
# �ּ�: �ε����� ������ ��� ������ ����ų �ʿ䰡 ���� �ſ뵵�� ������ ���� ������ ���δ�.


#  ���� 8: �ڰ��� ��� �ſ뵵�� ���� ���̴�
table(data$AppartmentType)
prop.table(table(data$AppartmentType))
qplot(AppartmentType, data= data, geom = 'bar')

mosaicplot(AppartmentType ~ Creditability, data = data, color = TRUE)
abline(a= 0.7, b=0, col = 'red')
# �ּ�: �ε����� ������ ��� ������ ����ų �ʿ䰡 ���� �ſ뵵�� ������ ���� ������ ���δ�.
#       ���� ���������� ��쿡�� �����ȯ�ɷ��� ���� �ſ뵵�� ���� ������ �Ǵܵȴ�.


#  ���� 9: ����Ǽ��� �������� �ſ뵵�� ���� ���̴�
table(data$NoCredits)
prop.table(table(data$NoCredits))
qplot(NoCredits, data= data, geom = 'bar')

mosaicplot(NoCredits ~ Creditability, data = data, color = TRUE)
abline(a= 0.7, b=0, col = 'red')
# �����ȯ�ɷ°� �����ȯ���� ���� �ſ뵵 ����� ����������,
# 4~5 �� ������ ������ �ִ� ����� ���� �ſ����� ������,
# �̺��� ������ ������ �����ȯ�� ���� �ſ뵵 ����� ���� �ſ뵵�� ��������,
# �̺��� ������ ������ �����ȯ�ɷ¿� �ǹ��� �־� �ſ뵵�� ��������.


#  ���� 10: ��ȭ�Ⱑ ������ �ſ뵵�� ���� ���̴�
table(data$Telephone)	
prop.table(table(data$Telephone))	
qplot(Telephone, data= data, geom = 'bar')

mosaicplot(Telephone ~ Creditability, data = data, color = TRUE)
abline(a= 0.7, b=0, col = 'red')
# �ּ�: ��ȭ�Ⱑ �ִ� ������� �ſ뵵�� ���� ������ �ִ�.





# ����1


# ����2


# ����3


# ...


# ����n



# ���� ���� ����1



# ���� ���� ����2

library(mosaic)
data$Purpose <-  as.factor(data$Purpose)
data$Creditability <-  as.factor(data$Creditability)
data$ForeignWorker <-  as.factor(data$ForeignWorker)


mosaicplot(Creditability ~ Purpose, data = data, color = TRUE)
mosaicplot(Purpose ~ Creditability, data = data, color = TRUE)
abline(a= 0.68, b=0, col = 'red')


mosaicplot(ForeignWorker ~ Creditability, data = data, color = TRUE)
abline(a= 0.68, b=0, col = 'red')

prop.table(table(data$Creditability, data$Purpose),2)


# Age�� Telephone�� �����Ͽ� ������ �������...
# 1) ���� ������ ������ ���ַ�...
data$AgeGroup <- cut(data$Age, breaks = c(0,40,100), labels = c(0,1))
data %>% head()
# 2) �� ���ָ� ����.
ifelse(data$AgeGroup == 0 & data$Telephone == 1
       , 1
       , ifelse(data$AgeGroup == 1 & data$Telephone == 1
          , 2
          , ifelse(data$AgeGroup == 1 & data$Telephone == 2, 3, 4)
          )
       )

# 2.3 Target���� ���迡 ���ؼ� ���� ������ �׷����� ������ �����Ͻÿ�.
# �� ������ ���� ������
AccountBalance - �ܾ׿���, ���尳�����ο� ���� ��Ȯ�ϰ� �ſ뵵�� ����
AppartmentType - ��Ʈ�� ��� �ſ뵵 ����
NoCredits - ����Ǽ��� 4~5���϶� �ſ뵵�� ���� ������, ���Ժ����� ����� ��� ���δ�.

# �� �ָ��� ������
Telephone - ������
MostValuable - �߰� ���� �ʿ�
Employment (���̿� �����ʿ�)
CreditDuration, CreditAmount (���� ���� ������ �ʿ�)

# �� ������ ���� ���̴� ������
CurrentAddress




