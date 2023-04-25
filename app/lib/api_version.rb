# frozen_string_literal: true

class ApiVersion
  attr_reader :version, :default

  def initialize(version, default)
    @version = version
    @default = default
  end

  def matches?(request) = check_headers(request.headers)

  private

  # check whether version is specified or is default
  def check_headers(headers)
    accept = headers[:accept]
    regex = %r{application/vnd\.books\.(..)\+json}

    return true if default && !accept

    m = regex.match(accept)
    return true if m.nil? && default

    m[1] == version
  end
end
