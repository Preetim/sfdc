class BasePage

  def initialize session
    @session = session
  end

  def visit_page url
    @session.visit url
    return self
  end

  def logout
    @session.find("#userNav-arrow").click
    @session.click_link("Logout")
  end
end