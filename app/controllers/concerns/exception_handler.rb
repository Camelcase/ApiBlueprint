# frozen_string_literal: true

module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  end

  private

  def not_found(exception) = json_response({ message: exception.message }, :not_found)

  def unprocessable(exception) = json_response({ message: exception.message }, :unprocessable_entity)

  def unauthorized(exception) = json_response({ message: exception.message }, :unauthorized)
end
