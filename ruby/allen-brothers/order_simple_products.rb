#!/usr/bin/env ruby 

require 'mysql'

# my = Mysql::new("mlabdev.materialogic.com", "ecom251allenbrot", "abcd-1234", "magento_ecom251allenbrothers")
my = Mysql::new("staging.delorum.com", "root", "root", "allen-bros")

result = my.query "SELECT link_id, product_id, GROUP_CONCAT(linked_product_id ORDER BY linked_product_id DESC SEPARATOR ',') AS linked FROM catalog_product_link WHERE link_type_id=3 GROUP BY product_id"
result.each_hash do |row|
  count = 1
  row['linked'].split(',').each do |link|
    my.query "INSERT INTO catalog_product_link_attribute_int VALUES('', 7, (SELECT link_id FROM catalog_product_link WHERE product_id=#{row['product_id']} AND linked_product_id=#{link}), #{count})"
    count += 1
  end
end