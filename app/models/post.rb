class Post < ActiveRecord::Base
  attr_accessible :attachment, :message, :title, :phase_id, :project_id
  belongs_to :project
  belongs_to :phase

  default_scope order('created_at DESC')

  mount_uploader :attachment, ImageUploader

  def snippet
    message_size = 90 + rand(150)
    snippet = self.message.truncate(message_size, :separator => ' ')
    return snippet
  end

end
