import consumer from "./consumer"

const appChat = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function(group_chats, group_id) {
    $("#group-comment-index-group_id").html("<%= j(render 'public/groups/comment', comments: group_chats) %>");
  },

  speak: function(chat, group_id, current_member) {
    return this.perform('speak', {chat: chat, group_id: group_id, current_member: current_member});
  }
});

document.addEventListener("turbolinks:load", function() {
  const chatSubmit = document.getElementById("chat-submit");
  chatSubmit.addEventListener("click", function(event) {
    const textArea = document.getElementById("text-area")
    const groupId = document.getElementById("group-data")
    appChat.speak(textArea.value, groupId.dataset.groupId, groupId.dataset.currentMember)
    textArea.value = '';
    event.preventDefault();
  });
})