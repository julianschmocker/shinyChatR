
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
saveRDS(df, "message.rds")



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

  chat_server("test1", db_connection = con, db_table_name = "me")
  chat_server("test2", rds_path = "message.rds" )

}




# Run the application
shinyApp(ui = ui, server = server)
