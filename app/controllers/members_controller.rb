class MembersController < ApplicationController
    def index
        @members = Member.all.order(display_order: :asc)
    end
end
