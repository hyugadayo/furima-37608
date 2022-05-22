class ApplicationController < ActionController::Base
  before_action :basic_path

  private

  def basic_path
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_USER'] && password == ENV['BASIC_PASSWORD']
    end
  end
end
