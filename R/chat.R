
#' @title Shiny module to add multi-user chat
#'
#' @description cc
#'
#' @param id Module ID
#'
#' @importFrom shiny uiOutput
#'
#' @export
#'
#'
#' @example xx
chat_ui <- function(id) {
  ns <- NS(id)

  div(
    includeCSS(system.file("assets/shinyChatR.css", package = "shinyChatR")),
    div(class = "chatContainer",
        div(class = "chatMessages", width = "500px",
            style = paste0("height:", "300px;"),
            # Display messages here
            uiOutput(ns("chatbox"))
        ),
        tags$form(class = "chatForm",
                  tags$input(type = "text",
                             id = ns("chatInput"),
                             placeholder = "Enter message"),
                  actionButton(inputId = ns("chatFromSend"),
                               label = "Send",
                               style = "background-color: #007bc2;
                                        color: #fff;")

        )
    )
  )
}


#' @title Shiny module to interactively edit a `data.frame`
#'
#' @param id Module ID
#' @param data_r data_r `reactive` function containing a `data.frame` to use in the module.
#'
#' @return the edited `data.frame` in reactable format with the user modifications
#'
#' @importFrom shiny moduleServer eventReactive reactiveValues is.reactive reactive renderUI actionButton observeEvent isTruthy showModal removeModal downloadButton downloadHandler
#'
#' @export
#'
chat_server <- function(id) {

  moduleServer(
    id,
    function(input, output, session) {

      ns <- session$ns

      # Add code for sending and receiving messages here
      global_rv <- reactiveValues(chat = dbGetQuery(con, 'SELECT * FROM me'))

      output$chatbox <- renderUI({
        if (!is_empty(global_rv$chat)) {
          render_msg_divs(global_rv$chat$text, global_rv$chat$user)
        } else {
          tags$span("Empty chat")
        }
      })

      observe({
        invalidateLater(1000)
        global_rv$chat <- dbGetQuery(con, 'SELECT * FROM me')
      })

      observeEvent(input$chatFromSend, {
        dbExecute(con, 'INSERT INTO me (user, text, time)
                    VALUES (?, ?, ?);', list("User1",
                                             input$chatInput,
                                             Sys.time()))
        global_rv$chat <- dbGetQuery(con, 'SELECT * FROM me')

      })
    })
}
