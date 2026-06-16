# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

require "protocol/completion"

describe Protocol::Completion::Index do
	it "extracts the completion index from the environment" do
		environment = {"COMPLETION_INDEX" => "2"}
		
		expect(subject.extract(environment)).to be == 2
		expect(environment).to be == {}
	end
end
