# frozen_string_literal: true

require 'json'
# web server invokes the call method
class UsersApplication
  def call(env)
    response = Rack::Response.new
    response.headers['Content-Type'] = 'application/json'
    # status code
    # hash with response to browser
    # content or body (multiple arrays)
    if env['PATH_INFO'] == ''
      response.write(JSON.generate(Database.users.to_s))
    elsif env['PATH_INFO'] =~ %r{/\d+}
      id = env['PATH_INFO'].split('/').last.to_i
      response.write(JSON.generate(Database.users[id].to_s))
    else
      response.status = 404
      response.write('Nothing Here!')
    end
    response.finish
  end
end
