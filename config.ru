# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

USERS = {
  'username' => 'password'
}
use(Rack::Auth::Digest, {
  realm: 'MyApp',
  opaque: 'secret',
  passwords_hashed: true
}) do |user|
  USERS[user]
end

run Rails.application
