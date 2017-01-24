    # t.integer  "user_id",      limit: 4
    # t.integer  "file_id",      limit: 4
    # t.integer  "directory_id", limit: 4
    # t.string   "full_name",    limit: 255
    # t.string   "short_name",   limit: 255
    # t.string   "cover",        limit: 255
class UserFile < ActiveRecord::Base

  has_one :torrent, class_name:'FileSource', foreign_key:'id', primary_key:'file_id'
  belongs_to :user, foreign_key:'user_id'
  belongs_to :directory, class_name:'UserDirectory', foreign_key:'directory_id'

  validates_presence_of :full_name
  validates_presence_of :short_name

  self.per_page = 10
end
