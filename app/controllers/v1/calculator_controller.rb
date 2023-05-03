# frozen_string_literal: true

module V1
  class CalculatorController < ApplicationController
    skip_before_action :authorize_request

    def index
      json_response({ expression: expression_params[:expression],
                      result: parse_expression(expression_params[:expression]) })
    end

    def parse_expression(expression)
      return eval(expression) unless expression.match?(%r{[^0-9+\-*/]})

      'expression not processable'
    end

    def expression_params = params.permit(:expression)
  end
end
