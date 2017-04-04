require 'rails_helper'

describe "User Can Edit Links" do
  context "as a signed in user" do
    before :each do
      @user = User.create(email:  "martha@marthastewart.com", password: "quince")
      visit signin_path

      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password

      click_on 'Submit'

      @link = Link.create(url: 'http://www.marthastewart.com',
                         title: "no THIS is the best website",
                         user_id: @user.id)
    end

    it "I can see an edit button next to my links" do
      visit links_path

      expect(page).to have_link('Edit')
    end

    it "If I click on Edit, I am taken to an edit page for that link" do
      visit links_path

      click_on 'Edit'

      expect(page).to have_content('Edit Link')
      expect(page).to have_current_path("/links/#{@link.id}/edit")
    end

    it "I can edit a link's title" do
      visit links_path

      click_on 'Edit'

      fill_in 'link_title', with: "A new title"

      click_on 'Submit'

      expect(page).to have_current_path(links_path)
      expect(page).to have_content("A new title")
      expect(page).not_to have_content('no THIS is the best website')
      expect(page).to have_content(@link.url)
    end

    it "I can edit a link's url" do
      visit links_path

      click_on 'Edit'

      fill_in 'link_url', with: 'http://www.marthastewart.com/cookies'

      click_on 'Submit'

      expect(page).to have_current_path(links_path)
      expect(page).to have_content('http://www.marthastewart.com/cookies')
      expect(page).to have_content(@link.title)
    end

    it "I cannot save a url that has already been saved" do
      link = Link.create(url: 'http://www.marthastewart.com/cookies',
                         title: "no THIS is the best website",
                         user_id: @user.id)

      visit links_path

      click_link('Edit', match: :first)

      fill_in 'link_url', with: 'http://www.marthastewart.com/cookies'

      click_on 'Submit'

      expect(page).to have_current_path("/links/#{@link.id}/edit")
    end
  end
end
