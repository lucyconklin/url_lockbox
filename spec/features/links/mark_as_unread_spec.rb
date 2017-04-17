require "rails_helper"

RSpec.describe "can mark links as unread", :js => :true do
  scenario "Mark a link as unread" do
    user = User.create(email:  "martha@marthastewart.com", password: "quince")
    link = Link.create(url: 'http://www.marthastewart.com',
                       title: "THIS is the best website",
                       user_id: user.id,
                       read: true)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    Link.create(url:"https://turing.io", title:"Turing")
    visit "/"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password

    click_on 'Submit'

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

    click_on "Mark as unread"

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

  end
end
