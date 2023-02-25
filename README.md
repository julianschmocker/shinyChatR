# R Shiny Chat Module shinyChatR
This package provides a reusable chat module for R Shiny apps. The module allows multiple users to connect to a common chat and send messages to each other in real-time.

The messages can either be stored in a database or a rds data. 

## Features

* Real-time chat: messages are sent and received in real-time, without the need to refresh the page.
* Multiple users: multiple users can connect to the chat room and send messages to each other.
* Persistent messages: chat messages are stored in a database or rds file, allowing them to be retrieved and viewed even after a user logs out or the app is closed.

## General Usage

To use the chat module in your own Shiny app, follow these steps:

1. Install the package 
2. Load the package `library("shinyChatR")`
3. Initialize the database table or rds file 
4. Add chat module to the app

The details of the different steps can be found below:

## Database connection for storing chat data

If you are using a database connection to store the chat messages, you will need to initialize the database table before using the chat module. The following example shows an example how to do this using the `DBI` and `RSQLite` packages. Replace `db_file` with the path to your database file. The data will be saved in the table `chat_data`. 

```{r}
library(DBI)
library(RSQLite)

db_file <- "path_to_your_database_file"
conn <- dbConnect(RSQLite::SQLite(), db_file)

# initiate chat table
df <- data.frame(rowid = numeric(),
                 user = character(),
                 text = character(),
                 time = double())
dbWriteTable(conn, "chat_data", "chat_data")
```

Now you can add the chat module to your app:

```{r}
library(shinyChatR)
ui <- fluidPage(
  chat_ui("test")
)

server <- function(input, output, server) {
  chat_server("test", db_connection = conn,
              db_table_name = "chat_data",
              chat_user = "user1")
}

# Run the application
shinyApp(ui = ui, server = server)
```

## RDS file for storing chat data

A similar approach is required for rds data.

```{r}
df <- data.frame(rowid = numeric(),
                 user = character(),
                 text = character(),
                 time = double())

# 
test_rds <- "path_to_rds_file.rds"
saveRDS(df, test_rds)
```

Now you can add the chat module to your app:

```{r}
library(shinyChatR)
test_rds <- "path_to_rds_file.rds"

ui <- fluidPage(
  chat_ui("test2")
)

server <- function(input, output, server) {
  chat_server("test2", 
              rds_path = test_rds,
              chat_user = "user2")
}

# Run the application
shinyApp(ui = ui, server = server)
```

## Installation

Install from CRAN with

```r 
install.packages("shinyChatR")
```

You can install the development version of shinyChatR from
[GitHub](https://github.com/julianschmocker/shinyChatR) with:

``` r
remotes::install_github("julianschmocker/shinyChatR")
```
