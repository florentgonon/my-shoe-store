import consumer from "channels/consumer"

consumer.subscriptions.create("InventoryChannel", {
  connected() {
    console.log("Connected to the inventory channel")
  },

  disconnected() {
    console.log("Disconnected from the inventory channel")
  },

  async received(data) {
    try {
      const response = await fetch("/inventories", {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content")
        },
        body: JSON.stringify({ inventory: data })
      });
      const updatedData = await response.json();
      const event = new CustomEvent("inventory-update", { detail: updatedData });
      document.dispatchEvent(event);
    } catch (error) {
      console.error("Error:", error);
    }
  }
});
