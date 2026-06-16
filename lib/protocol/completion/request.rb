# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

module Protocol
	module Completion
		# A completion request extracted from command arguments truncated to the cursor.
		Request = Struct.new(:arguments, keyword_init: true) do
			def self.extract(arguments = ARGV)
				arguments = arguments.collect(&:to_s)
				arguments = [""] if arguments.empty?
				
				self.new(arguments: arguments)
			end
		end
	end
end
