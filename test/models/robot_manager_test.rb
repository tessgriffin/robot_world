require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
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

  def test_it_can_find_all_robots
    create_robots(5)
    robots = RobotManager.all

    assert_equal 5, robots.count
  end

  def test_it_can_update_a_robot
    create_robots(5)
    robot = RobotManager.find(4)

    RobotManager.update(4, {name: "boo"})
    robot_new = RobotManager.find(4)

    assert_equal "boo", robot_new.name
  end

  def test_it_can_delete_a_robot
    create_robots(10)
    assert_equal 10, RobotManager.all.count

    RobotManager.delete(3)
    robots = RobotManager.all

    assert_equal 9, robots.count
  end
end