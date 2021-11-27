class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new and return if params[:back]
  end

  def create
    @contact = Contact.new(contact_params)
    render :new and return if params[:back]

    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'new'
    end
  end

  def thanks
    @contact = Contact.new(contact_params)
    ContactMailer.received_email(@contact).deliver
    flash[:notice] = "お問い合わせ頂き、ありがとうございました。"
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
