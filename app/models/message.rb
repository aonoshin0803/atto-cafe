class Message < ApplicationRecord
    validates :title, length:{maximum:30}
    validates :content, presence:true, length:{maximum:500}
    
    belongs_to :user, optional: true
end
