
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


render_msg_divs <- function(texts, users) {
  purrr::map2(texts, users, ~ div(class="chatMessage",
                                  p(tags$strong(.y),
                                  .x))
  )
}

ui <- fluidPage(
  includeCSS(system.file("assets/shinyChatR.css", package = "shinyChatR")),
  fluidRow(
    column(width = 6,
           div(class = "chatContainer",
               div(class = "chatMessages", style = paste0("height:", "300px;"),
                   # Display messages here
                   uiOutput("chatbox")
               ),
               tags$form(class = "chatForm",
                         tags$input(type = "text", id = "chatInput",
                                    placeholder = "Enter message"),
                         actionButton("chatFromSend", "Send",
                                      style = "background-color: #007bc2;
                                               color: #fff;")

               )
           )
    )
  )
)



server <- function(input, output, server) {
  # Add code for sending and receiving messages here
  global_rv <- reactiveValues(chat = dbGetQuery(con, 'SELECT * FROM me'))

  output$chatbox <- renderUI({
    if (!is_empty(global_rv$chat)) {
      render_msg_divs(global_rv$chat$text, global_rv$chat$user)
    } else {
      tags$span("Empty chat")
    }
  })

  observeEvent(input$chatFromSend, {
    dbExecute(con, 'INSERT INTO me (user, text, time)
                    VALUES (?, ?, ?);', list("User1",
                                             input$chatInput,
                                             Sys.time()))
    global_rv$chat <- dbGetQuery(con, 'SELECT * FROM me')
  })

}




# Run the application
shinyApp(ui = ui, server = server)
