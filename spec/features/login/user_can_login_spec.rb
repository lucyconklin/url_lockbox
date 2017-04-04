require 'rails_helper'

describe "A User Can Login" do
  it "as a guest, when I visit '/', I should be redirected and prompted to log in or sign up" do
    visit links_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Log In or Sign Up")
  end
end
