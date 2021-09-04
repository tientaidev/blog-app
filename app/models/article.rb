class Article < ApplicationRecord
  has_many :comments

  include Visible

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  enum status: %i[PUBLIC ARCHIVED]

  def archive?
    status == 'ARCHIVED'
  end
end
