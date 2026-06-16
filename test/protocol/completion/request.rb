# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

require "protocol/completion"

describe Protocol::Completion::Request do
	it "extracts a completion request from arguments and environment" do
		arguments = ["serve", "--port"]
		environment = {"COMPLETION_INDEX" => "1"}
		
		request = subject.extract(arguments, environment: environment)
		
		expect(request.arguments).to be_equal(arguments)
		expect(request.index).to be == 1
		expect(environment).to be == {}
	end
	
	it "returns nil when no completion request is present" do
		environment = {}
		
		expect(subject.extract(["serve"], environment: environment)).to be_nil
		expect(environment).to be == {}
	end
end
