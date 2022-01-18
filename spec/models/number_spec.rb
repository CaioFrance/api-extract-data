require 'rails_helper'

RSpec.describe Number, type: :model do
  it 'is valid with data, status and page' do
    number = Number.create(data: "1,2,3,4,5", page: 1, status: 200)
    expect(number).to be_valid
  end

  it 'is invalid without data' do
    number = Number.create(page: 1, data: nil, status: 200)
    expect(number).to be_invalid
  end

  it 'is invalid without page' do
    number = Number.create(page: nil, data: "1,2,3,4", status: 200)
    expect(number).to be_invalid
  end

  it 'is invalid without status' do
    number = Number.create(page: 1, data: "1,2,3,4", status: nil)
    expect(number).to be_invalid
  end

  it 'should sort integer values' do
    arr = [3,4,5,6,7,1,2,8,2]

    sort_arr = arr.sort

    new_arr = Number.sort_numbers(arr)

    expect(new_arr).to eql sort_arr
  end


  it 'should sort float values' do
    arr = [3.2,4.3,5.4,1.6,0.37,123.21,32312.2,213.8,231.2]

    sort_arr = arr.sort

    new_arr = Number.sort_numbers(arr)

    expect(new_arr).to eql sort_arr
  end

  it 'should format and sort value' do
    number = Number.create(data: "\"2.2,1.3,4.1,0.2\"", page: 1, status: 200)

    data_format = Number.format_data_string_to_float(number.data)
    data_sort = Number.sort_numbers(data_format)

    expect(data_sort).to match_array([0.2, 1.3, 2.2, 4.1])
  end
end
