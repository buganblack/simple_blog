class Blog < ActiveRecord::Base
  has_attached_file :eye_catch, :styles => { :small => "150x150>" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/blog_images/:id/:style/:basename.:extension"

  validates_attachment_content_type :eye_catch, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :eye_catch
  validates :title, :contents, presence: true

end
