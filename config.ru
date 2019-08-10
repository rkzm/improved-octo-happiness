require_relative 'application'
require_relative 'database'
# This file should only contain
# initialization
# routing
# and setup code

# run method provided by Rake.
# We pass Application instance to it
# how to run
# bundle exec rakeup
# WEBrick ruby webserver boots up and loads code
run Application.new
