require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager = Manager.create!(email: 'test2@gmail.com', password: 'test1234')
    sign_in @manager
    @note = Note.create(content: 'Test', date: Date.tomorrow, manager: @manager)
  end

  test "should get index" do
    get notes_url
    assert_response :success
  end

  test "should get new" do
    get new_note_url
    assert_response :success
  end

  # test "should create note" do
  #   assert_difference('Note.count') do
  #     post notes_url, params: { note: { content: @note.content, date: @note.date, manager: @note.manager } }
  #   end

  #   assert_redirected_to note_url(Note.last)
  # end

  test "should show note" do
    get note_url(@note)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { content: @note.content, date: @note.date, manager: @note.manager } }
    assert_redirected_to note_url(@note)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end

  test "manager id should equal" do
    assert_equal @manager.id, @note.manager.id
  end
end
