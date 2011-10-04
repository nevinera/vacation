class Company < ActiveRecord::Base
  has_many :users
  belongs_to :manager, :class_name => "User"
end
