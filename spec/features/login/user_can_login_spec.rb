require 'rails_helper'

describe "A User Can Login" do
  context "as a guest" do
    it "when I visit '/', I should be redirected and prompted to log in or sign up" do
      visit root_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Log In or Sign Up")
    end

    it "if I click 'Sign Up', I should be taken to a signup form" do
      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq('/signup')
      expect(page).to have_content('Sign Up')
    end

    xit "if I fill out all fields correctly I will be signed up and redirected to links_path" do

    end

    xit "if I do not enter a unique email I get an error message" do
      expect(page).to have_content("Email address is already taken, please enter a new email address.")
    end

    xit "if I do not enter an email address I get an error message" do

      expect(page).to have_content("Please enter an email address.")
    end

    xit "if I do not enter a password I get an error message" do

      expect(page).to have_content("Please enter and confirm your password.")
    end

    xit "if I do not enter a matching password and password confirmation I get an error message" do

      expect(page).to have_content("Passwords do not match, please try again.")
    end
  end
end
