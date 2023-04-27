# frozen_string_literal: true

module Response
  def json_response(object, status = :ok)
    render json: object, status:
  end

  def json_minimal_response(object, status = :ok)
    render json: object, status:, minimal: true
  end

  def json_interactor_response(object)
    if object.success?
      render json: object.result, status: object.status
    else
      error_msg = object&.result || { "status": 'API Error' }
      error_status = object&.status || :bad_request
      render json: error_msg, status: error_status
    end
  end
end
