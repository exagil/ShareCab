class UserMailer < ApplicationMailer
    default from: "chiragravikanth@gmail.com"  

    def test(email)
      mail(:to => email, :subject => "Hello World!")
    end
end
