require_relative "../test_helper"

class EditRobotTest < FeatureTest
  def test_user_can_edit_robot
    #create robot
    RobotManager.create({name: "Mary"})

    #as a guest
    #and I visit the index page
    visit "/robots"
    #and I click on the edit button
    click_link_or_button("edit")
    #and I fill in the name with a new value
    fill_in("robot[name]", with: "Joseph")
    #and I click submit
    click_link_or_button("edit robot")
    
    #Then I expect to be on the show page
    assert_equal "/robots/1", current_path
    #And that the new name is there
    assert page.has_content?("Joseph")
  end
end