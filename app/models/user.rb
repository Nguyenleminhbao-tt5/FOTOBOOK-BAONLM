class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    before_save :set_fullname
    
    enum user_type: { guest: 0, client: 1, admin: 2}

    validates :fname, :lname ,length: { minimum: 2, maximum: 25}
    validates :age, numericality: true
    validates :user_type, :sex, presence: true
    mount_uploader :avatar, ImageUploader
    validates :email, presence: true, uniqueness: true, length: { maximum: 255}
      

    has_many :albums , dependent: :destroy
    has_many :photos , dependent: :destroy

    has_many :clients, class_name: "User",foreign_key: "manage_id"
    belongs_to :admin, class_name: "User", optional: true

    has_many :follows_as_follower, foreign_key: :following_id, class_name: 'Follow' , dependent: :destroy
    has_many :followers, through: :follows_as_follower

    has_many :follows_as_following, foreign_key: :follower_id, class_name: 'Follow'  , dependent: :destroy
    has_many :followings, through: :follows_as_following

    has_many :like_photos , dependent: :destroy
    has_many :liked_by_photos, through: :like_photos, source: :photo
    
    has_many :like_albums , dependent: :destroy
    has_many :liked_by_albums, through: :like_albums, source: :album

    has_many :messages , dependent: :destroy

    
    has_many :notifications, as: :recipient
    


    after_update_commit do  
        broadcast_append_to :notifications, target: 'list_notification', partial: 'components/notification', locals: {user: self, action: "#{self.fullname} updated profile"}
    end


    private
       
    def set_fullname
      self.fullname = "#{fname} #{lname}"
    end
      
end
