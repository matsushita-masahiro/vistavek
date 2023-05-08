class Member < ApplicationRecord
 
 
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_kanji, presence: true
    validates :first_name_kanji, presence: true
    validates :title, presence: true
    validates :comment, presence: true
    validates :zodiac, presence: true
    validates :constellation, presence: true
    validates :qualification, presence: true
    validates :hobby, presence: true
    validates :icon, presence: true
    

    scope :zodiac_list, -> { 
     {
       "ねずみ" => "1", 
       "うし" => "2",
       "とら" => "3", 
       "うさぎ" => "4", 
       "たつ" => "5", 
       "へび" => "6", 
       "うま" => "7", 
       "ひつじ" => "8", 
       "さる" => "9", 
       "とり" => "10", 
       "いぬ" => "11", 
       "いのしし" => "12"
     }
   }
   
    scope :constellation_list, -> { 
     {
       "おひつじ座" => "1", 
       "おうし座" => "2",
       "ふたご座" => "3", 
       "かに座" => "4", 
       "しし座" => "5", 
       "おとめ座" => "6", 
       "てんびん座" => "7", 
       "さそり座" => "8", 
       "いて座" => "9", 
       "やぎ座" => "10", 
       "みずがめ座" => "11", 
       "うお座" => "12"
     }
   }
   

    
end
