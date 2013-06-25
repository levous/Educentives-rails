require 'email_format_validator'

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :person

  attr_accessible :username, :email, :password, :password_confirmation, :person
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  validates_uniqueness_of :email, :username,  :case_sensitive => false
end
