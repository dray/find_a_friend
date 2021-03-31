class Friendship < ApplicationRecord
    belongs_to :member
    belongs_to :friend, class_name: "Member"
  
    after_create :create_inverse, unless: :has_inverse?
  
    private
  
    def create_inverse
      self.class.create(inverse_options)
    end
  
    def has_inverse?
      self.class.exists?(inverse_options)
    end
  
    def inverse_options
      { member_id: friend_id, friend_id: member_id }
    end
  end
  