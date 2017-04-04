require 'rails_helper'

describe "User Can Add Links" do
  context "as a signed in user" do
    before :each do
      @user = User.create(email:  "martha@marthastewart.com", password: "quince")
      visit signin_path

      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password

      click_on 'Submit'
    end

    it "when I visit the link index, I see a form to submit a link" do

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Url:")
      expect(page).to have_content("Title:")
    end
  end
end
