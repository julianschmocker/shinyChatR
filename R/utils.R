#' Render the messages for the chat
#'
#' @param texts a character vector with the texts
#' @param users a character vector with the users
#' @param act_user a character with the current user (that is using the app)
#'
#' @return The HTML code containing the chat messages
#'
#' @importFrom purrr map2
#'
render_msg_divs <- function(texts, users, act_user) {
  purrr::map2(texts, users,
              ~ div(class=paste0("chatMessage", ifelse(.y == act_user, " me", "")),
                                p(tags$strong(.y), .x))
          )
}
