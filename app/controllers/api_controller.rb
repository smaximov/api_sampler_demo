class ApiController < ActionController::API
  before_action :ensure_json_only

  private

  def ensure_json_only
    head(:unsupported_media_type) unless request.format.json?
  end
end
