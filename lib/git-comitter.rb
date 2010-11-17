$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module GitCommitter
  VERSION = '0.0.1'
end

require 'git'
require 'git-comitter/globals.rb'
require 'git-comitter/primitives.rb'
require 'git-comitter/authors.rb'
