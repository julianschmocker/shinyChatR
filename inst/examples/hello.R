
devtools::load_all()
# # Create an ephemeral in-memory RSQLite database
tempdb <- tempfile()
con <- dbConnect(RSQLite::SQLite(), tempdb)
df <- data.frame(rowid = numeric(),
                 user = character(),
                 text = character(),
                 time = double())
dbWriteTable(con, "me", df, overwrite = TRUE)
test_rds <- tempfile(fileext = "rds")
saveRDS(df, test_rds)



ui <- fluidPage(

  fluidRow(
    column(width = 6,
           textInput("user", "User"),
           chat_ui("test1"),
           hr(),
           chat_ui("test2")

    )
  )
)



server <- function(input, output, server) {

  user_rv <- reactive(input$user)

  chat_server("test1", db_connection = con,
              db_table_name = "me",
              chat_user = user_rv)


  chat_server("test2", rds_path = test_rds, chat_user = "user2" )

}




# Run the application
shinyApp(ui = ui, server = server)
