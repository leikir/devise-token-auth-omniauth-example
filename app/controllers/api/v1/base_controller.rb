class Api::V1::BaseController < Api::BaseController
  before_action :authenticate_user!
end
