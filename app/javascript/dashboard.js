import "@hotwired/turbo-rails"
import "controllers"

import DashboardController from "controllers/dashboard_controller"

Stimulus.register("data", DashboardController)
