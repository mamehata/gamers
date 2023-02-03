import consumer from "./consumer"

const appChat = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    return alert(data['chat']);
  },

  speak: function(chat) {
    return this.perform('speak', {chat: chat});
  }
});

document.addEventListener("turbolinks:load", function() {
  const chatSubmit = document.getElementById("chat-submit");
  chatSubmit.addEventListener("click", function(event) {
    const textArea = document.getElementById("text-area")
    appChat.speak(textArea.value)
    textArea.value = '';
    event.preventDefault();
  });
})