class Number < ApplicationRecord

  validates :status, :page, :data, presence: true

  # Espera receber uma string
  def self.format_string(data)
    data.split('"')[1]
  end

  def self.format_data_string_to_float(data)
    string_format = Number.format_string(data)
    string_format.split(',').map {|v| v.to_f}
    # data_format.join.split(',').map {|v| v.to_f}
  end

  def self.sort_numbers(data, arr=[])
    aux = data[0]
    tmp = nil
    if data.empty?
      arr
    else
      data.each_with_index do |value, index|
        if value < aux
          aux = value
          tmp = index
        end
      end

      arr << aux
      if tmp.nil?
        data.delete aux
      else
        data.delete_at tmp
      end

      sort_numbers(data, arr)

    end
  end
end
