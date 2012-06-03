include Sorcery::TestHelpers::Rails

When /I log in/ do
  fill_in("username", :with => "levous")
  fill_in("password", :with => "secret")
  click_button "Log in"
end
