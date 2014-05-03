module Aura
	module Model
		# Represents a block in a particular chain
		class ChainBlock < ActiveRecord::Base
			self.table_name = 'chain_summary'
			
			# Blatantly copied from bitcoin-abe and translated to Ruby
			def difficulty
				shift = 8 * (((block_nBits >> 24) & 0xff) - 3)
				bits = block_nBits & 0x7fffff
				sign = block_nBits & 0x800000 ? 1 : -1
				target = sign * (shift >= 0 ? bits << shift : bits >> -shift)
				return ((1 << 224) - 1) * 1000 / (target + 1) / 1000.0
			end
			
			#Returns ISO 8601 formatted timestamp for this block
			def time
				DateTime.strptime(block_nTime.to_s, "%s").to_s
			end
			
			def transactions
				[]
			end
		end
	end
end
