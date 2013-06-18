# script used to move all existing files to new carrierwave friend location
# remove the mounted image! It requires the file name
require 'fileutils'
mounted_as = 'image'

Shirt.all.each do |shirt|
  new_directory = "#{Rails.root}/public/uploads/#{shirt.class.to_s.underscore}/#{mounted_as}/#{shirt.id}"
  FileUtils.mkdir_p new_directory
  FileUtils.cp(Rails.root.join('app', 'assets', 'images', shirt.image), "#{new_directory}/#{shirt.image}")
end

