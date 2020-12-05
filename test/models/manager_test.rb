require 'test_helper'

class ManagerTest < ActiveSupport::TestCase
  test "create manager" do
    @manager = Manager.create!(email: 'test2@gmail.com', password: 'test1234')
    assert @manager
  end
end
