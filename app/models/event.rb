class Event < ApplicationRecord
    has_one :creator, class_name: "User", foreign_key: "creator_id"
end
