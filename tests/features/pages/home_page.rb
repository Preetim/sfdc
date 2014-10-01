class HomePage < BasePage

  def initialize session
    super session
    @session = session
  end

  def go_to_opportunities
    @session.click_link("Opportunities")
    return OpportunitiesPage.new(@session)
  end
end