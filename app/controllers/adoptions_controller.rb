class AdoptionsController < ApplicationController
  include ActionView::Helpers::FormTagHelper

    def new
      @pets = Pet.find(session[:favorites])
    end

end
