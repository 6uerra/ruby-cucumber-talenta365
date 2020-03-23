# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'faker'


Given 'I want to log in'  do
    enter_session
end

Then 'I enter my username and password' do
    enter_data $username, $password
end

Then 'I enter my username {string} and password {string}' do |user,password|
    enter_data user, password
end

And 'I validate that the account is correct' do
    validate_login
end

