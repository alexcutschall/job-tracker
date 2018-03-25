class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new()
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save

    redirect_to company_path(Company.find(params[:company_id]))
  end

  private
  def contact_params
    params.require(:contact).permit(:full_name, :email, :position, :company_id)
  end
end
