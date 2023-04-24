# frozen_string_literal: true

class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  # check whether version is specified or is default
  def matches?(request) = check_headers(request.headers) || default

  private

  def check_headers(headers) = headers&.[](:accept).to_s.include?("application/vnd.todos.#{version}+json")
end
