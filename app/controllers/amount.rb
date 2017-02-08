class Amount
	attr_accessor :value
	def initialize
		@value = 10_00
	end

	def default
		@value
	end
end