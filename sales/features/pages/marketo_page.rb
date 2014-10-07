class MarketoPage < BasePage

  def initialize session
    super session
    @session = session
  end


  def login marketo
    @session.fill_in("loginUsername", :with => marketo[0])
    @session.fill_in("loginPassword", :with => marketo[1])
    @session.click_button("Login")
  end

  def get_lead_details

  end
end