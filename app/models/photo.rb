class Photo < ApplicationRecord

    enum mode: { Public: 0, Private: 1}

    validates :title, length: { maximum: 140 }
    validates :description, length: { maximum: 300 }
    validates :mode, :source ,  presence: true
    mount_uploader :source, ImageUploader

    belongs_to :user
    has_many :photo_albums
    has_many :albums, through: :photo_albums

    has_many :like_photos, dependent: :destroy
    has_many :liked_by_users, through: :like_photos , source: :user

    has_many :notifications, as: :recipient, dependent: :destroy
    has_noticed_notifications




    after_create_commit do  
        broadcast_append_to :notifications, target: 'list_notification', partial: 'components/notification', locals: {user: self.user, action: "#{self.user.fullname} add new photo #{self.title}"}
    end

    after_update_commit do  
        broadcast_append_to :notifications, target: 'list_notification', partial: 'components/notification', locals: {user: self.user, action: "#{self.user.fullname} edit photo #{self.title}"}
    end

    after_destroy_commit do  
        broadcast_append_to :notifications, target: 'list_notification', partial: 'components/notification', locals: {user: self.user, action: "#{self.user.fullname} delete photo #{self.title}"}
    end
end
