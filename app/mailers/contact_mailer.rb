class ContactMailer < ApplicationMailer
 
  def contact_email(contact)
  	@contact = Contact.find(contact)
    mail(from: @contact.email , to: 'mapadesaborlwr@gmail.com', subject: 'Mapa de sabores - Contacto')
  	puts "-------------------------------------------"
  	puts "Enviado"
  	puts "-------------------------------------------"
  end
end
