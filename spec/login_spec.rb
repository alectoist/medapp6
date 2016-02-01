# require_relative '../app/models/drug'
require 'rails'
require 'rspec/rails'
require 'capybara/rails'

describe "visit the login page", :type => :feature do
  it "and expect response 200" do
    visit '/login'
    expect(page.status_code).to eq(200)
  end
end

