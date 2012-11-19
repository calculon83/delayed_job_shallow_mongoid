require 'rubygems'
require 'bundler/setup'

require 'mail'
require 'action_mailer'
require 'mongoid'
require 'delayed_job_shallow_mongoid'

Mongoid.configure do |config|
  config.connect_to('delayed_job_shallow_mongoid_test')
end

RSpec.configure do |config|
  config.before(:each) do
    Mongoid.purge!
    Mongoid::IdentityMap.clear
  end
  config.after(:all) do
    Mongoid.default_session.drop
  end
end
