require_relative "../test_helper"

class DeleteRobotTest < FeatureTest
  def test_user_delete_robot
    #create robot
    RobotManager.create({name: "Mary"})

    #as a guest
    #and I visit the index page
    visit "/robots"
    assert page.has_content?("Mary")
    #and I click on the delete button
    click_link_or_button("terminate")
    
    #Then I expect to be on the index page
    assert_equal "/robots", current_path
    #And that the robot is gone
    refute page.has_content?("Mary")
  end
end