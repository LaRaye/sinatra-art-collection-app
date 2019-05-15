class User < ActiveRecord::Base
  has_many :paintings
  has_many :sculptures
end
