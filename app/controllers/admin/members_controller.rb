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
            
            if member_params[:icon].present?
                icon = member_params[:icon]
                ext = File.extname(icon.original_filename)
                @member.update(icon: "#{@member.id}#{ext}")
                if Rails.env.production?
                  File.binwrite("public/image/members/#{@member.icon}", icon.read)
                elsif Rails.env.development?
                  File.binwrite("public/image/members/dev/#{@member.icon}", icon.read)
                end
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
                ext = File.extname(icon.original_filename)
                @member.update(icon: "#{@member.id}#{ext}")
                if Rails.env.production?
                  File.binwrite("public/image/members/#{@member.icon}", icon.read)
                elsif Rails.env.development?
                  File.binwrite("public/image/members/dev/#{@member.icon}", icon.read)
                end
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
        @members = Member.all.order(display_order: :asc)
    end

    def destroy
        logger.debug("=================== member destroy")
        member = @member
        if @member.destroy
            if Rails.env.production?
              File.delete("public/image/members/#{member.icon}")
            elsif Rails.env.development?
              File.delete("public/image/members/dev/#{member.icon}")
            end
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
                                         :title,:comment,:zodiac,:constellation,:qualification,:hobby,:icon, :display_order)
      end
      
      def get_member
          @member = Member.find_by(id: params[:id])
      end

end
