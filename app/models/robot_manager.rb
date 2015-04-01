require 'yaml/store'
require 'models/robot'

class RobotManager

  def self.database
    @database ||= YAML::Store.new("db/robot_manager")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'], 
                              "name" => robot[:name],
                              "city" => Faker::Address.city, 
                              "state" => Faker::Address.state,
                              "avatar" => Faker::Avatar.image,
                              "birthday" => Faker::Date.backward(700),
                              "date_hired" => Faker::Date.backward(365),
                              "department" => Faker::Commerce.department
                            }
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  def self.update(id, robot)
    database.transaction do |db|
      target = db['robots'].find { |data| data["id"] == id }
      target["name"] = robot[:name]
      target["city"] = robot[:city]
      target["state"] = robot[:state]
      target["avatar"] = robot[:avatar]
      target["birthday"] = robot[:birthday]
      target["date_hired"] = robot[:date_hired]
      target["department"] = robot[:department]
    end
  end

  def self.delete(id)
    database.transaction do |db|
      db['robots'].delete_if { |robot| robot["id"] == id }
    end
  end
end