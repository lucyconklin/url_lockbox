require 'rails_helper'

describe "Test Endpoint" do
  it "test endpoint returns 'hello world' as json" do
    get '/api/v1/test'
    result = JSON.parse(response.body)

    expect(result).to eq('Hello World!')
  end
end
