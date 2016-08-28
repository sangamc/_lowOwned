# ui.R
library(rhandsontable)


shinyUI(fluidPage(
  
  titlePanel("LO%Own3d \"DFS\" App"),
  sidebarLayout(
    sidebarPanel(width = 3,
      selectInput("Sport", label = ("Sport"), 
                  choices = list("Football", "Basketball", "Baseball", "Soccer", "LOL" ), selected = "Football"),
      
      selectInput("Team", "Team:", c("All",unique(as.character(players$Team) ))),
      selectInput("Pos", "Position:", c("All",unique(as.character(players$Pos) ))),
      
      sliderInput("Salary", 
                  label = ("Salary"),
                  min = 2000, max = 12000, step = 100,value = c(2000, 12000)
      ),
      
      sliderInput("Projection",  label = ("Projection"),
                  min = 0, max = 50, value = c(1, 50), step = 1),
      
      sliderInput("KJD",  label = ("KJD"),
                  min = -5, max = 20, value = c(-5, 20), step = 0.1),
      
      
      sliderInput("NoLU", label = ("Number of Lineups"),
                  min = 0, max = 10, value = 5)
      #radioButtons("contest", label = ("Draftkings Contest"),
      #             choices = list("Main" = 1, "Turbo" = 2, "Late" = 3), selected = 1),
      #submitButton("Solve for Best Lineups")
    ),
    mainPanel(
      #img(src='backdrop.jpg', align = "right"),
      #textOutput("text1"),
      # Create a new row for the table.
      tabsetPanel(
        id = 'dataset',
        tabPanel('Player Pool', fluidRow(DT::dataTableOutput("table")), textOutput("text2")),
        tabPanel('Lineups', fluidRow(DT::dataTableOutput("table2")),
                 img(src="Lu1.PNG"),
                 img(src="Lu2.PNG")),
        tabPanel('KJD', rHandsontableOutput("table3"))
      ),
      textOutput("text1")
      
      
    )
  )
))