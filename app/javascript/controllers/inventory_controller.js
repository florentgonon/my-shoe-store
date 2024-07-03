import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.addEventListener("inventory-received", this.updateInventory.bind(this));
  }

  disconnect() {
    document.removeEventListener("inventory-received", this.updateInventory.bind(this));
  }

  updateInventory = async (event) => {
    try {
      const response = await fetch("/inventories", {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
        },
        body: JSON.stringify({ inventory: event.detail })
      });
      const updatedData = await response.json();
      this.updateInventoryList(updatedData);
    } catch (error) {
      console.error("Error:", error);
    }
  }

  updateInventoryList(data) {
    const list = document.getElementById(`inventory-list-${data.store.name.toLowerCase().replace(/ /g, "-")}`);
    let item = list.querySelector(`tr[data-id="${data.id}"]`);
  
    if (!item) {
      item = document.createElement("tr");
      item.setAttribute("data-id", data.id);
      list.appendChild(item);
    }
  
    this.updateItemContent(item, data);
    this.updateItemStyle(item, data.stock);
  }

  updateItemContent(item, data) {
    if (item.childElementCount != 0) {
      item.querySelector("td[id='stock']").textContent = data.stock;
    } else {
      item.innerHTML = `
        <td class="p-2 rounded-l-lg mb-1">${data.id}</td>
        <td class="p-2 mb-1">${data.shoe.name.charAt(0).toUpperCase() + data.shoe.name.slice(1).toLowerCase()}</td>
        <td id="stock" class="p-2 rounded-r-lg mb-1">${data.stock}</td>
      `;
    }
  }
  
  updateItemStyle(item, stock) {
    item.className = stock == 0 ? "bg-light-coral" : (stock <= 10 ? "bg-gamboge" : "bg-jade");
  }
}