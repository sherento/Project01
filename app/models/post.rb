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

  has_many :comments, dependent: :destroy

  # scope :of_followed_users, -> (following_users) { where user_id: following_users }

end
