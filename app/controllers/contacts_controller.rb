class ContactsController < ApplicationController
  
  before_action :spam_check, only: [:create]

  def new
    logger.debug("================= contact controller new")
    @contact = Contact.new
  end


  def create
      
        @contact = Contact.new(contact_params)
        respond_to do |format|
          if @contact.save
            ContactMailer.send_when_contact(@contact).deliver
            ContactMailer.send_when_contact_admin(@contact).deliver
            format.html { redirect_to root_path, notice: "お問い合わせを受け付けました" }
            format.json { render :index, status: :created, location: @contact }
          else
            format.html { render :index, notice: "お問い合わせを受け付けできませんでした"  }
            format.json { render json: @contact.errors, status: :unprocessable_entity }
          end
        end

  
    # if @contact.save 
    #   flash[:notice] = "下記内容でお問い合わせを受け付けました"
    #   redirect_to contact_path(@contact)
    # else
    #   flash[:notice] = "お問い合わせを受け付けできませんでした"
    #   render "contacts/new"
    # end
  end

  
  private 
    def contact_params
        params.require(:contact).permit(:name, :email, :phone, :content)
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
