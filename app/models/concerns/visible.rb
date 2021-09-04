module Visible

  extend ActiveSupport::Concern

  def archived?
    status == 'ARCHIVED'
  end

  VALID_STATUSES = %w[PUBLIC, PRIVATE, ARCHIVED]

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end
end