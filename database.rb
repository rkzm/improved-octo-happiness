# frozen_string_literal: true

# In memory hashes
class Database
  USERS = {
    1 => { name: 'Rex', bike: 'Giant' },
    2 => { name: 'Makena', bike: 'BMX' }
  }.freeze

  def self.users
    USERS
  end

  RIDES = {
    1 => { user_id: 1, title: 'Morning Commute', date: '2019-11-17' },
    2 => { user_id: 1, title: 'Cawabanga track', date: '2019-12-10' }
  }.freeze

  def self.add_ride(ride)
    id = RIDES.keys.max + 1
    RIDES[id] = ride
  end

  def self.rides
    RIDES
  end
end
