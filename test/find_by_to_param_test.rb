require 'test/unit'

require 'rubygems'
require 'activerecord'

#set rails env CONSTANT (we are not actually loading rails in this test, but activerecord depends on this constant)
RAILS_ENV = 'test' unless defined?(RAILS_ENV)

#setup active record to use a sqlite database
# ActiveRecord::Base.configurations = {"test"=>{"dbfile"=>"test.db", "adapter"=>"sqlite3"}}
# ActiveRecord::Base.establish_connection
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

#load the database schema for this test
load File.expand_path(File.dirname(__FILE__) + "/mocks/schema.rb")

#require this plugin
require "#{File.dirname(__FILE__)}/../init"

#require the mock models for the voting system
require File.expand_path(File.dirname(__FILE__) + '/mocks/models.rb')

class FindByToParamTest < Test::Unit::TestCase

  def test_penguins
    p = Penguin.new
    p.name = "bob"
    p.save!
    
    assert_equal("bob", p.to_param)
    assert Penguin.find_by_to_param("bob")
  end
  
  def test_ice_flows
    i = IceFlow.new
    i.save!
    
    assert_equal(i.id.to_s, i.to_param)
    assert IceFlow.find_by_to_param(i.id)
  end
  
  def test_seals
    s = Seal.new
    s.plastic_tag = 832332344
    s.save!
    
    assert_equal("832332344", s.to_param)
    assert Seal.find_by_to_param(832332344)    
    assert Seal.find_by_to_param("832332344")
  end

end
