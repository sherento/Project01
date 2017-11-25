# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  image      :text
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user, :optional => true

  validates :image, :presence => true
  has_attached_file :image 
end
