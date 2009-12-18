# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ledgers_session',
  :secret      => 'cc0f739eb744bf1ed41cdd1d53a075d7b9b807efd98665630a943b275563d3deb8d7f6b7aea672a8918c58ccbd1b4c61515aecf935f9437167a4f65c29d646a1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
