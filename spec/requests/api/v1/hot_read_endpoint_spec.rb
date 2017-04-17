require 'rails_helper'

describe "Hot Reads Endpoint" do
  it "hot reads endpoint returns most-read links" do
    user = User.create(email:  "martha@marthastewart.com", password: "quince")
    link = Link.create(url: 'http://www.horse.com',
                       title: "Why horses are the best",
                       user_id: user.id)
    link2 = Link.create(url: 'http://www.marthastewart.com/cookies',
                      title: "cookie website",
                      user_id: user.id)

    get '/api/v1/hot-reads'

    result = JSON.parse(response.body, :quirks_mode => true)

    expect(result.length).to eq(2)
    expect(result[0]['title']).to eq('Why horses are the best')
  end
end
