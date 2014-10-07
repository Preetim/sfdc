require 'Databasedotcom'

class Seed
  @@username = DATABASE["username"]
  @@password = DATABASE["password"]
  @@client_id = DATABASE["client_id"]
  @@client_secret = DATABASE["client_secret"]
  @@instance_url = DATABASE["instance_url"]
  @@url = DATABASE["url"]

  def initialize
    token = `curl -d "username=#{@@username}" -d "password=#{@@password}" -d "client_id=#{@@client_id}" -d "client_secret=#{@@client_secret}" -d "grant_type=password" #{@@instance_url}`
    token = token.scan(/access_token":"([^}]*)"/).first.first
    @client = Databasedotcom::Client.new :client_id => "#{@@client_id}", :client_secret => "#{@@client_secret}"
    @client.authenticate :token => token, :instance_url => @@url
  end

  def seed_data
    seed_account $create_opp["account_name"]
  end

  def delete_opportunity opp_name
    @client.materialize("Opportunity")
    Opportunity.find_by_Name(opp_name).delete
  end

  def delete_contact contact_name
    @client.materialize("Contact")
    contact = Contact.find_by_FirstName(contact_name)
    contact ? contact.delete : nil
  end

  def seed_account account
    @client.materialize("Account")
    is_account_null = Account.query("Name = '"+ account +"'").inspect
    # Seed Account if it does not exist..
    p "*" * 50
    if  is_account_null == "[]"
      (puts "Seeding #{account}...................................................")
      @client.create("Account", {"Name" => account, "Industry" => "Other", "Client_Classification__c" => "Best", "Last_Classification_Date__c" => "2013-02-01", "CurrencyIsoCode" => "INR"})
      (puts "#{account} seeded in this test run.............................!!!!!!!")
    else
      (puts "#{account} not seeded in this Test Run..........................!!!!!")
    end
    p "*" * 50
  end

  def seed_contact lastName, account
    @client.materialize("Account")
    account_id = Account.find_by_Name(account)
    p"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    p account_id.Id
    @client.materialize("Contact")
    @client.create("Contact", {"LastName" => lastName, "AccountId" => account_id})
  end

  def seed_for_integration
    seed_account $jigsaw_mashup["account"]
    seed_contact $jigsaw_mashup["contact_last_name"], $jigsaw_mashup["account"]
  end

  def delete_integration_seeds
    delete_contact $jigsaw_mashup["contact_last_name"]
  end
end













