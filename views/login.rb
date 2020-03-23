# frozen_string_literal: true

module Login
  #For the elements I use the structure of {access_type}_{type}__{name_element}
  @@id_btn_user = 'menuUser'
  @@name_txt_user_name =  'username'
  @@name_txt_password =  'password'
  @@id_btn_sing_in = 'sign_in_btnundefined'
  @@id_text_user= 'menuUserLink'
  
  def enter_session
    wait_displays(:id,@@id_btn_user, 10)
    click(:id,@@id_btn_user)
  end

  #You enter the data that is received by parameters for the login
  def enter_data (user,password)
    wait_displays(:name,%w[username password], 10)
    wait_for_element_to_enable(:name,@@name_txt_user_name,20)
    wait_for_element_to_enable(:name,@@name_txt_password,20)
    enter_text(:name,user,@@name_txt_user_name)
    enter_text(:name,password,@@name_txt_password)
    wait_for_element_to_enable(:id,@@id_btn_sing_in,10)
    wait_and_click_element(:id,@@id_btn_sing_in)
  end

  #It compares if the user entered was correctly logged in
  def validate_login
    wait_displays(:id,@@id_text_user,10)
    sleep 7 if get_element_text(:id,@@id_text_user) == '' 
    $username.should eq get_element_text(:id,@@id_text_user)
  end
  
end
World(Login)
