#library(shiny)
#library(ggplot2)

shinyServer(function(input, output) {
  
  output$table <- DT::renderDataTable(DT::datatable ({
    if (input$Team != "All") {
      players <- players[players$Team == input$Team,]
    }
    if (input$Pos != "All") {
      players <- players[players$Pos == input$Pos,]
    }
    if (input$Salary[1] != 2000) {
      players <- players[players$Salary >= input$Salary[1],]
    }
    if (input$Salary[2] != 12000) {
      players <- players[players$Salary <= input$Salary[2],]
    }
    if (input$Projection[1] != 1) {
      players <- players[players$FP >= input$Projection[1],]
    }
    if (input$Projection[2] != 50) {
      players <- players[players$FP <= input$Projection[2],]
    }
    if (input$KJD[1] != -5) {
      players <- players[players$KJD >= input$KJD[1],]
    }
    if (input$KJD[2] != 20) {
      players <- players[players$KJD <= input$KJD[2],]
    }
    players
  }))
  
  output$table2 <- DT::renderDataTable({
        DT::datatable(results, options = list(lengthMenu = c(8),pageLength = 8))
  })
  
  output$table3 <- DT::renderDataTable({
    DT::datatable(results2, options = list(lengthMenu = c(8),pageLength = 8))
  })
  
  #output$text2 <- renderText({
  #  paste("You have chosen a range the goes from ", mean(table2$Salary))
  #})
  
  #output$text3 <- renderText({
  #  paste("You have chosen a range the goes from ", input$Salary[1], "to",input$Salary[2])
  #})
})