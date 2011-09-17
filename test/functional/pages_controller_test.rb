require File.join(File.dirname(__FILE__), '..', 'test_helper')

class PagesControllerTest < ActionController::TestCase

  def test_show_route_only
    assert_negative_routes({ :get  => [:index, :new],
                             :post => :create })

    assert_negative_routes({ :get    => :edit,
                             :put    => :update,
                             :delete => :destroy },
                           { :id => 'about'})

    assert_generates("/pages/:id",
                     { :controller => 'pages',
                       :action     => 'show',
                       :id         => ':id' })

    assert_recognizes({ :controller => 'pages',
                        :action     => 'show',
                        :id         => ':id' },
                     "/pages/:id")
  end
end
