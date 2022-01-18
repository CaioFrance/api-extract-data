require 'rails_helper'

RSpec.describe "Api::Numbers", type: :request do
  describe "GET /" do
    before(:each) do
      Number.create(data: "\"1.2,2.3,42\"", page: 1, status: 200)
    end

    it 'return status 200 and first data if param is not passed' do
      get api_numbers_path
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(numbers: [1.2, 2.3, 42])
    end

    it 'should return data from selected page' do
      Number.create(data: "\"1.2231,2.23,0.1241\"", page: 2, status: 200)

      get api_numbers_path, params: { page: 2 }

      expect(response).to have_http_status(200)
      expect(response.body).to include_json(numbers: [0.1241,1.2231, 2.23])
    end

    it 'should return an no content if the page does not exist' do
      get api_numbers_path, params: {page: 10001}

      expect(response).to have_http_status(204)
    end

    it 'should return not found with request post' do
      post api_numbers_path

      expect(response).to have_http_status(404)
    end

    it 'should return not found with request put' do
      put api_numbers_path

      expect(response).to have_http_status(404)
    end

    it 'should return not found with request delete' do
      delete api_numbers_path

      expect(response).to have_http_status(404)
    end
  end
end
