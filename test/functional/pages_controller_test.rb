require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper'))

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

  def test_root_to_home
    assert_recognizes({ :controller => 'pages',
                        :action     => 'show',
                        :id         => 'home' },
                     "/")

  end

  def test_get_home
    get :show, :id => 'home'
    assert_response(:success)
    assert_template('home')
  end
end
