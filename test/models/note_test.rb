require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  setup do
    @manager = Manager.create!(email: 'test2@gmail.com', password: 'test1234')
    sign_in @manager
  end
  
  test "is not valid when empty" do
    note = Note.new()
    assert_not note.save
  end

  test "valid when data is passed" do
    note = Note.new(content: 'Test', date: Date.tomorrow, manager: @manager)
    assert note.save
  end
end
