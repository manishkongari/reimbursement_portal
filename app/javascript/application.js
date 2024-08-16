// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

// app/javascript/controllers/application.js
import { Turbo } from "@hotwired/turbo-rails"
Turbo.start()
