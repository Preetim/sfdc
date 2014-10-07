class SfdcPage < BasePage

    def initialize session
      super session
      @session = session
    end


    def login sfdc
      @session.fill_in("username", :with => sfdc[0])
      @session.fill_in("password", :with => sfdc[1])
      @session.click_button("Log in to Salesforce")
    end
end
