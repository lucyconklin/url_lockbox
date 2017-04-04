require 'rails_helper'

describe "A User Can Sign Out" do
  context "as a signed in user" do
    before :each do
      @user = User.create(email:  "martha@marthastewart.com", password: "quince")
      visit signin_path

      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password

      click_on 'Submit'
    end

    it "I can see a link to sign out" do
      expect(page).to have_content('Sign Out')
    end

    it "and if I click that link I am redirected to log in or sign up" do
      click_on 'Sign Out'

      expect(current_path).to eq('/signin')
    end
  end
end
