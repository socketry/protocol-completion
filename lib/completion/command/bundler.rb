# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

module Completion
	module Command
		# Helpers for completing commands wrapped by Bundler.
		module Bundler
			def self.unwrap(words, index)
				return nil unless words[0] == "bundle"
				return nil unless words[1] == "exec"
				return nil unless words[2]
				
				Invocation.new(
					runner: words.take(3),
					arguments: words.drop(3),
					index: index - 2,
				)
			end
		end
	end
end
