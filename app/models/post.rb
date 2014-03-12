class Post < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(5) }

  before_save :titleize_title

  validates_presence_of :title, :content

  def slug
    if self.persisted?
      self.title.downcase.parameterize
    else
      nil
    end
  end

  private

  def titleize_title
    self.title = title.titleize
  end
end
