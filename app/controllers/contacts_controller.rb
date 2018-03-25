class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new()
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)

    flash[:success] = "#{@contact.full_name}'s contact information was updated!"
    redirect_to company_path(@company)
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save

    redirect_to company_path(Company.find(params[:company_id]))
  end

  def destroy
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash[:success] = "#{@contact.full_name}'s information was deleted!"
    redirect_to company_path(@company)
  end

  private
  def contact_params
    params.require(:contact).permit(:full_name, :email, :position, :company_id)
  end
end
