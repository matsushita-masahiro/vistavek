class MembersController < ApplicationController
    def index
        @members = Member.all.order(updated_at: :desc)
    end
end
