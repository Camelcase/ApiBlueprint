# frozen_string_literal: true

module Response
  def json_response(object, status = :ok)
    render json: object, status:
  end

  def json_minimal_response(object, status = :ok)
    render json: object, status:, minimal: true
  end
end
