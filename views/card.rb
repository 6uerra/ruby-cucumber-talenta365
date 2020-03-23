# frozen_string_literal: true
require 'faker'

module Card
  #In this case I want to select a random category so I use a dynamic xpath
  @@xp_category = '//div[contains(@id,"Img")]'
  @@xp_products = '(//img[contains(@class,"imgProduct")])'
  @@xp_get_name_product ='//*[@id="Description"]/h1'
  @@xp_get_price ='//*[@id="Description"]/h2'
  @@xp_get_color ='//*[@id="rabbit"]'
  @@xp_get_quantity =''
  @@name_btn_add ='save_to_cart'

  

  def select_category
    sleep 3
    categorys = find_elements(:xpath,@@xp_category)
    categorys[rand(categorys.length)].click

  #select product 
sleep 3
  products = find_elements(:xpath,@@xp_products)
  products[rand(products.length)].click

    #get data
 byebug
 @product_name=  get_element_text(:xpath,@@xp_get_name_product)
 @product_price=  get_element_text(:xpath,@@xp_get_price).gsub('SOLD OUT', "").strip

 #validar si existe el color
 @product_color= get_element_attribute(:xpath, @@xp_get_color, 'class')

 wait_displays(:name,@@name_btn_add, 5)
 wait_for_element_to_enable(:name,@@name_btn_add,5)
 click(:name,@@name_btn_add)




  

  end

  
end
World(Card)
