require 'capybara/cucumber'
require 'capybara/session'
require 'yaml'
require 'pry'
require 'capybara-screenshot/cucumber'
require 'capybara-screenshot'

Capybara.default_driver = :selenium

CONFIG = YAML.load_file("config/config.yml")[ENV['NAME'].to_sym]
DATABASE = YAML.load_file("config/database.yml")[ENV['NAME'].to_sym]

Capybara.save_and_open_page_path = "features/reports/screenshots/"


