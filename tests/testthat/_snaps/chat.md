# Chat UI is correct

    Code
      chat_ui("test")
    Output
      <div width="100%">
        <style type="text/css">/* Chat Container */
      .chatContainer {
        margin: 0 auto;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 2px 2px 10px #ccc;
      }
      
      .chatInnerContainer {
        width: 100%;
        margin: auto;
        padding: 0px 15px 0 10px;
      }
      
      /* Chat Messages */
      .chatMessages {
        flex-grow: 1;
        overflow-y: auto;
        display: flex;
        flex-direction: column-reverse;
        padding: 5px 5px;
        border-radius: 5px;
        margin-bottom: 5px;
      }
      
      
      /* Chat Message */
      .chatMessage {
        float: left;
        width: auto;
        margin-bottom: 5px;
        padding: 2px 10px 2px 5px;
        border-radius: 5px;
        background-color: #eee;
        clear: both;
        box-shadow: 1px 1px 5px #ccc;
      }
      
       .chatMessage.me {
        float: right;
        margin-left: auto;
        background-color: #2196f3;
        color: #fff;
      }
      
      /* Chat Form */
      .chatForm {
        display: flex;
        margin-top: 10px;
      }
      
      /* Chat Input */
      .chatForm input {
        flex-grow: 1;
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-right: 5px;
      }
      
      /* Chat Button */
      .chatForm button {
        background-color: #007bff;
        padding: 10px 10px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
      }
      
      .chatUser {
          font-weight: 600;
          padding: 0 8px 0 5px;
      }
      
      .chatUser {
          font-weight: 600;
          padding: 0 8px 0 5px;
      }
      
      .chatTime.first {
          text-align: center;
          background-color: aliceblue;
          margin: 20px 0px;
          padding: 4px;
      }
      
      .chatTime.not-first {
          display: none;
      }</style>
        <div class="chatContainer">
          <div class="chatTitle"></div>
          <div class="chatMessages" style="height:300px">
            <div id="test-chatbox" class="shiny-html-output"></div>
          </div>
          <form class="chatForm">
            <input type="text" id="test-chatInput" placeholder="Enter message"/>
            <button class="btn btn-default action-button" id="test-chatFromSend" style="width:70px; background-color: #007bc2;&#10;                                        color: #fff; height:32px;padding:0px;" type="button">
              <i class="far fa-paper-plane" role="presentation" aria-label="paper-plane icon"></i>
            </button>
          </form>
        </div>
      </div>

