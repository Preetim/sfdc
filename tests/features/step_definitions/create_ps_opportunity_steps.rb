
CONFIG.
    each do |user_role, listed_user_name|
Given(/^I am logged in as a #{user_role}$/) do
  @login_page = LoginPage.new(Capybara.current_session)
  url = CONFIG["sfdc_site"]
  @login_page.visit_page url
  @home_page = @login_page.login listed_user_name
  end
end


When(/^I create a new opportunity of (.*)$/) do  |type|
  @opportunities_page = @home_page.go_to_opportunities
  @opportunities_page.click_create_new_opportunity type
  @opportunities_page.send("fill_#{type}_opp_details",$create_opp['opp_name'])
  (type=="ps") ? ( @opportunities_page.create_contact
  @opportunities_page.select_contact($create_opp[:contact]['new_contact_fname'])) :nil
  (type=="ps") ? (assert @opportunities_page.contact_exists?, "Contact doesn't exist on the opportunity page.") : nil
end

Then /^opportunity should get created$/ do
  opp_name = @opportunities_page.get_opp_name
  acc_name = @opportunities_page.get_account_name
  assert acc_name== $create_opp['account_name'], "#{acc_name} was different from the account name:#{$create_opp['account_name']}"
  assert opp_name == $create_opp['opp_name'], "#{opp_name} was different from the account name:#{$create_opp['opp_name']}"
end
