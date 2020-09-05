'''
@author Kelly Lewis
9/5/2020

Linear Regression on IPO Data using year IPO went public and average number of Days the
stock had a higher percentage change than the S&P500

Data Download:
https://www.kaggle.com/proselotis/financial-ipo-data (1995 - 2016)
 '''
from sklearn.linear_model import LinearRegression
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

df = pd.read_csv('C:\\Users\\Kelly\\Desktop\\Econometric Projects\\IPODatafull.csv')

#print(df.head())

daysbetter_per_year = df.groupby('Year').DaysBetterThanSP.mean().reset_index()
X = daysbetter_per_year['Year']
X = X.values.reshape(-1,1)

y = daysbetter_per_year['DaysBetterThanSP']

line_fitter = LinearRegression()
line_fitter.fit(X,y)
y_predict = line_fitter.predict(X)

plt.scatter(X, y)
plt.xlabel("Year stock went public")
plt.ylabel("Average number of days where % change was higher than S&P 500")
plt.plot(X,y_predict)
plt.show()
