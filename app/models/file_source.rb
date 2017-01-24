    # t.string   "file_name",  limit: 255
    # t.string   "file_type",  limit: 255
    # t.string   "file_size",  limit: 255
    # t.string   "file_md5",   limit: 255
    # t.string   "file_path",  limit: 255
require 'digest'

class FileSource < ActiveRecord::Base

  def self.save_file(file)
    ext = file.original_filename.split('.')[-1]
    name = file_name(25,ext)
    md5 = Digest::MD5.hexdigest(File.read(file.path))
    unless FileSource.find_by_file_md5(md5)
      torrent = FileSource.new
      torrent.file_name = name
      torrent.file_type = ext
      torrent.file_size = file.size
      torrent.file_md5 = md5
      torrent.file_path = "storage/#{ext}/#{name}"
      torrent.save
    end
    torrent = FileSource.find_by_file_md5(md5)
    file_store(file,torrent.file_name,torrent.file_type)
    torrent
  end

  def self.save_avatar(file)
    ext = 'png'
    name = file_name(25,ext)
    md5 = Digest::MD5.hexdigest(file)
    avatar = FileSource.new
    avatar.file_name = name
    avatar.file_type = 'avatar'
    avatar.file_size = file.size
    avatar.file_md5 = md5
    avatar.file_path = "storage/avatar/#{name}"
    avatar.save
    avatar_store_local(file,avatar.file_name,avatar.file_type)
    avatar
  end

  def self.file_store(file,name,directory)
    full_path = file_directory(directory) + name
    unless File.exist?(full_path)
      File.open(full_path, 'wb+') do |item|
        item.write(file.read)
      end
    end
  end

  def self.avatar_store_local(file,name,directory)
    full_path = file_directory(directory) + name
    unless File.exist?(full_path)
      File.open(full_path, 'wb+') do |item|
        item.write(file)
      end
    end
  end

  def self.file_name(length,ext)
    return "#{rand_string(25)}.#{ext}"
  end

  def self.file_directory(directory)
    root_path = "#{Rails.root}/public/storage/" #软链文件 授权 chmod -R 777 uploads
    file_path = root_path + directory + '/'
    FileUtils.mkdir_p(file_path) unless File.exist?(file_path) #如果目录不存在,创建目录
    file_path
  end

  def self.rand_string(length)
    return [*'1'..'9',*'a'..'z',*'A'..'Z'].sample(length.to_i).join('')
  end

end
