# frozen_string_literal: true

# This file should only contain
# initialization
# routing
# and setup code

require_relative 'users_application'
require_relative 'database'
require_relative 'rides_application'

map('/users') do
  # run method provided by Rake.
  # We pass Application instance to it
  # how to run
  # bundle exec rakeup
  # WEBrick ruby webserver boots up and loads code
  run UsersApplication.new
end

map('/rides') do
  run RidesApplication.new
end
