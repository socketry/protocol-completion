# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

require "completion"
require "sus/fixtures/temporary_directory_context"

describe Completion::Shell do
	include Sus::Fixtures::TemporaryDirectoryContext
	
	it "generates shell completion scripts" do
		expect(subject.script(shell: :bash, executable: "samovar")).to be(:include?, "COMPLETION_INDEX")
		expect(subject.script(shell: :zsh, executable: "samovar")).to be(:include?, "#compdef samovar")
		expect(subject.script(shell: :fish, executable: "samovar")).to be(:include?, "complete -c samovar")
	end
	
	it "uses the basename when registering completion scripts" do
		zsh = subject.script(shell: :zsh, executable: "./samovar")
		bash = subject.script(shell: :bash, executable: "./samovar")
		fish = subject.script(shell: :fish, executable: "./samovar")
		
		expect(zsh).to be(:include?, "#compdef samovar")
		expect(zsh).to be(:include?, "_samovar_completion()")
		expect(bash).to be(:include?, "complete -F _samovar_completion samovar")
		expect(fish).to be(:include?, "complete -c samovar")
	end
	
	it "uses the completed command word as the executable" do
		bash = subject.script(shell: :bash, executable: "samovar")
		zsh = subject.script(shell: :zsh, executable: "samovar")
		fish = subject.script(shell: :fish, executable: "samovar")
		
		expect(bash).to be(:include?, 'local command="${COMP_WORDS[0]}"')
		expect(bash).to be(:include?, 'COMPLETION_INDEX="$index" "$command" "${argv[@]}"')
		expect(zsh).to be(:include?, 'COMPLETION_INDEX="$index" "$command" "${argv[@]}"')
		expect(fish).to be(:include?, "set -l command $argv[1]")
		expect(fish).to be(:include?, "$command $argv")
	end
	
	it "prints candidates as TSV" do
		output = StringIO.new
		result = Completion::Result.new([
			Completion::Candidate.new(value: "serve", description: "Run the server.", type: :command)
		])
		
		result.print(output)
		
		expect(output.string).to be == "serve\tRun the server.\tcommand\n"
	end
	
	it "exposes candidates" do
		candidate = Completion::Candidate.new(value: "serve")
		result = Completion::Result.new([candidate])
		
		expect(result.candidates).to be == [candidate]
	end
end
