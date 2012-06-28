Then 'I debug' do
  binding.pry
  $cucumber_debugged = true
end

Then /^(?:I )print the page$/ do
  puts page.body
end

When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

at_exit do
  if $cucumber_debugged
    $stderr.puts "*" * 79
    $stderr.puts "Warning: debugging step was used!"
    $stderr.puts "*" * 79
  end
end
