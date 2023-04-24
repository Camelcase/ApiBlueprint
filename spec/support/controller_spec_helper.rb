module ControllerSpecHelper
  def token_generator(user_id) = JsonWebToken.encode(user_id:)

  def expired_token_generator(user_id) = JsonWebToken.encode({ user_id: }, (Time.now.to_i - 10))

  def valid_headers = {
    'Authorization': token_generator(user.id),
    'Content-Type': 'application/json'
  }

  def invalid_headers = {
      'Authorization': nil,
      'Content-Type': 'application/json'
  }

end
