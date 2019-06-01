class Trip < ApplicationRecord
    belongs_to :user
    has_many :location, dependent: :destroy
end
