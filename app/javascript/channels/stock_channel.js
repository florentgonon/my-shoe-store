import consumer from "channels/consumer"

consumer.subscriptions.create("StockChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const inventoryElement = document.getElementById("inventory");
    const newItem = document.createElement("div");
    newItem.innerHTML = `Store: ${data.store}, Model: ${data.model}, Inventory: ${data.inventory}`;
    inventoryElement.appendChild(newItem);
  }
});
