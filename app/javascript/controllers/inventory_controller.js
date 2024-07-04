import { Controller } from "@hotwired/stimulus"
import { updateInventory as updateInventoryFromUpdater } from '../components/inventory_updater'

export default class extends Controller {
  connect() {
    document.addEventListener("inventory-update", (event) => updateInventoryFromUpdater(event.detail));
  }

  disconnect() {
    document.removeEventListener("inventory-update", (event) => updateInventoryFromUpdater(event.detail));
  }
}