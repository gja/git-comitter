begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'git-comitter'

include GitComitter

module GitComitter
  attr_accessor :state

  def clear_flags
    @state = :neutral
  end

  def _accept
    @state = :accepted
  end

  def _deny
    @state = :denied
  end
end
