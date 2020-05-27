class Favorite < ApplicationRecord
  belongs_to :tune
  belongs_to :user
end
