class Category < ActiveRecord::Base
  has_many :tags
  has_many :shirts, through: :tags
end
