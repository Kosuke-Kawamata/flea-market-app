class ImgUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  # process resize_to_limit(188, 188)      #←これがリサイズするときの指定方法だった！
  # process resize_to_fit(188, 188)      #←これがリサイズするときの指定方法だった！
  process resize_to_fill: [188, 188, "Center"] #←これが出品と相性いいっぽい

  # version :thumb30 do
  #   process resize_to_fit: [30, 30]
  # end
  
  # version :thumb50 do
  #   process resize_to_fit: [50, 50]
  # end

  # version :thumb300 do
  #   process resize_to_fit: [300, 300]
  # end
  # .img.thumb30.url、.img.thumb50.urlで呼び出すことができます。32行目のprocess resize_to がベースの大きさで､version :〜〜〜 do が別のサイズ指定をする方法

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
