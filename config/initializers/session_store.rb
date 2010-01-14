# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sorvtche_session',
  :secret      => '674230e1c3eb55041f5433940588891b62084de94a56291f50bd80db8d969126931933ded069d558ee6c12666cca865bc1e95eb3f1bd5bc5c5ea784b0aa968f6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
