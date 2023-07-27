# lib/tasks/update_image_versions.rake

# rake images:update_versions
namespace :images do
    desc 'Update image versions for existing images'
    task :update_versions => :environment do

        User.find_each do |user|
            user.avatar.recreate_versions! if user.avatar.present?
        end
        Photo.find_each do |photo|
            photo.source.recreate_versions! if photo.source.present?
        end
        Album.find_each do |album|
            album.list_image.each do |image|
                image.recreate_versions! if image.present?
            end
        end
    puts 'Updated versions for existing images.'
    end
end