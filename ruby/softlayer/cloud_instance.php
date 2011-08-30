<?php


include('SoftLayer/SoapClient.class.php');

// Get a record of the order used to create the computing instance we're trying
// to duplicate. We're going to modify it then use it to place an order. This
// assumes you already know your CCIs id number. If you don't know which
// instance to duplicate then call SoftLayer_Account::getVirtualGuests() to get
// a list of your account's computing instances. We're going to create a monthly
// billed instance copy, so we're passing the 'MONTHLY' parameter. If you want
// to make an hourly billed instance change the parameter name to 'HOURLY'.


$client = SoftLayer_SoapClient::getClient('SoftLayer_Virtual_Guest', 191633, 'SL33667', '471b43675895e1091db02fce568528ccc437ad56a8b97f3d06d058598cd2997e');



try {
    $orderTemplate = $client->getOrderTemplate('HOURLY');
    echo "Retrieved order template.\n";
} catch (Exception $e) {
    die('Unable to retrieve instance order template: ' . $e->getMessage() . "\n\n");
}

// Before you place the order we have to modify the order template.
//
// 1) Remove the source virtual guest id
// 2) Set the image template to the id of the disk image you wish to use. If you
//    don't know your template id call the SoftLayer_Account::getBlockDeviceTemplateGroups()
//    method to get your saved templates.
// 3) Specify the id of the datacenter you want your instance to go in. You can
//    get a list of these from the SoftLayer_Location_Datacenter::getDatacenters()
//    method or use the following:
//    3:     Dallas
//    18171: Seattle
//    37473: Washington DC
// 4) Specify how many instance copies you want to order.
// 5) Specify a hostname and domain for each instance you want to order.
$orderTemplate->sourceVirtualGuestId        = null;
$orderTemplate->imageTemplateId             = 2858;
$orderTemplate->location                    = 3;
$orderTemplate->quantity                    = 1;
$orderTemplate->virtualGuests               = array();
$orderTemplate->virtualGuests[0]->hostname  = 'testhost';
$orderTemplate->virtualGuests[0]->domain    = 'pagodagrid.org';


// Now we'll re-declare $client to connect to the SoftLayer_Product_Order
// service so we can place our order with the placeOrder() method. We need to
// re-declare our order template as a SoftLayer_Container_Product_Order_Virtual_Guest
// in order for our ordering systems to apply virtual guest logic.
$client = SoftLayer_SoapClient::getClient('SoftLayer_Product_Order', null, 'SL33667', '471b43675895e1091db02fce568528ccc437ad56a8b97f3d06d058598cd2997e');

print_r( new SoapVar($orderTemplate, SOAP_ENC_OBJECT, 'SoftLayer_Container_Product_Order_Virtual_Guest', 'http://api.service.softlayer.com/soap/v3/'));

try {
    $newOrder = $client->placeOrder(new SoapVar($orderTemplate, SOAP_ENC_OBJECT, 'SoftLayer_Container_Product_Order_Virtual_Guest', 'http://api.service.softlayer.com/soap/v3/'));
    print_r( $client->__getLastRequest());
    echo "Placed new order!\n\n";
    // print_r($newOrder);
} catch (Exception $e) {
    print_r( $client->__getLastRequest());
    die('Unable to place new order: ' . $e->getMessage() . "\n\n");
}

// All done! The order will get approved by our system, and you'll have a shiny
// new CCI in a few minutes.  Here are some manual links for the services and
// methods we called and referred to in this script:
//
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Account
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Virtual_Guest
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Location_Datacenter
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Product_Order
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Container_Product_Order_Virtual_Guest
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Account::getVirtualGuests
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Account::getBlockDeviceTemplateGroups
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Virtual_Guest::getOrderTemplate
// http://sldn.softlayer.com/wiki/index.php/SoftLayer_Location_Datacenter::getDatacenters