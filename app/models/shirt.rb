class Shirt < ActiveRecord::Base
  validates :name, :description, :image, presence: true
  validates :description, length: { minimum: 10 }
  has_many :tags
  has_many :categories, through: :tags
  belongs_to :vendor

  has_many :closets
  has_many :users, through: :closets
  mount_uploader :image, ImageUploader

  def self.search_for(query)
    where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
  end

  def tag_list
    self.categories.pluck(:name)
  end

   def tag_list=(tags)
    tags = tags.split(/,\s*/)

    tags.each do |tag|
      unless self.categories.find_by name: tag
        self.categories << Category.where(name: tag).first_or_create
      end
    end
    self.categories.where.not(name: tags).destroy_all
  end

end







