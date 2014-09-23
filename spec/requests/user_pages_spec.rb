require 'spec_helper'

describe "User pages" do

  describe "signup page" do
    #before { visit signup_path }
    it "should have the title 'Sign up'" do
      visit signup_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Sign up")
    end
    it "should have th content 'Sign up'" do
    	visit signup_path
    	expect(page).to have_content("Sign up")
    end
  end
end
