class Course < ActiveRecord::Base
  has_many :comments, through: :users, dependent: :destroy
  validates :name, presence:true
  validates :street, presence:true
  validates :state, presence:true
  validates :zip_code, presence:true
  validates :google_map, presence:true
end
