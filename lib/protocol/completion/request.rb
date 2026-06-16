# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

module Protocol
	module Completion
		# A completion request extracted from command arguments and the environment.
		Request = Struct.new(:arguments, :index, keyword_init: true) do
			def self.extract(arguments = ARGV, environment: ENV)
				if index = Index.extract(environment)
					self.new(arguments: arguments, index: index)
				end
			end
		end
	end
end
