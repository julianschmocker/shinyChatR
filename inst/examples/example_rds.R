
#library(shinyChatR)

# initiate chat data df.
df <- data.frame(rowid = numeric(),
                 user = character(),
                 text = character(),
                 time = double())

# save rds file in tempdir. Replace with path to save locally.
test_rds <- file.path(tempdir(), "data.rds")
saveRDS(df, test_rds)

ui <- fluidPage(

  fluidRow(
    column(width = 12,
           # add chat ui elements
           chat_ui("test2"),
    )
  )
)

server <- function(input, output, server) {

  # corresponding server part for id test2
  chat_server("test2",
              rds_path = test_rds,
              chat_user = "user2"
              )
}


# Run the application
shinyApp(ui = ui, server = server)
