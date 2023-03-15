class Admin::ContactsController < ApplicationController
  
  before_action :exist_contact, only: [:show]
  before_action :spam_check, only: [:create]
  before_action :authenticate_user!, only: [:index, :destroy]
  
  def index
    # @contacts = Contact.all.order(created_at: :desc)
    @contacts = Contact.all.order(created_at: :desc).page(params[:page]).per(3)
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def destroy 
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path
  end
  
  private 
    def contact_params
        params.require(:contact).permit(:name, :email, :phone, :content)
    end
    
    def exist_contact
      if !Contact.find_by(id: params[:id])
        flash[:alert] = "お問合せがありません"
        redirect_to contacts_path
      end
    end
    
    def spam_check
      check_flag = false
      spam_words = []
      
      ["Д","б","й","д","ш","ы","л","Г","П","я","</a>"].each do |word|
         if params[:contact][:content].include?("#{word}")
           spam_words << word
           check_flag = true
         end
       end
       
       if !check_flag
          ["Д","ш","й","д","ш","ы","л","Г","П","я"].each do |word|
             if params[:contact][:name].include?("#{word}")
               spam_words << word
               check_flag = true
             end
           end
       end
       
       if !check_flag
          ["Д","б","й","д","ш","ы","л","Г","П","я"].each do |word|
             if params[:contact][:email].include?("#{word}")
               spam_words << word
               check_flag = true
             end
           end
       end       
       
       
       
       if check_flag
          logger.debug("----------- Check contact because spam mail received -> #{spam_words}")
          redirect_to root_path
       end
    end
  

end
