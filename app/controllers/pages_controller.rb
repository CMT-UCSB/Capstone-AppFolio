class PagesController < ApplicationController
    def home
    end

    def about
        render template: "/pages/about.html.erb"
    end
    
    def team
    end

    def faq
    end
    
    def account
    end
end