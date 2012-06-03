When /I log in/ do
  fill_in("username", :with => "levous")
  fill_in("password", :with => "secret")
  click_button "Log in"
end

When /^I sign up as "([^"]*)"$/ do |username|
  fill_in("Username", :with => username)
  fill_in("Email", :with => "#{username}@example.com")
  fill_in("Password", :with => "secret")
  fill_in("Password confirmation", :with => "secret")
  click_button "Create User"
end



