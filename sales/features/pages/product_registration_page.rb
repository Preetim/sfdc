class ProductRegistrationPage < BasePage

  def initialize session
    super session
    @session = session
  end

  def register

    @session.fill_in("edit-first-name", :with => "studios")
    @session.fill_in("edit-last-name", :with => "test")
    @session.fill_in("edit-company", :with => "company")
    @session.fill_in("edit-email-address", :with => "studios.test@gmail.com" )
    @session.fill_in("edit-phone-number", :with => "90909090" )
    @session.select("Other", :from => "edit-role")
    @session.select("Germany", :from => "edit-country")
    sleep 10
    @session.click_button("Submit")
  end
end