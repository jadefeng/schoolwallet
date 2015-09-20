class Child < ActiveRecord::Base
	belongs_to :user
	has_many :purchases
	has_many :goods, through :purchases
end
