# frozen_string_literal: true
require 'faker'

module Cart
  #For the elements I use the structure of {access_type}_{type}__{name_element}
  #In this case I want to select a random category and product so I use a dynamic xpath
  @@xp_category = '//div[contains(@id,"Img")]'
  @@xp_products = '(//img[contains(@class,"imgProduct")])'
  @@xp_get_name_product ='//*[@id="Description"]/h1'
  @@xp_get_price ='//*[@id="Description"]/h2'
  @@xp_get_quantity =''
  @@name_btn_add ='save_to_cart'
  @@id_container_home ='our_products'
  @@xp_container_product='//*/article//div[2]/ul'
  @@id_cart='menuCart'
  @@id_container_shopping='shoppingCart'
  @@xp_name_cart='//label[contains(@class,"productName")]' 
  @@xp_price_cart='(//p[contains(@class,"price")])[2]'
  
  # the category is selected randomly
  def select_category
    wait_displays(:id,@@id_container_home, 10)
    categorys = find_elements(:xpath,@@xp_category)
    categorys[rand(categorys.length)].click
  end

   # the product is selected randomly and you get the main data of the product as name and price
  def select_product
     wait_displays(:xpath,@@xp_container_product, 10)
     products = find_elements(:xpath,@@xp_products)
     products[rand(products.length)].click   
     wait_displays(:xpath,@@xp_get_name_product, 10)
     @product_name=  get_element_text(:xpath,@@xp_get_name_product)
     @product_price=  get_element_text(:xpath,@@xp_get_price).gsub('SOLD OUT', "").strip
  end

  #Items are added to the shopping cart
  def add_cart_product
    wait_displays(:name,@@name_btn_add, 5)
    wait_for_element_to_enable(:name,@@name_btn_add,5)
    wait_and_click_element(:name,@@name_btn_add)
  end

  #You enter the shopping cart and make the validations that the correct product has been loaded
  def validate_cart_product
    wait_displays(:id,@@id_cart, 5)
    wait_for_element_to_enable(:id,@@id_cart,10)
    wait_and_click_element(:id,@@id_cart)
    wait_displays(:id,@@id_container_shopping, 5)
   @product_name.should eq get_element_text(:xpath,@@xp_name_cart)
   @product_price.should eq get_element_text(:xpath,@@xp_price_cart)
  end

end

World(Cart)
