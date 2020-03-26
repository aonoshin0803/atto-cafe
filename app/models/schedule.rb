class Schedule < ApplicationRecord
    validates :join_date, presence:true
    validates :start_time, presence:true
    validates :end_time, presence:true
    validates :content, length:{maximum:150}
    
    belongs_to :shop
end
