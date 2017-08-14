class HomeController < ApplicationController
    def index
        @clubs = current_user.clubs if current_user.clubs.count >= 1
    end
end
