Given("I am on the {string} page") do |string|
  visit root_path
end

When("I click on {string} on {string}") do |time, date|
 case date
  when "tomorrow"
    date_slot = Date.today + 1.day
  end

  within("##{date_slot.to_formatted_s(:dc)}") do
    click_on time
  end
end

Given("we have {int} laundry") do |int|
  int.times do |room|
    create(:laundry)
  end
end

Given("I am logged in as {string}") do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

Given /^I log out$/ do
  logout
end

Given("we have (1 )user with email {string}") do |email|
  create(:user, email: email)
end

Then("(s/S)how me the page") do
  save_and_open_page
end

Given("I click {string}") do |element|
  click_on element
end