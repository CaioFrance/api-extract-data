class Api::NumbersController < ApplicationController
  before_action :search_number
  before_action :get_number

  def index
    if @number.empty?
      render json: {}, status: :no_content
    else
      render json: { numbers: @number }, status: :ok
    end
  end

  private

  def get_number
    if @number.nil?
      @number = []
    else
      format_data
    end
  end

  def search_number
    unless params[:page].nil?
      @number = Number.find_by(page: params[:page])
    else
      @number = Number.find_by(page: 1)
    end
  end

  def format_data
    @number = Number.format_data_string_to_float(@number.data)
    @number = Number.sort_numbers(@number)
  end

end
