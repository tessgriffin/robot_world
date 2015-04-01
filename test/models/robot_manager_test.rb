require_relative '../test_helper'

class RobotManagerTest < ModelTest
  def create_robots(num)
    num.times do |x|
      RobotManager.create({ name:       "Fred#{x}", 
                            city:       "a city#{x}",
                            state:      "a state#{x}",
                            avatar:     "an avatar#{x}",
                            birthday:   "a birthday#{x}",
                            date_hired: "a date hired#{x}",
                            department: "a department#{x}" })
    end
  end

  def test_can_create_a_robot_with_an_id
    #pass a title and description to robotmanager#create
    create_robots(1)
    #find the robot with an id of 1
    robot = RobotManager.find(1)
    #the only attribute we make on our own is name
    assert_equal 1, robot.id
    assert_equal "Fred0", robot.name
  end

  def test_it_can_find_a_robot
    create_robots(5)
    robot = RobotManager.find(3)

    assert_equal "Fred2", robot.name
  end
end