class Admin::AnswersController < ApplicationController
  
 before_action :get_contact

  def new
    @answer = Answer.new(contact_id: @contact.id)
  end
  
  def create
    @answer = Answer.new(answer_params)
    @contact = Contact.find(@answer.contact_id)
    logger.debug("======================== answer create @contact.email = #{@contact.email}")
    @answer.user_id = current_user.id
    
        respond_to do |format|
          if @answer.save
            ContactMailer.send_when_answer(@answer,@contact).deliver
            ContactMailer.send_when_answer_admin(@answer,@contact).deliver
            format.html { redirect_to admin_contacts_path, notice: "回答しました" }
            format.json { render :index, status: :created, location: @answer }
          else
            format.html { render :index, notice: "回答できませんでした"  }
            format.json { render json: @answer.errors, status: :unprocessable_entity }
          end
        end    
    
    
  end
  
  private 
    def get_contact
      @contact = Contact.find_by(id: params[:contact_id])
    end
    
    
    def answer_params
        params.require(:answer).permit(:contact_id, :answer)
    end
    
    
    def spam_check
      check_flag = false
      spam_words = []
      
      ["Д","б","й","д","ш","ы","л","Г","П","я","</a>"].each do |word|
         if params[:answer][:comment].include?("#{word}")
           spam_words << word
           check_flag = true
         end
       end           
       
       if check_flag
          logger.debug("----------- Check contact because spam mail received -> #{spam_words}")
          redirect_to root_path
       end
    end  

end
