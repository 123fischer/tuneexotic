class Request < ApplicationRecord
  belongs_to :user
  belongs_to :tune
end
