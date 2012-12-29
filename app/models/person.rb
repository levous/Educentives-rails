class Person < ActiveRecord::Base
  has_one :student
  has_one :user
end
