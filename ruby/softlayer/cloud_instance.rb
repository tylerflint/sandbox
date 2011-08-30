#!/usr/bin/env ruby

require 'savon'
require 'pp'
require 'crack'

username = 'SL33667'
key =  '471b43675895e1091db02fce568528ccc437ad56a8b97f3d06d058598cd2997e'

softlayeraccount      = Savon::Client.new "https://api.softlayer.com/soap/v3/SoftLayer_Account?wsdl"
softlayervirtualguest = Savon::Client.new "https://api.softlayer.com/soap/v3/SoftLayer_Virtual_Guest?wsdl"
softlayerProductOrder = Savon::Client.new "https://api.softlayer.com/soap/v3/SoftLayer_Product_Order?wsdl"


Savon::Request.log = false

response = softlayeraccount.get_virtual_guests {|soap| soap.header = { :authenticate => { :username => username, :apiKey => key}}}

virtualGuests = Crack::XML.parse(response.to_xml)

id = virtualGuests["SOAP_ENV:Envelope"]["SOAP_ENV:Body"]["ns1:getVirtualGuestsResponse"]["getVirtualGuestsReturn"]["item"][0]["id"]
#puts id


response = softlayervirtualguest.get_order_template {|soap| 
    soap.header = { :authenticate => { :username => username, :apiKey => key },
                    :SoftLayer_Virtual_GuestInitParameters => { :id => id }
                  }
    soap.body = { :billingType => 'HOURLY' }
}

#pp response.map_soap_response

template = Crack::XML.parse(response.to_xml)

orderData = template["SOAP_ENV:Envelope"]["SOAP_ENV:Body"]["ns1:getOrderTemplateResponse"]["getOrderTemplateReturn"]

orderData["location"] = 3

orderData["imageTemplateId"] = 2858

orderData["quantity"] = 1

orderData["sourceVirtualGuestId"] = {"xsi:nil"=>"true"}

orderData["virtualGuests"] = {}
orderData["virtualGuests"]["item"] = { "hostname" => 'test2', "domain" => 'pagodagrid.com', 'xsi:type' => 'ns1:SoftLayer_Container_Virtual_Guest'}
orderData["virtualGuests"]["SOAP_ENC:arrayType"] = "ns1:SoftLayer_Virtual_Guest[1]"
orderData["virtualGuests"]['xsi:type'] = 'ns1:SoftLayer_Container_Virtual_GuestArray'

# pp orderData

# exit

# softlayerProductOrder.place_order do |soap|
#   soap.header = { :authenticate => { :username => username, :apiKey => key }}
#   soap.body   = { :orderData => orderData }
# end

# pp orderData

# softlayerProductOrder.verify_order do |soap|
#     soap.header = { :authenticate => { :username => username, :apiKey => key }}
#     soap.body = { :orderData => orderData }
# end

puts orderData.to_soap_xml
