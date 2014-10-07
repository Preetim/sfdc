class NewOpportunityPage < BasePage

  def initialize session
    super session
    @session = session
  end

  def delete_opportunity
    @session.find(:css, "td#topButtonRow input[name='del']").click
    @session.driver.browser.switch_to().alert.accept()
  end
end