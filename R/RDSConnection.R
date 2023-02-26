#' RDSConnection R6 Class
#'
#' An R6 class representing a connection to a rds file for the chat module.
#'
#' @field  rds_path The path to the rds file.
#'
RDSConnection <- R6::R6Class("RDSConnection",
                  public = list(
                    rds_path = NULL,
                    #' Initialize the R6 Object
                    #'
                    #' @param rds_path The path to the rds file.
                    #'
                    initialize = function(rds_path) {
                      self$rds_path <- rds_path
                    },
                    #' @description Reads the full dataset
                    #'
                    #' @returns The full dataset
                    #'
                    get_data = function() {
                      readRDS(file = self$rds_path)
                    },
                    #' Save a message to data source
                    #'
                    #' @param message The message to be stores
                    #' @param user The user who entered the message
                    #' @param time The time when message was submitted
                    #'
                    insert_message = function(message, user, time) {
                      prev_chat_data <- readRDS(file = self$rds_path)
                      chat_data <- rbind(prev_chat_data,
                                         data.frame(text = message,
                                                    user = user,
                                                    time = time))
                      saveRDS(chat_data, file = self$rds_path)
                    }
                  )
)
