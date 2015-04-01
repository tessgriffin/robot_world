require_relative '../test_helper'

class RobotTest < ModelTest
  def test_assigns_attributes_correctly
    robot = Robot.new({ "id"         => 1,
                        "name"       => "a name", 
                        "city"       => "a city",
                        "state"      => "a state",
                        "avatar"     => "an avatar",
                        "birthday"   => "a birthday",
                        "date_hired" => "a date hired",
                        "department" => "a department", })

    assert_equal 1, robot.id
    assert_equal "a name", robot.name
    assert_equal "a city", robot.city
    assert_equal "a state", robot.state
    assert_equal "an avatar", robot.avatar
    assert_equal "a birthday", robot.birthday
    assert_equal "a date hired", robot.date_hired
    assert_equal "a department", robot.department
  end
end