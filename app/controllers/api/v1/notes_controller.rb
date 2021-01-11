class Api::V1::NotesController < ApplicationController
  before_action :authenticate_manager!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.where(manager_id: current_manager.id)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    if authorized?
      respond_to do |format|
        format.json { render :show }
      end
    else
      handle_unauthorized
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.manager_id = current_manager.id

    if authorized?
      respond_to do |format|
        if @note.save
          format.html { redirect_to @note, notice: 'Note was successfully created.' }
          format.json { render :show, status: :created, location: api_v1_note_path(@note) }
        else
          format.html { render :new }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    if authorized?
      respond_to do |format|
        if @note.update(note_params)
          format.html { redirect_to @note, notice: 'Note was successfully updated.' }
          format.json { render :show, status: :ok, location: @note }
        else
          format.html { render :edit }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    if authorized?
      @note.destroy
      respond_to do |format|
        format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      handle_unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:date, :content)
    end

    def authorized?
      @note.manager == current_manager
    end

    def handle_unauthorized
      unless authorized?
        respond_to do |format|
          format.json { render :unauthorized, status: 401 }
        end
      end
    end
end
