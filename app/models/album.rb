class Album < ApplicationRecord

    enum mode: { Public: 0, Private: 1}

    validates :title, length: { maximum: 140 }
    validates :description, length: { maximum: 300 }
    validates :mode, presence: true

    mount_uploaders :list_image, ImageUploader
    serialize :list_image, Array

    belongs_to :user
    has_many :photo_albums
    has_many :photos , through: :photo_albums

    has_many :like_albums, dependent: :destroy
    has_many :liked_by_users, through: :like_albums , source: :user

    after_create_commit do  
        broadcast_append_to :notifications, target: 'list_notification', partial: 'components/notification', locals: {user: self.user, action: "#{self.user.fullname} add new album #{self.title}"}
    end

    after_update_commit do  
        broadcast_append_to :notifications, target: 'list_notification', partial: 'components/notification', locals: {user: self.user, action: "#{self.user.fullname} edit album #{self.title}"}
    end

    after_destroy_commit do  
        broadcast_append_to :notifications, target: 'list_notification', partial: 'components/notification', locals: {user: self.user, action: "#{self.user.fullname} delete album #{self.title}"}
    end
end
