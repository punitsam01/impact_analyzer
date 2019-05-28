

#* @get /mymodel
bim <- function(val)
{
  
  library(data.table)
  library(data.tree)
  library(networkD3)
  library(htmlwidgets)

  
  getwd()
  setwd("C:/Users/punigupta/Documents/mymodel")
  mydata <- read.csv("data.csv")
  is.data.frame(mydata)
  k <- c(colnames(mydata))
  v <- val
  
  cdata <- subset(mydata, BusinessField == val)
  print(cdata)
  #cdata <- mydata[mydata[[k[1]]] == val ,] 
  
  cdata$pathString <- paste(val, cdata$Feature, cdata$XOM, cdata$UserStory, sep = "/")
  print(cdata)
  hdata <- as.Node(cdata)
  plot(hdata)
  dataNetwork <- ToDataFrameNetwork(hdata,"name")
  simpleNetwork(dataNetwork[-3],nodeColour = "blue",linkColour = "green",zoom=T,fontSize = 12)
  mynet <- simpleNetwork(dataNetwork[-3],linkColour = "#666",nodeColour = "blue",zoom=T,fontSize = 12)
  

  is.list(mynet)
  library(RJSONIO)
  library(htmlTable)
 # dnet <- htmlTableWidgetOutput(mynet)
 # print(dnet)
  
 # writeLines(as.html(mynet), "MyFlexTable.html")
  # Save ggplotly as widget in file test.html
  saveWidget(mynet, file = "test.html");
  
  #result <-toJSON( url="C:/Users/punigupta/Documents/mymodel/test.html")
  
  #return(result)
  return("Your Report is saved in path : C:/Users/punigupta/Documents/mymodel/test.html")
  
}



