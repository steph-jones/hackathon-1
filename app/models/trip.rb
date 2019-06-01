class Trip < ApplicationRecord
    has_many :location, , dependent: :destroy
end
