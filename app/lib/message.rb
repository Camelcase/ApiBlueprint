# app/lib/message.rb
class Message
  def self.not_found(record = 'record') = "Sorry, #{record} not found."
  def self.invalid_credentials = 'Invalid credentials'
  def self.invalid_token = 'Invalid token'
  def self.missing_token = 'Missing token'
  def self.unauthorized = 'Unauthorized request'
  def self.account_created = 'Account created successfully'
  def self.account_not_created = 'Account could not be created'
  def self.expired_token = 'Sorry, your token has expired. Please login to continue.'
end
