# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

module Protocol
	module Completion
		# A single completion candidate.
		Candidate = Struct.new(:value, :description, :type, keyword_init: true) do
			def to_s
				value.to_s
			end
		end
	end
end
