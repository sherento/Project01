# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  profile         :text
#  header          :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  admin           :boolean          default(FALSE)
#  picture         :string
#

class User < ApplicationRecord

  has_secure_password
  has_many :posts, dependent: :destroy

  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true

  has_many :comments, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  # follow / unfollow methods
  # has_many :follow_user
  # has_many :unfollow_user

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

end
