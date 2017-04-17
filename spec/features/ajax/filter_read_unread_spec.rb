require 'rails_helper'

RSpec.describe "user can filter read and unread links", :js => :true do
  before :each do
    user = User.create(email:  "martha@marthastewart.com", password: "quince")
    @link = Link.create(url: 'http://www.marthastewart.com',
                       title: "THIS is the best website",
                       user_id: user.id)
    @link2 = Link.create(url: 'http://www.marthastewart.com',
                      title: "THIS is the best website",
                      user_id: user.id,
                      read: true)
    visit "/"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password

    click_on 'Submit'
  end

  scenario "by clicking on 'show unread'" do
    click_on 'Show all read'

    expect(page).to have_content(@link2.title)
    expect(page).not_to have_content(@link.title)
  end

  scenario "by clicking on 'show read'" do
    click_on 'Show all unread'

    expect(page).to have_content(@link.title)
    expect(page).not_to have_content(@link2.title)
  end
end
