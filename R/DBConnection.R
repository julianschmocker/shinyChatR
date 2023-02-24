#' DBConnection R6 Class
#'
#' An R6 class representing a connection to a database for the chat module.
#'
#' @field connection A database connection object, created using a package such as RSQLite.
#' @field table The table that contains the chat information.
#'
#'
DBConnection <- R6::R6Class("DBConnection",
                  public = list(
                    connection = NULL,
                    table = NULL,
                    #' Initialize the R6 Object
                    #'
                    #' @param connection DB connection
                    #' @param table Table name
                    #'
                    initialize = function(connection, table) {
                      self$connection <- connection
                      self$table <- table
                    },
                    #' @description Reads the full dataset
                    #'
                    #' @returns The full dataset
                    #'
                    get_data = function() {
                      DBI::dbGetQuery(self$connection, paste('SELECT * FROM', self$table))
                    },
                    #' Save a message to data source
                    #'
                    #' @param message The message to be stores
                    #' @param user The user who entered the message
                    #' @param time The time when message was submitted
                    #'
                    insert_message = function(message, user, time) {
                      DBI::dbExecute(self$connection, paste('INSERT INTO', self$table, '(user, text, time)
                                            VALUES (?, ?, ?);'),
                                list(user, message, time))
                    }
                  )
)
