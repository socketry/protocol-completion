# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

require "protocol/completion"

describe Protocol::Completion::Request do
	it "extracts a completion request from arguments" do
		arguments = ["serve", "--port", ""]
		
		request = subject.extract(arguments)
		
		expect(request.arguments).to be == arguments
	end
	
	it "coerces arguments to strings" do
		request = subject.extract([:serve])
		
		expect(request.arguments).to be == ["serve"]
	end
	
	it "treats empty arguments as an empty current token" do
		request = subject.extract([])
		
		expect(request.arguments).to be == [""]
	end
end
