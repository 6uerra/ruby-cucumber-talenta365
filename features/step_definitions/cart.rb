# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'faker'


Given 'I want to buy a product from anywhere in the store'  do
    select_category
end

And 'I select the product of my choice' do
    select_product
end

Then 'I add it to the shopping cart' do
    add_cart_product
end

And 'it is valid that if the product is added to the cart' do
    validate_cart_product
end


