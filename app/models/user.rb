class User < ApplicationRecord
  has_many :items, dependent: :destroy

  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms
  has_many :chats, dependent: :destroy
  has_many :commented_items, through: :chats, source: :item

  has_many :assessments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  # source: :follower ってことは､最終的には @user.followings ってやると､@userがフォローしたfollowerたちが返ってくる
  has_many :passive_relationships, class_name:'Relationship', foreign_key: 'folloer_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user 

  # source: :user ってことは､最終的には @follower.followers ってやると､@followerがフォローされた側で､@followerをフォローしたuserたちが返ってくる. 

  # class_nameで指定しているのは､そうしなきゃ､フォローする側とフォローされる側の区別がつかなくなるから

  # また､foreign_key を指定しているのは､そういなきゃ､いつもどおり､user_idを参照してしまうから｡
  
  mount_uploader :img, UserImgUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def follow(other_user)
    return if self == other_user

    relationships.find_or_create_by!(follower_id: other_user.id)
  end

  def following?(user)
    followings.include?(user)
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end
end












