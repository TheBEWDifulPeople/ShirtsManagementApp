class Category < ActiveRecord::Base
  has_many :tags, dependent: :destroy
  has_many :shirts, through: :tags
end
