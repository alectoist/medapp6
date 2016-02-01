# require_relative '../app/models/drug'
require 'rails'
require 'rspec/rails'
require 'capybara/rails'

describe "visit main without session", :type => :feature do
  it "and expect to be redirected to /login" do
    visit '/'    
    expect(current_path).to eq('/login')
    expect(page.status_code).to eq(200)
  end

  it "and expect it to have a login form" do
  	visit '/login' 
  	expect(page).to have_selector('.login-wrap')
  end
end