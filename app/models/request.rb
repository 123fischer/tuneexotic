class Request < ApplicationRecord
  belongs_to :user
  belongs_to :tune
end
class Request < ApplicationRecord
  belongs_to :user
  belongs_to :tune

  def accepted?
    status == "accepted"
  end
end
