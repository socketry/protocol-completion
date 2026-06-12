# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

require "completion"

describe Completion::Index do
	it "gets the completion index from the environment" do
		environment = {"COMPLETION_INDEX" => "2"}
		
		expect(subject.get(environment)).to be == 2
		expect(environment).to be == {"COMPLETION_INDEX" => "2"}
	end
	
	it "extracts the completion index from the environment" do
		environment = {"COMPLETION_INDEX" => "2"}
		
		expect(subject.extract(environment)).to be == 2
		expect(environment).to be == {}
	end
end
