% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{render_msg_divs2}
\alias{render_msg_divs2}
\title{Render the messages for the chat}
\usage{
render_msg_divs2(texts, users, act_user, time, pretty = TRUE)
}
\arguments{
\item{texts}{a character vector with the texts}

\item{users}{a character vector with the users}

\item{act_user}{a character with the current user (that is using the app)}

\item{time}{a datetime object}

\item{pretty}{a logical that indicates if it should simplify the date}
}
\value{
The HTML code containing the chat messages
}
\description{
Render the messages for the chat
}
