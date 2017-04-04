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

    it "I can save a valid link" do

      fill_in 'link_url', with: "http://www.marthastewart.com"
      fill_in 'link_title', with: "This is the best website"

      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).to have_content("http://www.marthastewart.com")
      expect(page).to have_content("This is the best website")
      expect(page).to have_content("Mark as read")
    end

    xit "I must fill out url field to submit link" do
      fill_in 'link_title', with: "This is the best website"

      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).not_to have_content("This is the best website")
      expect(Link.all.count).to eq(0)
    end

    xit "I must fill out title field to submit link" do
    end

    xit "I cannot save a link with an invalid url" do
      fill_in 'link_url', with: "This is the best website"

      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).not_to have_content("This is the best website")
      expect(Link.all.count).to eq(0)
    end

    xit "I cannot save a link without a unique url" do
      expect(Link.all.count).to eq(0)
      
      link = Link.create(url: 'http://www.marthastewart.com',
                         title: "no THIS is the best website",
                         user_id: @user.id)

      fill_in 'link_url', with: "http://www.marthastewart.com"
      fill_in 'title', with: "something"

      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).not_to have_content("something")
      expect(Link.all.count).to eq(1)
    end
  end
end
