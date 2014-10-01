#
#
#client_secret: "3448286894417737266"
#client_id: "3MVG982oBBDdwyHgjNQrfBxWKZ4g9UinJcqDpAiZ1jY04E2so7ejWH.oZuDpYYfqMqAUfAIpe.Rame3BgNf4Z"
# require 'Databasedotcom'

#
#@response = `curl -d "username=ashwinii@thoughtworks.com.config2" -d "password=Sales@1234zJZV3aCOSUDZT1OvqhFM9GvK" -d "client_id=3MVG982oBBDdwyHgjNQrfBxWKZ4g9UinJcqDpAiZ1jY04E2so7ejWH.oZuDpYYfqMqAUfAIpe.Rame3BgNf4Z" -d "client_secret=3448286894417737266" -v -d "grant_type=password" https://cs13.salesforce.com/services/oauth2/token`
# @res =  @response.scan(/access_token":"([^}]*)"/).first.first

 p "*" * 50
 #puts @res
 #@client = Databasedotcom::Client.new :client_id => "3MVG982oBBDdwyHgjNQrfBxWKZ4g9UinJcqDpAiZ1jY04E2so7ejWH.oZuDpYYfqMqAUfAIpe.Rame3BgNf4Z", :client_secret => "3448286894417737266"
#@client = Databasedotcom::Client.new :host => "https://cs13.salesforce.com"

#@client.authenticate :username => "ashwinii@thoughtworks.com.config2", :password => "Sales@zJZV3aCOSUDZT1OvqhFM9GvK"

#@client.authenticate :token => @res, :instance_url => "https://cs13.salesforce.com"
#
#
#p "*" * 50
#
#@client.materialize("Contact")
#puts @client.describe_sobject("Contact")
#@client.create("Lead",{"LastName" => "Goodname", "Company" => "TW", "Studios_Lead_Status__c" => "New"})
#puts Contact.first.inspect
#@client.create("Account",{"Name" => "Goodaccount", "Industry" => "Other", "Client_Classification__c" => "Best","Last_Classification_Date__c" => "2013-02-01","CurrencyIsoCode" => "INR"})
#@client.create("Contact",{"LastName" => "Stud", "AccountId" => "001W000000DzNq5","Phone" => "123456", "Email" => "a@sdc.com"})

#puts Opportunity.query("Contact_Name__c = 'Preeti'").inspect
#p "*" * 50
#puts Contact.query("LastName = 'Stud'").inspect

#@client.materialize ('Contact')
#@client.materialize ('User')
#me = Contact.first
#puts me.FirstName


#me = User.query("id = '#{@client.user_id}'")[0]
#puts "My name is still #{me.FirstName} #{me.LastName}"

#puts @client.User.methods.sort.join



#puts @client.query("SELECT Id, FirstName, LastName, Account.Name FROM Contact WHERE AccountId != NULL ORDER BY CreatedDate DESC LIMIT 5")

#puts @client.list_sobjects
#contact_class = @client.materialize("User")
#puts Contact.attributes
#puts Account.create("AccountNumber = '1234567'")



#puts User.query("Id != NULL LIMIT 20")[0].Username


