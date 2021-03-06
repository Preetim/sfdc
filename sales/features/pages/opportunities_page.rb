require 'date'
class OpportunitiesPage < BasePage


  def initialize session
    super session
    @session = session
  end

  def click_create_new_opportunity type
    @session.click_button("New")
    (type == "studios" && @session.has_select?("p3")) ? (@session.select("Studios Opportunity", :from => "p3")) :nil
    if @session.has_button?("Continue")
        @session.click_button("Continue")
    end
  end

  def fill_ps_opp_details  opp_name
    opportunity_name = "j_id0:j_id1:j_id2:j_id29:j_id33"
    supervising_region = "j_id0:j_id1:j_id2:j_id29:j_id37"
    start_date_id = "j_id0:j_id1:j_id2:j_id29:j_id32"
    amount = "j_id0:j_id1:j_id2:j_id29:j_id38"
    stage = "j_id0:j_id1:j_id2:j_id29:j_id39"
    end_date = "j_id0:j_id1:j_id2:j_id29:j_id34"
    account_name = "j_id0:j_id1:j_id2:j_id29:j_id31"
    probability = "j_id0:j_id1:j_id2:j_id29:j_id40"

    @session.fill_in(opportunity_name, :with => opp_name)
    start_date = Time.now.strftime("%m/%d/%Y")
    @session.fill_in(start_date_id, :with => start_date)
    @session.fill_in(amount, :with => '2000')
    @session.select("Qualification", :from => stage)
    @session.select("Brazil", :from => supervising_region)
    @session.fill_in(probability, :with => 20)
    end_date_value = (Date.today>>12).strftime("%m/%d/%Y")
    @session.fill_in(end_date, :with => end_date_value)
    @session.fill_in(account_name, :with => $create_opp['account_name'])
    @session.click_button("Save")
  end

  def fill_studios_opp_details opp_name
    opportunity_name = "opp3"
    tw_client="00N50000001oXgI"
    opp_region = "00N500000023s8Q"
    opp_country="00N500000022lDA"
    new_account = "00N500000021w7U"
    type="opp5"
    term="00N50000001OrMh"
    close_date="opp9"
    stage="opp11"
    account_name = "opp4"

    @session.fill_in(opportunity_name,:with => opp_name)
    @session.fill_in(account_name, :with => $create_opp['account_name'])
    @session.select("APAC", :from => opp_region)
    @session.select("India",:from => opp_country)
    @session.select("No",:from =>tw_client)
    @session.select("No",:from => new_account)
    @session.select("New Business",:from =>type)
    @session.select("Perpetual", :from =>term)
    closing_date = (Date.today>>12).strftime("%m/%d/%Y")
    @session.fill_in(close_date, :with =>closing_date)
    @session.select("Qualified Opportunity", :from =>stage)
    @session.select("Twist", :from => "00N50000001OrP7_unselected")
    @session.find(:css, "a[title='Add']").click
    @session.find(:css, "td#topButtonRow input[title='Save']").click
  end

  def select_contact contact
    contactsList = @session.all("tr[class~=dataRow]")
    contactsList.each do |element|
      if element.has_content?(contact)
        element.first(:css, 'td input').click
        element.first("td select").select("Evaluator")
      end
    end
    save
  end

  def create_contact
    first_name = "j_id0:j_id1:j_id2:j_id29:j_id33"
    last_name = "j_id0:j_id1:j_id2:j_id29:j_id35"
    role = "j_id0:j_id1:j_id2:j_id29:j_id37"
    email = "j_id0:j_id1:j_id2:j_id29:j_id34"
    country = "j_id0:j_id1:j_id2:j_id29:j_id38"
    @session.find(".pbButton input[value='New Contact']").click
    @session.fill_in(first_name, :with =>$create_opp[:contact]['new_contact_fname'])
    @session.fill_in(last_name, :with => $create_opp[:contact]['new_contact_lname'])
    @session.select($create_opp[:contact]['new_contact_role'], :from =>role)
    @session.fill_in(email, :with => $create_opp[:contact]['new_contact_email'])
    @session.fill_in(country, :with => $create_opp[:contact]['new_contact_country'])
    @session.click_button("Save")
  end


  def save
    @session.find(:css, "td.pbButton  input[value='Save']").click
    return NewOpportunityPage.new(@session)
  end

  def get_opp_name
    @session.find("#opp3_ileinner").text
  end

  def get_account_name
    @session.find("a#lookup001R000000pvuKPopp4").text
  end

  def contact_exists?
    contactsList = @session.all("tr[class~=dataRow]")
    exists = false
    contactsList.each do |element|
      if element.has_content?($create_opp[:contact]['new_contact_fname'])
        exists = true
        break
      end
    end
    return exists
  end

end
