class Category < ApplicationRecord
    has_many :videos
    validates :name, presence: true

    default_scope { where(:is_active => true) }
end
