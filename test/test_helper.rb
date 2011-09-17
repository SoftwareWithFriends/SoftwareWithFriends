ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
Dir.glob(File.dirname(__FILE__) + '/blueprints/*.rb').each {|blueprint| require blueprint}

class ActiveSupport::TestCase
  # self.use_transactional_fixtures = true
  # self.use_instantiated_fixtures = false

  setup do
    Sham.reset
    clear_database
  end
  
  teardown do
    clear_database
  end
  
  def assert_negative_routes(hash, params = nil)
    hash.each do |method, action|
        actions = [action].flatten
        actions.each do |action|
          assert_routing_error(method, action, params)
        end
    end
  end

  def assert_routing_error(method, action, params = nil)
    assert_raise ActionController::RoutingError do
      params ? send(method.to_s, action.to_sym, params) : send(method.to_s, action.to_sym)
    end
  end 
  
  def clear_database
    MongoMapper.database.collections.select { |c| c.name != 'system.indexes' }.each(&:drop)
  end
  
end
