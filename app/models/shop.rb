class Shop < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates:name, {presence:true, length:{maximum:20}}
    validates:place, {presence:true, length:{maximum:20}}
    validates:start_time, presence:true
    validates:end_time, presence:true
    validates:wifi, presence:true
    validates:outlet, presence:true
    validates:other, length:{maximum:200}
    
    belongs_to :user
    has_many :photos, :dependent => :destroy
    has_many :schedules, :dependent => :destroy
end
