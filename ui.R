###################################
#####     Biorhythm ui.R      #####
###################################

# load shiny at beginning at both scripts
library(shiny)

shinyUI(fluidPage(
  titlePanel(paste ("Shiny's Biorhythm")),
  
  sidebarPanel(
    
    h3("",
       a("Developing Data Products", href="https://www.coursera.org/course/devdataprod")),
    
    img(src = "DevelopingDataProducts.jpg", height = 480, width = 480), 
    
    br(), br(),
    
    HTML("Peer Assessments project by Eduardo B. Díez"),
    hr(),
    h3("",a("Input panel")),
    dateInput(inputId = "birthday",
              label = "The day of your birthday (do not lie)",
              start = "1900-01-01",
              max = Sys.Date(),
              value = "1983-09-14"
    ),
    
    br(),
    
    dateInput(inputId = "today",
              label = "Today or the interest date",
              start = "1900-01-01",
              max = Sys.Date()+100,
              value = Sys.Date()
    ),
    
    br(),
    
    sliderInput(inputId = "amountofdays",
                label = "Days to show",
                min = 3,
                max = 11,
                value = 9,
                step = 1)
    
  ),
  
  mainPanel( 
    
    HTML('<style type="text/css"> .well { background-color: #F8F2E4; }
    .shiny-html-output { font-size: 20px; line-height: 21px; } </style>'),
    h4("A little of history . . . "),
    h5("The practice of consulting biorhythms was popularized in the 70s through a series of books written by Bernard Gittelson, among which are Biorhythm - A Personal Science (Biorhythm - A Personal Science) Biorhythm Charts of the Famous and Infamous ( Letters biorhythmic famous and infamous) and Biorhythm Sports Forecasting (sports Forecast by biorhythms). Gittelson's company, Biorhytm Computers Inc., earned money by selling biorhythm calculators and personalized letters biorhythmic yet never anything in predicting sports scores." , 
       a("(Wikipedia)", href="http://es.wikipedia.org/wiki/Biorritmo")),
    h6("(It should be remembered that this prediction is free. Also, the author is not liable for any collateral damage by misuse from your side. You could read the", 
       a("  ioslides RStudio interactive style presentation ", href="http://turpial.shinyapps.io/SlidesVerControl/SlidesVerControl.Rmd#1"), "about this application.)"),
    
    hr(),
    
    textOutput("textDisplay"),
    plotOutput('thebioplot'),
    
    # giving some air at the bottom so the aplication fix inside 
    # the RStudio slides presentation 
    hr(), br(), br(), br(), br(), br()
    
  )
)
)