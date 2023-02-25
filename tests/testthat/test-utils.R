test_that('render_msg_divs works', {
  expect_snapshot(render_msg_divs(c("hello", "hello"), c("user1", "user2"), "user4"))
})
