json.extract! file_source, :id, :file_name, :file_type, :file_size, :file_md5, :file_path, :created_at, :updated_at
json.url file_source_url(file_source, format: :json)