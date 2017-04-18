require "rails_helper"

RSpec.describe "can filter links", :js => :true do
  scenario "search for a link" do
    user = User.create(email:  "martha@marthastewart.com", password: "quince")
    link = Link.create(url: 'http://www.marthastewart.com',
                       title: "THIS is the best website",
                       user_id: user.id)
    link2 = Link.create(url: 'http://www.marthastewart.com/cookies',
                      title: "cookie website",
                      user_id: user.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    Link.create(url:"https://turing.io", title:"Turing")
    visit "/"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password

    click_on 'Submit'

    within('#filter') do
      fill_in "search-box", with: "cookie"
    end

    click_on "Search"

    expect(current_path).to eq(links_path)
    expect(page).to have_content(link2.title)
    expect(page).not_to have_content(link.title)

  end

  scenario "search is case insensitive" do
    user = User.create(email:  "martha@marthastewart.com", password: "quince")
    link = Link.create(url: 'http://www.marthastewart.com',
                       title: "THIS is the best website",
                       user_id: user.id)
    link2 = Link.create(url: 'http://www.marthastewart.com/cookies',
                      title: "cookie website",
                      user_id: user.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    Link.create(url:"https://turing.io", title:"Turing")
    visit "/"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password

    click_on 'Submit'

    within('#filter') do
      fill_in "search-box", with: "CoOkIe"
    end

    click_on "Search"

    expect(current_path).to eq(links_path)
    expect(page).to have_content(link2.title)
    expect(page).not_to have_content(link.title)

  end
end
