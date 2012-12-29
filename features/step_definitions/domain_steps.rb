Given /^the user (.*) exists$/ do |name|
  # ...
end

Given /^I log in as (.*)$/ do |name|
  # ...
end

Given /^(.*) is logged in$/ do |name|
  step "the user #{name} exists"
  step "I log in as #{name}"
end

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

When /^I sign up as (.*) with a goal having a milestone$/ do |username|
  visit '/signup'
  step "I sign up as \"#{username}\""
  user = User.where(:username => username).first
  goal = Goal.new( :title => 'Shatever')
  goal.set_goal_user(user)
  user.save
  user.person.save
  milestone = Milestone.new( :title => 'Some milestone that is done', :goal => goal )
  milestone.save
  goal.save 
  goal.plan.save
  goal.plan.student.save
  debugger
  goal
end

Given /^I am not authenticated$/ do
  visit('/logout') # ensure that at least
end

When 'I wait for the page to load' do
  wait_until { page.evaluate_script('$.active') == 0 } if Capybara.current_driver == :selenium
  page.has_content? ''
end

When 'debug' do
  debugger
end
