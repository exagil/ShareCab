class UserMailer < ApplicationMailer
    default from: "chiragravikanth@gmail.com"  

    def test(email)
      mail(:to => email, :subject => "Hello World!")
    end

    def welcome(email,name)
      @name = name
      mail(:to => email, :subject => "Welcome to ShareCab")
    end

    def join(email, name)
      @name = name
      mail(:to => email, :subject => "You have joined a ride!")
    end
    

end
