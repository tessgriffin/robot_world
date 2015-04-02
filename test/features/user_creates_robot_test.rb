require_relative "../test_helper"

class CreateRobotTest < FeatureTest
  def test_user_creates_robot_with_a_name
    #as a guest
    #when I visit the root path
    visit "/"
    #and I click on new robot
    click_link_or_button("New Drone")
    #And I fill in the name
    fill_in("robot[name]", with: "Jonny")
    #And I click on submit
    click_link_or_button("create robot")

    #Then I should be on the robot index
    assert_equal '/robots', current_path
    #And expect to see new robot
    assert page.has_content?("Jonny")
  end
end