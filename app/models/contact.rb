class Contact < ApplicationRecord
    has_many :answers, dependent: :destroy
    
    validates :name, presence: true    
    validates :email, presence: true    
    validates :phone, presence: true    
    validates :content, presence: true    
end
