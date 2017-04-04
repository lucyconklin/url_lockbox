require 'rails_helper'

RSpec.describe UsersController do
  it "should post to users" do
    payload = { user: { email: 'martha@marthastewart.com',
                        password: 'quince',
                        password_confirmation: 'quince'
                      }
              }
    post :create, params: payload

    expect(response).to redirect_to(links_path)
  end
end
