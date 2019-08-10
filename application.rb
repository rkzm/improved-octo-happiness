class Application
  # web server invokes this method
  def call(env)
    # status code
    # hash with response to browser
    # content or body (multiple arrays)
    if env['PATH_INFO'] == '/users'
      [200, {}, [Database.users.to_s]]
    end
  end
end
