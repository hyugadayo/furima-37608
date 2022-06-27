import consumer from "./consumer"

if(location.pathname.match(/\/items\/\d/)){
    consumer.subscriptions.create({
      channel: "CommentChannel",
      item_id: location.pathname.match(/\d+/)[0]
    }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <div id="comment">
          <p class="user-info">${data.user.nickname}： </p>
          <p>${data.comment.text}</p>
        </div>`
      const commentArea = document.getElementById("comment-area")
      commentArea.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
      const commentButton = document.getElementById("comment-button")
      commentButton.disabled=false;
    }
  })
}