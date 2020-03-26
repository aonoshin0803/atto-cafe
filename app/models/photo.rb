class Photo < ApplicationRecord
    validates:image, presence:true
    belongs_to :shop, optional: true
end
