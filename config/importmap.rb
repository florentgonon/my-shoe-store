# Pin npm packages by running ./bin/importmap

# Entrypoints
pin "application"
pin "dashboard"

pin_all_from "app/javascript/controllers", under: "controllers"

# HOTWIRE
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

