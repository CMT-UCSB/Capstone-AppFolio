class PagesController < ApplicationController
    before_action :authenticate_manager!, :only => [:account]
    def home
    end
end