# frozen_string_literal: true

require 'json'

# works with rides
class RidesApplication
  include ApplicationHelpers

  def call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers['Content-Type'] = 'application/json'
    ##
    # This works how we'd like it to because of Ruby's precedence rules.
    # True and an empty string will yield us the empty string which will then
    # be used in the case to compare against the path.
    case request.path_info
    when request.post? && ''
      post_a_ride(request, response)
    when request.get? && ''
      get_all_rides(request, response)
    when %r{/\d+}
      get_a_ride(request, response)
    else
      missing(response)
    end

    response.finish
  end

  def post_a_ride(request, response)
    ride = JSON.parse(request.body.read)
    if ride['user_id'].nil?
      error(response, 'user_id field is required')
    else
      Database.add_ride(ride)
      respond_with_object(response, message: 'Ride received')
    end
  rescue JSON::ParserError
    error(response, 'Invalid JSON')
  end

  def get_all_rides(_request, response)
    respond_with_object(response, Database.rides)
  end

  def get_a_ride(request, response)
    id = request.path_info.split('/').last.to_i
    ride = Database.rides[id]
    if ride.nil?
      error(response, "No ride with id #{id}", 404)
    else
      respond_with_object(response, ride)
    end
  end
end
