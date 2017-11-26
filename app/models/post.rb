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

  validates :user_id, presence: true

  mount_uploader :image, PhotoUploader

  has_many :comments, dependent: :destroy

end
