#' CSVConnection R6 Class
#'
#' An R6 class representing a connection to a CSV file for the chat module.
#'
#'
#' @field  csv_path The path to the CSV file.
#' @field  nlast The number of messages to be read in and displayed.
#'
CSVConnection <- R6::R6Class("CSVConnection",
                  public = list(
                    csv_path = NULL,
                    nlast = NULL,
                    #' Initialize the R6 Object
                    #'
                    #' @param csv_path The path to the csv file.
                    #' @param nlast The number of messages to be read-in.
                    #' @importFrom data.table fwrite setnames fread
                    initialize = function(csv_path, nlast=NULL) {
                      self$csv_path <- csv_path
                      self$nlast <- nlast
                      if(!file.exists(csv_path)) {
                        df <- data.frame(
                          user = character(),
                          text = character(),
                          time = double()
                        )
                        data.table::fwrite(df, csv_path)
                      }
                    },
                    #' @description Reads the full dataset
                    #'
                    #' @returns The full dataset
                    #'
                    get_data = function() {
                      if(is.null(self$nlast)) {
                        data.table::fread(self$csv_path)
                      } else {
                        data.table::setnames(
                          data.table::fread(cmd = paste0("tail -",self$nlast,
                            " '",self$csv_path,"'")),
                          names(data.table::fread(self$csv_path,nrows = 0))
                        )[]
                      }
                    },
                    #' Save a message to data source
                    #'
                    #' @param message The message to be stores
                    #' @param user The user who entered the message
                    #' @param time The time when message was submitted
                    #'
                    insert_message = function(message, user, time) {
                      chat_data <- data.frame(
                        user = user,
                        text = message,
                        time = time)
                      data.table::fwrite(chat_data, file=self$csv_path,
                        quote=TRUE, append=TRUE)
                    }
                  )
)
