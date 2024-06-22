class Api::V1::BaseController < ApplicationController
  include Pagy::Backend
  
  skip_before_action :verify_authenticity_token
end
