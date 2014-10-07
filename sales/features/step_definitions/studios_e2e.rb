
Given(/^user downloads (.*) from thoughtworks.com$/) do |product|
  @registration = ProductRegistrationPage.new(Capybara.current_session)
  @registration.visit_page($studios_e2e["register_#{product}"])
  @registration.register
end


When(/^I view (\w+)$/) do |portal|
  if portal == "marketo"
    @sf_portal = MarketoPage.new(Capybara.current_session)
  else if portal == "sfdc"
    @sf_portal = SfdcPage.new(Capybara.current_session)
  end
    @sf_portal.visit_page(CONFIG["#{portal}_site"])
    @sf_portal.login(CONFIG["#{portal}"])
  end
end


Then(/^I should see the correct lead values captured in (\w+)/) do   |portal|
  @sf_portal.get_lead_details
end