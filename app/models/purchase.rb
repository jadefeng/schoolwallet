class Purchase < ActiveRecord::Base
	belongs_to :child
	belongs_to :good
end
