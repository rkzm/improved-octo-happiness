# frozen_string_literal: true

# web server invokes the call method
class RidesApplication
  def call(env)
    # status code
    # hash with response to browser
    # content or body (multiple arrays)
    if env['PATH_INFO'] == ''
      [200, {}, [Database.rides.to_s]]
    elsif env['PATH_INFO'] =~ %r{/\d+}
      id = env['PATH_INFO'].split('/').last.to_i
      [200, {}, [Database.rides[id].to_s]]
    else
      [404, {}, ['Nothing here']]
    end
  end
end
