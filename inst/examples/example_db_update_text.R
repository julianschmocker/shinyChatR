
library(shinyChatR)

# store db as tempfile. Select different path to store db locally
tempdb <- file.path(tempdir(), "db")

con <- dbConnect(RSQLite::SQLite(), tempdb)


ui <- fluidPage(

  fluidRow(
    column(width = 6,
           # add chat ui elements
           chat_ui("test1"),
    )
  ),
  br(),
  fluidRow(
    column(width = 6,
           # add button to update text value
           actionButton("set_value_abc", "Set text to 'abc'"),
    )
  ),

)


server <- function(input, output, server) {

  # corresponding server part for id test1
  chat_server("test1", db_connection = con,
              db_table_name = "chat_data",
              chat_user = "user1"
              )

  observeEvent(input$set_value_abc,{
    updateChatTextInput(id = "test1",
                        value = "abc")
  })
}


# Run the application
shinyApp(ui = ui, server = server)
