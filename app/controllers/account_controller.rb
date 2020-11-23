class AccountController < ApplicationController
  def index
    @surveys = Survey.where(manager_id: current_manager.id)
  end
end
