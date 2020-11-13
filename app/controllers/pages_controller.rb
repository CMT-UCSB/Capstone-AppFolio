class PagesController < ApplicationController
    before_action :authenticate_user!, :only => [:account]
    def home
    end
end