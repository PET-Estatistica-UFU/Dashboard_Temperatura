if (!require('rsconnect'))install.packages("rsconnect");library(rsconnect)

rsconnect::setAccountInfo(name='bruno-mesquita', token='1BEBD53D250AC8D6CD73B6AD5702D91A', secret='+oPQ3XzaMdMaL8wXrFQZhH0IT24g9RLU7QtQZXlI')

rsconnect::terminateApp(appName = "dashboard_temperatura")
rsconnect::deployApp(appName = "dashboard_temperatura", forceUpdate = TRUE)
