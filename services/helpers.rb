# frozen_string_literal: true

module Helpers
  # Navigate to page and validate if equal with env
  def openbrowser(web)
    url = get_env('URL_' + web.upcase)
    navigate_to(url)
    $driver.current_url.should eql? url
  end

  def wait_and_click_element(access_type, access_name)
    attempts = 0
    is_clickeable = false
    while is_clickeable == false && attempts <= 5
      sleep 2
      begin
        click(access_type, access_name)
        is_clickeable = true
      rescue StandardError
        is_clickeable = false
        attempts += 1
      end
    end
  end

  def wait_displays(type_tag,elements, time)
    if elements.class == String 
      wait_for_element_to_display(type_tag,elements, time )
    else
    elements.map do |tag|
      wait_for_element_to_display(type_tag, tag, time )
    end.all?
  end

  end

  # return the n elements found
  def find_elements(type_tag, elements)
    $driver.find_elements(type_tag, elements)
  end

  def clear_data_browser
    $driver.manage.delete_all_cookies
    $driver.local_storage.clear
    sleep 1
  end

end
World(Helpers)
