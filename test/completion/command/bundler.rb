# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

require "completion"

describe Completion::Command::Bundler do
	it "unwraps bundle exec command lines" do
		invocation = subject.unwrap(["bundle", "exec", "falcon", "serve", "--port"], 3)
		
		expect(invocation.runner).to be == ["bundle", "exec", "falcon"]
		expect(invocation.arguments).to be == ["serve", "--port"]
		expect(invocation.index).to be == 1
	end
	
	it "ignores non-bundler command lines" do
		expect(subject.unwrap(["falcon", "serve"], 1)).to be_nil
	end
end
