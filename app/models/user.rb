class User < ApplicationRecord
    has_many :guides
    def to_param
        username
    end
end
