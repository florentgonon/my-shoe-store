import consumer from "channels/consumer"

consumer.subscriptions.create("InventoryChannel", {
  connected() {
    console.log("Connected to the inventory channel")
  },

  disconnected() {
    console.log("Disconnected from the inventory channel")
  },

  received(data) {
    const event = new CustomEvent("inventory-received", { detail: data });
    document.dispatchEvent(event);
  }
});
