class Admin::MembersController < ApplicationController
    
    before_action :get_member, only: [:edit, :destroy, :update]
    
    def new
        @member = Member.new
        @zodiac_list = Member.zodiac_list
        @constellation_list = Member.constellation_list
    end
    
    def create
        @member = Member.new(member_params)

        if @member.save
            
            logger.debug("--------------- saved")
            if member_params[:icon].present?
                icon = member_params[:icon]
                @member.update(icon: "#{@member.id}.png")
                File.binwrite("public/image/members/#{@member.icon}", icon.read)
            else
                @member.update(icon: "no-image.png")
            end            
            
            
            flash[:notice] = "#{@member.last_name}#{@member.first_name}がMemberに追加されました"
            redirect_to admin_members_path
        else
            logger.debug("--------------- not save")
            flash[:error] = "Memberに追加されませんでした"
            render 'new'
        end
    end
    
    def edit
        @zodiac_list = Member.zodiac_list
        @constellation_list = Member.constellation_list        
    end
    
    def update

        if @member.update(member_params)
            if member_params[:icon].present?
                icon = member_params[:icon]
                @member.update(icon: "#{@member.id}.png")
                File.binwrite("public/image/members/#{@member.icon}", icon.read)
            elsif @member.icon != "no-image.png"
                @member.update(icon: "#{@member.id}.png")
            else
                @member.update(icon: "no-image.png")
            end
            flash[:notice] = "#{@member.last_name_kanji}#{@member.first_name_kanji}の情報が更新されました"
            redirect_to admin_members_path            
        else
            logger.debug("--------------- not updated")
            flash[:error] = "Memberは更新されませんでした"
            render 'edit'            
        end
        
    end
    
    def index
        @members = Member.all.order(updated_at: :desc)
    end

    def destroy
        logger.debug("=================== member destroy")
        if @member.destroy
            flash[:notice] = "Memberを削除しました"
            redirect_to admin_members_path
        else
            flash[:error] = "Memberを削除できませんでした"
            redirect_to edit_admin_member_path(@member)
        end
    end
    
    private
      def member_params
          params.require(:member).permit(:last_name,:first_name,:last_name_kanji,:first_name_kanji,
                                         :title,:comment,:zodiac,:constellation,:qualification,:hobby,:icon)
      end
      
      def get_member
          @member = Member.find_by(id: params[:id])
      end

end
