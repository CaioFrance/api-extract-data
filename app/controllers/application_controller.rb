class ApplicationController < ActionController::API

  def not_found
    render :json => {:error => "Página não existe"}, status: :not_found
  end
end
