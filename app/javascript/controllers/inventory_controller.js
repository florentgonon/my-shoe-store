import { Controller } from "@hotwired/stimulus"
import { updateInventoryList as updateInventoryListFromUpdater } from '../components/inventory_updater'

export default class extends Controller {
  connect() {
    document.addEventListener("inventory-update", (event) => updateInventoryListFromUpdater(event.detail));
  }

  disconnect() {
    document.removeEventListener("inventory-update", (event) => updateInventoryListFromUpdater(event.detail));
  }
}