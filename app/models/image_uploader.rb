class ImageUploader < Shrine
  Attacher.validate do
    validate_max_size 20.megabyte, message: 'File size exceeded the limit'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  end
end