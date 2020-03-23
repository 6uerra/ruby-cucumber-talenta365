# frozen_string_literal: true
require 'faker'

module Login
  @@id_btn_user = 'menuUser'
  @@name_txt_user_name =  'username'
  @@name_txt_password =  'password'
  @@id_btn_sing_in = 'sign_in_btnundefined'
  @@id_text_user= 'menuUserLink'
  

  def enter_session
    wait_displays(:id,@@id_btn_user, 10)
    click(:id,@@id_btn_user)
  end

  def enter_data (user,password)
    wait_displays(:name,%w[username password], 10)
    wait_for_element_to_enable(:name,@@name_txt_user_name,20)
    wait_for_element_to_enable(:name,@@name_txt_password,20)
    enter_text(:name,user,@@name_txt_user_name)
    enter_text(:name,password,@@name_txt_password)
    wait_for_element_to_enable(:id,@@id_btn_sing_in,10)
    wait_and_click_element(:id,@@id_btn_sing_in)
  end

  def validate_login
    wait_displays(:id,@@id_text_user,10)
    sleep 7 if get_element_text(:id,@@id_text_user) == '' 
    $username.should eq get_element_text(:id,@@id_text_user)
  end
  
end
World(Login)
