require 'serverspec'
require 'pathname'
require 'net/http'
require 'net/smtp'
require 'json'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
  end
end

$chef_config = ::JSON.parse(File.read('/tmp/serverspec/chef_config.json'))
