class MembersController < ApplicationController
    def index
        @members = Member.all.order(created_at: :desc)
    end
end
