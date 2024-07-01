import consumer from "channels/consumer"

consumer.subscriptions.create("InventoryChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    fetch("/inventories", {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
      },
      body: JSON.stringify({ inventory: data })
    })
    .then(response => response.json())
    .then(responseData => {
      console.log("Success:", responseData);
    })
    .catch(error => {
      console.error("Error:", error);
    });
    
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
