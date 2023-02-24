
library(shiny)
library(purrr)
library(dplyr)
library(purrrlyr)
library(RSQLite)
library(DBI)
# # Create an ephemeral in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), "message")
df <- data.frame(rowid = numeric(),
                 user = character(),
                 text = character(),
                 time = double())
dbWriteTable(con, "me", df, overwrite = TRUE)




ui <- fluidPage(

  fluidRow(
    column(width = 6,
           chat_ui("test1"),
           hr(),
           chat_ui("test2")

    )
  )
)



server <- function(input, output, server) {

  chat_server("test1")
  chat_server("test2")

}




# Run the application
shinyApp(ui = ui, server = server)
