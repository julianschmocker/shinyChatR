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

render_msg_divs2 <- function(texts, users, act_user, time, pretty=TRUE) {

  ## detect change of day
  xtime <- as.POSIXct(time, origin="1970-01-01")
  dx  <- diff(as.integer(factor(weekdays(xtime))))
  first_otd <- c(TRUE,dx!=0)  ## first of the day message
  dd <- as.integer(format(xtime, format="%d"))
  if(pretty) {
    date <- paste(weekdays(xtime), dd, months(xtime))
  } else {
    date <- strftime(time)
  }
  now <- strftime(Sys.time())
  today <- substring(now, 1,10)
  is.today <- (substring(xtime,1,10) == today)
  if(any(is.today)) date[which(is.today)] <- "Today"
  dt <- data.frame(user=users, text=texts, date=date, first=first_otd)

  formatChat <- function(a) {
    div(
      class="row",      
      div(
        class = paste(
          'col-12 chatTime',
          ifelse( a['first'], 'first','not-first')
        ),
        a['date'] 
      ),
      div(
        class = paste(
          "col-12 chatMessage",
          ifelse(a['user'] == act_user,"me", "")
        ),
        span(a['user'], class='chatUser'),
        span(a['text'], class='chatText')
      )
    )
  }  

  chats <- apply(dt, 1, c, simplify=FALSE)
  tags <- lapply(chats, function(a) formatChat(a))
  div( class="container chatInnerContainer", tags)
}
