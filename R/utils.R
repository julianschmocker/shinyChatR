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
#' \dontrun{render_msg_divs(c("hello", "hello"), c("user1", "user2"))}
#'
render_msg_divs <- function(texts, users, act_user) {
  purrr::map2(texts, users,
              ~ div(class=paste("chatMessage", ifelse(.y == act_user, "me", "")),
                                p(tags$strong(.y), .x))
          )
}
