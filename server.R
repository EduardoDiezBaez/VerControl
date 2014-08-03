######################################
#####     Biorhythm server.R     #####
######################################

# load shiny at beginning at both scripts
library(shiny)

# and load anything we are going to need
library(reshape)                        # to melt 
library(ggplot2)                        # to plot
library(ggthemes)                       # to give a nice look

# server is defined here
shinyServer(function(input, output) {         
  
  output$thebioplot <- renderPlot({
    
    # dates between dates
    # the time zone should be the corresponded with the aplication server
    #
    mydays <- as.numeric(difftime(input$today,  input$birthday, tz="Europe/London"), units="days")
    
    # initialize the variables
    myDate <- rep("", input$amountofdays)
    Health <- Emotional <- Intelectual <- rep(0, input$amountofdays)
    
    # calculate values with the imputs from ui.R
    for (i in 1 : input$amountofdays) {
      myDate[i] <- paste("+", as.character(i-2), sep="")
      Health[i] <- sin(2*pi*(mydays+(i-2))/23)
      Emotional[i] <- sin(pi*(mydays+(i-2))/14)
      Intelectual[i] <- sin(2*pi*(mydays+(i-2))/33)
    }
    
    # make a wide table with the values & change the names
    y <- data.frame (myDate, Emotional, Health, Intelectual)
    actual <- levels(y$myDate)
    actual[1] <- "Yesterday"
    actual[2] <- "Today"
    actual[3] <- "Tomorrow"
    levels(y$myDate) <- actual
    
    # transform the table from wide to long because ggplot works with long
    y2 <- melt(y, id=c("myDate"), variable_name="BioCurve")
    
    # plot the three values
    g <- qplot(myDate, value, data=y2,
               main = paste("Biological Rhythms",
                            "\n",
                            "Birthday: ", 
                            format(input$birthday, "%d- %b -%Y"),
                            "\n",
                            "Today: ", 
                            format(input$today, "%d- %b -%Y"), sep=""),
               color = BioCurve,
               group=BioCurve,
               geom=c("line"))   
    
    # make the plot to look better 
    p <- g +  xlab("") +  ylab("") + theme_wsj() 
    
    # show the plot
    p

  })
  
  })