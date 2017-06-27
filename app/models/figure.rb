class Figure < ActiveRecord::Base
  has_many :titles
  has_many :landmarks
end
