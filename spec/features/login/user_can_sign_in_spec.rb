require 'rails_helper'

describe "A User Can Sign In" do
  context "as a signed up user" do
    before :each do
      @user = User.create(email:  "martha@marthastewart.com", password: "quince")
    end

    it "when I attempt to sign in with valid credentials I see a success message" do
      visit signin_path

      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password

      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Sign Out")
      expect(page).to have_content("Successfully Signed In")
    end

    it "when I attempt to sign in with invalid credentials I see an unsuccessful message" do
      visit signin_path

      fill_in "user_email", with: "rock@therock.com"
      fill_in "user_password", with: @user.password

      click_on 'Submit'

      expect(current_path).to eq(signin_path)
      expect(page).not_to have_content("Sign Out")
      expect(page).not_to have_content("Successfully Signed In")
      expect(page).to have_content("Email and password do not match. Try again.")
    end
  end
end
