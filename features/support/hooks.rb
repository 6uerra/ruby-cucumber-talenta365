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