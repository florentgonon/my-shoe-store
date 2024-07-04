const updateInventory = async (event) => {
  try {
    const response = await fetch("/inventories", {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content")
      },
      body: JSON.stringify({ inventory: event })
    });
    const updatedData = await response.json();
    updateInventoryList(updatedData);
  } catch (error) {
    console.error("Error:", error);
  }
}

const updateInventoryList = (data) => {
  const list = document.getElementById(`inventory-list-${data.store.name.toLowerCase().replace(/ /g, "-")}`);
  let item = list.querySelector(`tr[data-id="${data.id}"]`);

  if (!item) {
    item = document.createElement("tr");
    item.setAttribute("data-id", data.id);
    list.appendChild(item);
  }

  item.dataset.target = "list-item";
  item.draggable = true;

  updateItemContent(item, data);
  updateItemStyle(item, data.stock);
}

const updateItemContent = (item, data) => {
  if (item.childElementCount != 0) {
    item.querySelector("td[id='stock']").textContent = data.stock;
  } else {
    item.innerHTML = `
      <td class="p-1 rounded-l-lg mb-1 text-sm">${data.id}</td>
      <td class="p-1 mb-1 text-sm">${data.shoe.name.charAt(0).toUpperCase() + data.shoe.name.slice(1).toLowerCase()}</td>
      <td id="stock" class="p-1 rounded-r-lg mb-1 text-sm">${data.stock}</td>
    `;
  }
}
  
const updateItemStyle = (item, stock) => {
  item.className = stock == 0 ? "bg-light-coral" : (stock <= 10 ? "bg-gamboge" : "bg-jade");
}

export { updateInventory };