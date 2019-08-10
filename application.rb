
class Application
  # web server invokes this method
  def call(env)
    # status code
    # hash with response to browser
    # content or body (multiple arrays)
    [200, {}, ["Hello from Rake"]]
  end
end

# run method provided by Rake.
# We pass Application instance to it
# how to run
# bundle exec rakeup
   # WEBrick ruby webserver boots up and loads code
