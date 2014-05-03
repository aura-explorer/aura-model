module Aura
	module Model
		# Represents a block in a particular chain
		class ChainBlock < ActiveRecord::Base
			self.table_name = 'chain_summary'
		end
	end
end
