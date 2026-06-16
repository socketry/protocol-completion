# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

module Protocol
	module Completion
		# A normalized completion invocation.
		Invocation = Struct.new(:runner, :arguments, :index, keyword_init: true)
	end
end
