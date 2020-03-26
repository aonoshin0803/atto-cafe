class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image, ImageUploader
  
  validates:name, {presence:true, length:{maximum:15}}
  validates:work, length:{maximum:20}
  validates:content, length:{maximum:150}
  
  has_many :shops, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :messages, :dependent => :destroy
end
