Shirt.all.each do |shirt|
  shirt.image.recreate_versions!
end
