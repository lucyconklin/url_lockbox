require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(email:  "martha@marthastewart.com", password: "quince")
    link = Link.create(url: 'http://www.marthastewart.com',
                       title: "THIS is the best website",
                       user_id: user.id)

    visit "/"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password

    click_on 'Submit'

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
