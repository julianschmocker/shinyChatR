#' Render the messages for the chat
#'
#' @param texts a character vector with the texts
#' @param users a character vector with the users
#'
#' @return The HTML code containing the chat messages
#'
#' @importFrom purrr map2
#'
#' @examples
#'
#' render_msg_divs(c("hello", "hello"), c("user1", "user2"))
#'
#'
render_msg_divs <- function(texts, users) {
  purrr::map2(texts, users,
              ~ div(class="chatMessage", p(tags$strong(.y), .x))
          )
}
