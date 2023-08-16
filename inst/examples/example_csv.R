
library(shinyChatR)

# temp csv
test_csv <- file.path(tempdir(), "test.csv")


ui <- fluidPage(

  fluidRow(
    column(width = 6,
           # add chat ui elements
           chat_ui("test4"),
    )
  )
)


server <- function(input, output, server) {

  # corresponding server part for id test1
  chat_server("test4", csv_path = test_csv,
              chat_user = "user1"
              )
}


# Run the application
shinyApp(ui = ui, server = server)
