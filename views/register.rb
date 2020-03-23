# frozen_string_literal: true
require 'faker'

module Register
  @@id_btn_user = 'menuUser'
  @@link_create_user =  'CREATE NEW ACCOUNT'
  @@name_txt_username = 'usernameRegisterPage'
  @@name_txt_email = 'emailRegisterPage'
  @@name_txt_psw = 'passwordRegisterPage'
  @@name_txt_confirmpws = 'confirm_passwordRegisterPage'
  @@name_txt_fist = 'first_nameRegisterPage' 
  @@name_txt_last = 'last_nameRegisterPage' 
  @@name_txt_phone = 'phone_numberRegisterPage'
  @@name_lts_country = 'countryListboxRegisterPage'
  @@name_txt_city = 'cityRegisterPage'
  @@name_txt_address = 'addressRegisterPage'
  @@name_txt_state = 'state_/_province_/_regionRegisterPage'
  @@name_txt_code = 'postal_codeRegisterPage'
  @@name_check_agree = 'i_agree'
  @@id_btn_register = 'register_btnundefined'
  @@id_text_user= 'menuUserLink'
  @@all_fill = ['usernameRegisterPage','emailRegisterPage','passwordRegisterPage','confirm_passwordRegisterPage','first_nameRegisterPage','last_nameRegisterPage','phone_numberRegisterPage','countryListboxRegisterPage','cityRegisterPage','addressRegisterPage','postal_codeRegisterPage','state_/_province_/_regionRegisterPage','i_agree']
  @@xp_txt_get_title ='//h3[@translate="MY_ACCOUNT"]'
  @@xp_txt_my_account = '//label[@class="option roboto-medium ng-scope"][contains(.,"My account")]'
  @@xp_txt_get_name = '(//label[@class="ng-binding"][contains(.,"")])[1]'
  @@xp_txt_get_address = '(//label[@class="ng-binding"][contains(.,"")])[2]'
  @@xp_txt_get_city = '(//label[@class="ng-binding"][contains(.,"")])[3]'
  @@xp_txt_get_country = '(//label[@class="ng-binding"][contains(.,"")])[4]'
  @@xp_txt_get_state = '(//label[@class="ng-binding"][contains(.,"")])[5]'
  @@xp_txt_get_code = '(//label[@class="ng-binding"][contains(.,"")])[6]'
  @@xp_txt_get_phone = '(//label[@class="ng-binding"][contains(.,"")])[7]'
  @@xp_txt_sign_out = '//label[@class="option roboto-medium ng-scope"][contains(.,"Sign out")]'

  def register_user
    wait_displays(:id,@@id_btn_user, 10)
    click(:id,@@id_btn_user)
    wait_displays(:link,@@link_create_user, 10)
    wait_and_click_element(:link,@@link_create_user)
  end


  def fill_data_user
    load_data_fill
    wait_displays(:name,@@all_fill,7)
    enter_text(:name,$username,@@name_txt_username)
    enter_text(:name,@@email,@@name_txt_email)
    enter_text(:name,$password,@@name_txt_psw)
    enter_text(:name,$password,@@name_txt_confirmpws)
    enter_text(:name,@@fist_name,@@name_txt_fist)
    enter_text(:name,@@last_name,@@name_txt_last)
    enter_text(:name,@@phone,@@name_txt_phone)
    enter_text(:name,@@city,@@name_txt_city)
    enter_text(:name,@@address,@@name_txt_address)
    enter_text(:name,@@state,@@name_txt_state)
    enter_text(:name,@@code,@@name_txt_code)
    check_checkbox(:name,@@name_check_agree)
    wait_and_select_option(:name,:text, @@country,@@name_lts_country)
    click(:id,@@id_btn_register)
  end

  def validate_register
    wait_displays(:id,@@id_text_user,10)
    sleep 3 if get_element_text(:id,@@id_text_user) == ''
    $username.should eq get_element_text(:id,@@id_text_user)
    wait_displays(:id,@@id_btn_user, 10)
    click(:id,@@id_btn_user)
    wait_displays(:xpath,@@xp_txt_my_account, 10)
    click(:xpath,@@xp_txt_my_account)
    wait_displays(:xpath,@@xp_txt_get_title, 10)
    name =  @@fist_name+ ' ' + @@last_name
    name.should eq get_element_text(:xpath,@@xp_txt_get_name)
    @@address.should eq get_element_text(:xpath,@@xp_txt_get_address)
    @@city.should eq get_element_text(:xpath,@@xp_txt_get_city)
    @@state.should eq get_element_text(:xpath,@@xp_txt_get_state)
    @@phone.should eq get_element_text(:xpath,@@xp_txt_get_phone)
    @@country.should eq get_element_text(:xpath,@@xp_txt_get_country)
    click(:id,@@id_btn_user)
    wait_displays(:xpath,@@xp_txt_sign_out , 10)
    click(:xpath,@@xp_txt_sign_out)
  end

  private

  def load_data_fill
    $username =Faker::Name.middle_name+Faker::Name.initials
    @@email= Faker::Internet.email
    $password = (Faker::Alphanumeric.alphanumeric 8 ) + "A1"
    @@fist_name= Faker::Name.first_name
    @@last_name = Faker::Name.last_name
    @@phone=Faker::PhoneNumber.cell_phone
    @@country= 'United States'
    @@city=Faker::Nation.nationality
    @@address=Faker::Address.street_address
    @@state=Faker::Name.initials
    @@code=Faker::Number.digit
  end

  def wait_and_select_option(*values)
    @@arg = values
    attempts = 0
    is_selected = false
    while is_selected == false && attempts <= 5
      sleep 3
      begin
        select_option_from_dropdown(*@@arg)
        is_selected = true
      rescue StandardError
        is_selected = false
        attempts += 1
      end
    end
  end

end
World(Register)
