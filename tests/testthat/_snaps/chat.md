# Chat UI is correct

    Code
      chat_ui("test")
    Output
      <div>
        <style type="text/css">/* Chat Container */
      .chatContainer {
        margin: 0 auto;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 2px 2px 10px #ccc;
      }
      
      /* Chat Messages */
      .chatMessages {
        overflow-y: scroll;
        display: flex;
        flex-direction: column-reverse;
        padding: 10px;
        background-color: #f2f2f2;
        border-radius: 5px;
        margin-bottom: 10px;
      }
      
      /* Chat Message */
      .chatMessage {
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 5px;
        background-color: #fff;
        box-shadow: 1px 1px 5px #ccc;
      }
      
      /* Chat Form */
      .chatForm {
        display: flex;
        margin-top: 10px;
      }
      
      /* Chat Input */
      .chatForm input {
        flex-grow: 1;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-right: 10px;
      }
      
      /* Chat Button */
      .chatForm button {
        padding: 10px 20px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
      }</style>
        <div class="chatContainer">
          <div class="chatMessages" width="500px" style="height:300px">
            <div id="test-chatbox" class="shiny-html-output"></div>
          </div>
          <form class="chatForm">
            <input type="text" id="test-chatInput" placeholder="Enter message"/>
            <button id="test-chatFromSend" type="button" class="btn btn-default action-button" style="background-color: #007bc2;&#10;                                        color: #fff;">Send</button>
          </form>
        </div>
      </div>

