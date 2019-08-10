class Application
  # web server invokes this method
  def call(env)
    # status code
    # hash with response to browser
    # content or body (multiple arrays)
    if env['PATH_INFO'] == '/users'
      [200, {}, [Database.users.to_s]]
    elsif env['PATH_INFO'] =~ %r{/users/\d+}
      id = env['PATH_INFO'].split('/').last.to_i
      [200, {}, [Database.users[id].to_s]]
    else
      [404, {}, ['Nothing here']]
    end
  end
end
