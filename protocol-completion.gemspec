# frozen_string_literal: true

require_relative "lib/protocol/completion/version"

Gem::Specification.new do |spec|
	spec.name = "protocol-completion"
	spec.version = Protocol::Completion::VERSION
	
	spec.summary = "A command-line completion protocol."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ["release.cert"]
	spec.signing_key = File.expand_path("~/.gem/release.pem")
	
	spec.homepage = "https://github.com/socketry/protocol-completion"
	
	spec.metadata = {
		"documentation_uri" => "https://socketry.github.io/protocol-completion/",
		"source_code_uri" => "https://github.com/socketry/protocol-completion.git",
	}
	
	spec.files = Dir["{context,lib}/**/*", "*.md", base: __dir__]
	spec.require_paths = ["lib"]
	
	spec.required_ruby_version = ">= 3.3"
end
