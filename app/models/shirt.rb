class Shirt < ActiveRecord::Base
  validates :name, :description, :image, presence: true
  validates :description, length: { minimum: 10 }
  validates :image, format: { with: /\A\w+.png\z/ }

  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  belongs_to :vendor

  def self.search_for(query)
    where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
  end

  def tag_list
    self.categories.collect { |tag_name| tag_name.name }
  end

  def tag_list=(tags)
    new_tags = tags.split(", ").each do |tag|
      if Category.where(:name => tag).exists?
        next
      else
        self.categories << Category.where(:name => tag).first_or_create
      end
    end
  end
end







