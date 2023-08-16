# render_msg_divs works

    Code
      render_msg_divs(c("hello", "hello"), c("user1", "user2"), "user4")
    Output
      [[1]]
      <div class="chatMessage">
        <p>
          <strong>user1</strong>
          hello
        </p>
      </div>
      
      [[2]]
      <div class="chatMessage">
        <p>
          <strong>user2</strong>
          hello
        </p>
      </div>
      

# render_msg_divs2 works

    Code
      render_msg_divs2(texts = c("hello", "hello"), users = c("user1", "user2"),
      act_user = "user4", time = as.POSIXct(0, origin = "1960-01-01"))
    Output
      <div class="container chatInnerContainer">
        <div class="row">
          <div class="col-12 chatTime first">Friday 1 January</div>
          <div class="col-12 chatMessage ">
            <span class="chatUser">user1</span>
            <span class="chatText">hello</span>
          </div>
        </div>
        <div class="row">
          <div class="col-12 chatTime first">Friday 1 January</div>
          <div class="col-12 chatMessage ">
            <span class="chatUser">user2</span>
            <span class="chatText">hello</span>
          </div>
        </div>
      </div>

