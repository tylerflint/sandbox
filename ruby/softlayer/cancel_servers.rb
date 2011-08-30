require 'softlayer_api'
require 'json'
require 'pp'

# https://gist.github.com/570676 - that has some code in C#

# This needs to first initialize the services that will be used.
# The server must have the components added.
# Before submitting the order for a server, it should check to make sure that the data is valid
# Finally it may submit the order and

# https://api.softlayer.com/rest/v3/SoftLayer_Location/getDatacenters.xml
# https://api.softlayer.com/rest/v3/SoftLayer_Account/getActivePackages.xml
# https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/51.xml?objectMask=items

def cancelServers()

	softlayerAccount = SoftLayer::Service.new( "SoftLayer_Account", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')

	guests = softlayerAccount.getVirtualGuests

	guests.each {|server|
    # puts "server information for server: #{server['id']}"
	

		softlayerVirtualGuest = SoftLayer::Service.new( "SoftLayer_Virtual_Guest", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')

		softlayerBillingItem = SoftLayer::Service.new( "SoftLayer_Billing_Item", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123' )

    begin
		  info = softlayerVirtualGuest.object_with_id("#{server['id']}").getBillingItem
    rescue Exception => e
    end
		#pp info
		
		if (server['hostname'].include? 'toaster') 
		  #pp server
		  puts server['hostname']
      begin
        softlayerBillingItem = SoftLayer::Service.new( "SoftLayer_Billing_Item", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123' )
        canceled = softlayerBillingItem.object_with_id("#{info['id']}").cancelService
      # 
      #   pp canceled
      rescue Exception => e
        puts e.message
      end
		end
	}

end


# loop do
#   cancelServers
#   sleep 900
# end

# def addServer()
# 	softlayerAccount = SoftLayer::Service.new( "SoftLayer_Account", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')
# 
# 	packages = softlayerAccount.getActivePackages
# 
# 
# 	allCategories = []
# 	packages.each {|server|
# 		if server["name"] == "Cloud Server"
# 		softlayerProductPackage = SoftLayer::Service.new( "SoftLayer_Product_Package", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')
# 		serverInfo = softlayerProductPackage.object_mask("items").object_with_id("#{server['id']}").getObject
# 		softlayerProductItem = SoftLayer::Service.new( "SoftLayer_Product_Item_Price", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123' )
# 		serverInfo["items"].each {|item|
# 			categories = softlayerProductItem.object_with_id("#{item["prices"][0]["id"]}").getCategories
# 			if allCategories[categories[0]['id']] == nil
# 				allCategories[categories[0]['id']] = categories[0]
# 		end
# 		if allCategories[categories[0]['id']]['items'] == nil
# 			allCategories[categories[0]['id']]['items'] = []
# 		end
# 		allCategories[categories[0]['id']]['items'].push(item)
# 	}
# 	end
# }
# allCategories.each {|category|
# 	if category != nil
# 		category["items"] = category["items"].sort_by {|item|
# 			if item['capacity'].to_i == nil
# 				item['description']
# 			end
# 			item['capacity'].to_i
# 			}
# 	end
# }
# return allCategories
# end

#puts addServer()
# 
# def getDatacenters()
# 	softlayerLocation = SoftLayer::Service.new( "SoftLayer_Location", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')
# 	datacenters = softlayerLocation.getDatacenters
# 	return datacenters
# end
# 
# softlayerProductOrder = SoftLayer::Service.new( "SoftLayer_Product_Order", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')
# 
# softlayerVirtualGuest = SoftLayer::Service.new( "SoftLayer_Virtual_Guest", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')

#serverTemplate = softlayerVirtualGuest.object_with_id("187402").getOrderTemplate("HOURLY")
#serverTemplate.delete("imageTemplateId")
#serverTemplate.delete('sourceVirtualGuestId')

#cancelServers

# serverTemplate = {
# 	:billingInformation => {
# 		:billingAddressLine1 => '',
# 		:billingAddressLine2 => '',
# 		:billingCity => '',
# 		:billingCountryCode => '',
# 		:billingEmail => '',
# 		:billingNameCompany => '',
# 		:billingNameFirst => '',
# 		:billingNameLast => '',
# 		:billingPhoneFax => '',
# 		:billingPhoneVoice => '',
# 		:billingPostalCode => '',
# 		:billingState => '',
# 		:cardAccountNumber => '',
# 		:cardExpirationMonth => '',
# 		:cardExpirationYear => '',
# 		:creditCardVerificationNumber => '',
# 		:taxExempt => '',
# 	},
# 	:hardware => [],
# 	:location => 138124,
# 	:locationObject => { 
# 		:id => 138124,
# 		:longName => '',
# 		:name => ''
# #		:locationAddress => {
# #			:address1 => '',
# #			:address2 => '',
# #			:city => '',
# #			:contactName => '',
# #			:country => '',
# #			:description => '',
# #			:id => ,
# #			:isActive => ,
# #			:locationId => ,
# #			:postalCode => '',
# #			:state => '',
# #			:account => {},
# #			:createUser => {},
# #			:location => {},
# #			:modifyEmployee => {},
# #			:modifyUser => {}
# #			
# #		},
# #		:locationReservationNumber => {
# #		},
# #		:onlinePptpVpnUserCount =>
# #		:onlineSslVpnUserCount =>
# #		:regions => [
# #			{
# #
# #			}
# #		]
# #		:regionsCount =>
# 	},
# 	:message => '',
# 	:packageId => 46,
# 	:paymentType => '',
# 	:postTaxRecurring => nil,
# 	:postTaxSetup => nil,
# 	:preTaxRecurring => nil,
# 	:preTaxSetup => nil,
# 	:prices => [
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 1644,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 1800,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 2144,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 21,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 55,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 57,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 58,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 272,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 420,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 1640,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 2202,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		},
# 		{
# 			:currentPriceFlag => nil,
# 			:hourlyRecurringFee => nil,
# 			:id => 2302,
# 			:itemId => nil,
# 			:laborFee => nil,
# 			:onSaleFlag => nil,
# 			:oneTimeFee => nil,
# 			:oneTimeFeeTax => nil,
# 			:orderOptions => [],
# 			:proratedRecurringFee => nil,
# 			:proratedRecurringFeeTax => nil,
# 			:recurringFee => nil,
# 			:recurringFeeTax => nil,
# 			:setupFee => nil,
# 			:sort => nil
# 		}
# 	],
# 	:primaryDiskPartitionId => nil,
# 	:promotionCode => '',
# 	:properties => [],
# 	:proratedInitialCharge => nil,
# 	:proratedOrderTotal => nil,
# 	:quantity => 1,
# 	:quoteName => '',
# 	:sendQuoteEmailFlag => false,
# 	:stepId => nil,
# 	:totalRecurringTax => nil,
# 	:totalSetupTax => nil,
# 	:useHourlyPricing => true,
# 	:virtualGuests => [
# 		{
# 			:accountId => nil,
# 			:createDate => nil,
# 			:dedicatedAccountHostOnlyFlag => false,
# 			:domain => 'pagodagrid.com',
# 			:fullyQualifiedDomainName => '',
# 			:hostname => 'testhost',
# 			:id => nil,
# 			:lastVerifiedDate => nil,
# 			:maxCpu => nil,
# 			:maxCpuUnits => nil,
# 			:maxMemory => nil,
# 			:metricPollDate => nil,
# 			:modifyDate => nil,
# 			:notes => '',
# 			:privateNetworkOnlyFlag => false,
# 			:startCpus => nil,
# 			:statusId => nil,
# 			:uuid => nil
# 		}
# 	]
# }
#pp serverTemplate[:prices]
#puts softlayerProductOrder.checkItemConflicts(serverTemplate[:prices])
#serverTemplate["packageId"] = 46
#serverTemplate["location"] = 138124
#serverTemplate["quantity"] = 1
#serverTemplate["useHourlyPricing"] = true
#serverTemplate["virtualGuests"] = []
#serverTemplate["virtualGuests"][0] = {}
#serverTemplate["virtualGuests"][0]["hostname"] = 'testhost'
#serverTemplate["virtualGuests"][0]["domain"] = 'pagodagrid.com'
#serverTemplate["virtualGuests"][0]["hourlyBillingFlag"] = true
#verifiedOrder = softlayerProductOrder.verifyOrder(serverTemplate)
#serverTemplate["prices"] = []
#1644, 1800, 2144, 21, 55, 57, 58, 272, 420, 1640, 2202, 2302
#serverTemplate["prices"].push({"id" => 1644})
#serverTemplate["prices"].push({"id" => 1800})
#serverTemplate["prices"].push({"id" => 2144})
#serverTemplate["prices"].push({"id" => 21})
#serverTemplate["prices"].push({"id" => 55})
#serverTemplate["prices"].push({"id" => 57})
#serverTemplate["prices"].push({"id" => 58})
#serverTemplate["prices"].push({"id" => 272})
#serverTemplate["prices"].push({"id" => 420})
#serverTemplate["prices"].push({"id" => 1640})
#serverTemplate["prices"].push({"id" => 2202})
#serverTemplate["prices"].push({"id" => 2302})
#pp serverTemplate["prices"]
#verifiedOrder = softlayerProductOrder.verifyOrder(serverTemplate)
#puts softlayerProductOrder.checkItemConflicts(serverTemplate["prices"])
#pp serverTemplate



def viewServers()

	softlayerAccount = SoftLayer::Service.new( "SoftLayer_Account", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')

	guests = softlayerAccount.getVirtualGuests

	guests.each {|server|
		puts "server information for server: #{server['id']}"
		pp server
		
		softlayerVirtualGuest = SoftLayer::Service.new( "SoftLayer_Virtual_Guest", :username => 'tylerp', :api_key => '16c291a6f775cd57ab11be1035abc265224073e99f1c02a028d886b6f5b03123')

    pp softlayerVirtualGuest.object_with_id("#{server['id']}").getOrderTemplate("HOURLY")
	}

end

cancelServers()

#pp softlayerVirtualGuest.method_missing("getOrderTemplate", {"billingType" => "HOURLY"})
#template = softlayerProductOrder.method_missing("requiredItems", serverTemplate["prices"])
#puts template
#verifiedOrder = softlayerProductOrder.verifyOrder(serverTemplate)
#pp verifiedOrder

# allCategories = addServer
# allCategories.each{|category|
# 	if category != nil
# 		puts "#{category['name']}"
# 		category['items'].each{|item|
# 			puts "	#{item['prices'][0]['id']}	#{item['prices'][0]['hourlyRecurringFee']}	#{item['description']}"
# 		}
# 	end
# }
#datacenters = getDatacenters