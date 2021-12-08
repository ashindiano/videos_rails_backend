class Category < ApplicationRecord
    has_many :videos
    default_scope { where(:is_active => true) }
end
