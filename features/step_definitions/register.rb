# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'faker'

Given 'I enter in advantage' do
  openbrowser('advantage')
end

And 'I want to register' do
  register_user
end

Then 'I fill out all the data'  do
  fill_data_user
end

And 'validate the successful creation of the account' do
  validate_register
end
