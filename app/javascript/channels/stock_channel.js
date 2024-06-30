import consumer from "channels/consumer"

consumer.subscriptions.create("StockChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const list = document.getElementById("list");
    const newItem = document.createElement("tr");
    newItem.innerHTML = `
      <td>${data.store}</td>
      <td>${data.model}</td>
      <td>${data.inventory}</td>
    `;
    list.appendChild(newItem);
  }
});
