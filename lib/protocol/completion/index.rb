# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

module Protocol
	module Completion
		# The argument index used to request command-line completion.
		module Index
			VARIABLE = "COMPLETION_INDEX"
			
			def self.extract(environment = ENV)
				if value = environment.delete(VARIABLE)
					Integer(value) unless value.empty?
				end
			end
		end
	end
end
