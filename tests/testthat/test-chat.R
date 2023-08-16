
test_that("Chat UI is correct", {
  expect_snapshot(chat_ui("test"))
})

test_that("Chat Server with DB works", {
  # Create a temporary database for testing
  test_db <- tempfile()
  con <- DBI::dbConnect(RSQLite::SQLite(), dbname = test_db)
  df <- data.frame(rowid = numeric(),
                   user = character(),
                   text = character(),
                   time = double())
  DBI::dbWriteTable(con, "chat_messages", df, overwrite = TRUE)

  testServer(chat_server, args = list(db_connection = con,
                                      db_table_name = "chat_messages",
                                      chat_user = "user1"), {
    session$setInputs(chatInput = "test_message", chatFromSend = 10)
    expect_equal(DBI::dbGetQuery(con, 'SELECT user,text FROM chat_messages'),
                 data.frame(user = "user1",
                            text = "test_message"))
  })
  DBI::dbDisconnect(con)
})

test_that("Chat Server with rds file", {
  test_rds <- tempfile(fileext = "rds")
  df <- data.frame(rowid = numeric(),
                   user = character(),
                   text = character(),
                   time = double())
  saveRDS(df, test_rds)

  testServer(chat_server, args = list(rds_path = test_rds,
                                      chat_user = "user2"), {
    session$setInputs(chatInput = "test_message2", chatFromSend = 20)
    expect_equal(readRDS(test_rds)[, c("user", "text")],
                 data.frame(user = "user2",
                            text = "test_message2"))
  })

})


test_that("Chat Server with csv file", {
  test_csv <- tempfile(fileext = "csv")

  testServer(chat_server, args = list(csv_path = test_csv,
                                      chat_user = "user2"), {
                                        session$setInputs(chatInput = "test_message2", chatFromSend = 20)
                                        expect_equal(read.csv(test_csv)[, c("user", "text")],
                                                     data.frame(user = "user2",
                                                                text = "test_message2"))
                                      })

})
