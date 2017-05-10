require 'rails_helper'

RSpec.describe 'Contributors', type: :request do
  describe 'GET /dtom90.json' do
    it 'gets root path' do
      get '/dtom90.json'
      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.keys).to eq ['dtom90']
      days = parsed_body['dtom90']
      today = Time.now.to_date.to_s
      expect(days.keys).to include today
    end
  end
end
