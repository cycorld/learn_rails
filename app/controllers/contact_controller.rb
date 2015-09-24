class ContactController < ApplicationController
    def index
        @contacts = Contact.all
    end
    
    def new
        @contact = Contact.new
    end
    
    def create
        name = params[:contact][:name]
        gender = params[:contact][:gender]
        phone_number = params[:contact][:phone_number]
        Contact.create(name: name, gender: gender, phone_number: phone_number)
        redirect_to '/'
    end
end
