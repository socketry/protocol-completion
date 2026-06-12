# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

module Completion
	# A collection of completion candidates.
	class Result
		include Enumerable
		
		def initialize(candidates = [])
			@candidates = candidates
		end
		
		attr :candidates
		
		def each(&block)
			@candidates.each(&block)
		end
		
		def empty?
			@candidates.empty?
		end
		
		def +(other)
			self.class.new(@candidates + other.candidates)
		end
		
		def print(output = $stdout)
			each do |candidate|
				output.puts [
					escape(candidate.value),
					escape(candidate.description),
					escape(candidate.type),
				].join("\t")
			end
		end
		
		private
		
		def escape(value)
			value.to_s.gsub(/[\t\r\n]/, " ")
		end
	end
end
