
library(shinyChatR)

# store db as tempfile. Select different path to store db locally
tempdb <- file.path(tempdir(), "db")

con <- dbConnect(RSQLite::SQLite(), tempdb)

# initiate chat table
df <- data.frame(rowid = numeric(),
                 user = character(),
                 text = character(),
                 time = double())
dbWriteTable(con, "chat_data", df, overwrite = TRUE)

ui <- fluidPage(

  fluidRow(
    column(width = 6,
           # add chat ui elements
           chat_ui("test1"),
    )
  )
)



server <- function(input, output, server) {

  # corresponding server part for id test1
  chat_server("test1", db_connection = con,
              db_table_name = "chat_data",
              chat_user = "user1"
              )
}


# Run the application
shinyApp(ui = ui, server = server)
