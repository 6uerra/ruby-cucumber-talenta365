# frozen_string_literal: true

After do
  clear_data_browser
end

Before ('@sign_in') do
  openbrowser('advantage')
  register_user
  fill_data_user
  validate_register
end

Before ('@login') do
  openbrowser('advantage')
  enter_session
  $username=get_env('USER_NAME')
  enter_data $username, get_env('PASSWORD')
  validate_login
end