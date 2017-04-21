class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :voteable, polymorphic: true

	def increase
		self.value = self.value + 1
	end

	def decrease
		self.value = self.value - 1
	end
end
