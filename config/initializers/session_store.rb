# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_AName_session',
  :secret      => '288ad2ae8830979c689c5d27361e509df0524e742d07bbfaa3d1aa9adb9c9efebd2dc4d91b390af37c9a345ebe3fcb2dcd2b34d2ff5055ecaefca2d78b370385'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
