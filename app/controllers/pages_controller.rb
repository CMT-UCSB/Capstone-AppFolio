class PagesController < ApplicationController
    def home
    end

    def about
        render template: "/pages/about.html.erb"
    end
    
    def team
    end

<<<<<<< HEAD
    def account
    end

    def faq
=======
    def faq
    end
    
    def account
>>>>>>> 0d838f7bdfc981f81beb2496915bd1b72a2607bf
    end
end