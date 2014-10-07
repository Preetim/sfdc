class LoginPage < BasePage

  def initialize session
    super session
    @session = session
  end

  def login user
    @session.fill_in("username", :with => "#{user[0]}")
    @session.fill_in("password", :with => "#{user[1]}")
    @session.click_button("Login")
    return HomePage.new @session
  end
end