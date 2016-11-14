class DocumentUploader < CarrierWave::Uploader::Base
 
  storage :fog
  
  def store_dir
    'documents'
  end

  def extension_white_list
    %w(doc docx pdf xls xlsx ppt pptx csv txt)
  end

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

end