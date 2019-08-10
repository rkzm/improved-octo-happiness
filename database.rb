# In memory hash
class Database
  USERS = {
    1 => { name: 'Rex', bike: 'Giant' },
    2 => { name: 'Makena', bike: 'BMX' }
  }

  def self.users
    USERS
  end
end
