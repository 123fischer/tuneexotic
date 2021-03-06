class Tune < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_one_attached :music
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
