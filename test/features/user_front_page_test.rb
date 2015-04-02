require_relative "../test_helper"

class FrontPageTest < FeatureTest
  def test_guest_sees_welcome_message
    #When a guest goes to the root
    visit '/'
    #Then expect to see greeting
    within("#greeting") do
      assert page.has_content?("Welcome to Robot World Inc.")
    end
  end
end