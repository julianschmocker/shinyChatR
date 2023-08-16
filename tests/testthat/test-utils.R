test_that('render_msg_divs works', {
  expect_snapshot(render_msg_divs(c("hello", "hello"), c("user1", "user2"), "user4"))
})


test_that('render_msg_divs2 works', {
  expect_snapshot(render_msg_divs2(texts = c("hello", "hello"),
                                   users = c("user1", "user2"),
                                   act_user = "user4",
                                   time = as.POSIXct(0, origin = "1960-01-01")))
})
