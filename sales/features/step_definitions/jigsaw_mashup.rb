
Given(/^I raise request for resources from SalesForce$/) do
  @sf_portal = SfdcPage.new(Capybara.current_session)
  @sf_portal.visit_page(CONFIG["sfdc_site"])
  @sf_portal.login(CONFIG["Sfdc"])

end

When(/^I  assign the resources from Jigsaw$/) do
  url = CONFIG["jigsaw_site"]
  @jigsaw_portal = JigsawPage.new(Capybara.current_session)
  @jigsaw_portal.visit_page url
end