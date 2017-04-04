require 'rails_helper'

describe "A User Can Sign Up" do
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

    it "if I fill out all fields correctly I will be signed up and redirected to links_path" do
      visit signup_path

      fill_in "user_email", with: "martha@marthastewart.com"
      fill_in "user_password", with: "quince"
      fill_in "user_password_confirmation", with: "quince"

      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Sign Out")
    end

    it "if I do not enter a unique email I get an error message" do
      user = User.create(email:  "martha@marthastewart.com", password: "quince")
      visit signup_path

      fill_in "user_email", with: "martha@marthastewart.com"
      fill_in "user_password", with: "quince"
      fill_in "user_password_confirmation", with: "quince"

      click_on 'Submit'

      expect(current_path).to eq(signup_path)
      expect(page).to have_content("Email has already been taken")
    end

    it "if I do not enter an email address I get an error message" do
      visit signup_path

      fill_in "user_password", with: "quince"
      fill_in "user_password_confirmation", with: "quince"

      click_on 'Submit'

      expect(current_path).to eq(signup_path)
      expect(page).to have_content("Email can't be blank")
    end

    it "if I do not enter a password I get an error message" do
      visit signup_path

      fill_in "user_email", with: "martha@marthastewart.com"

      click_on 'Submit'

      expect(current_path).to eq(signup_path)

      expect(page).to have_content("Password can't be blank")
    end

    it "if I do not enter a matching password and password confirmation I get an error message" do
      visit signup_path

      fill_in "user_email", with: "martha@marthastewart.com"
      fill_in "user_password", with: "quince"
      fill_in "user_password_confirmation", with: "quincepaste"

      click_on 'Submit'

      expect(current_path).to eq(signup_path)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
