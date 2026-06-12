# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2026, by Samuel Williams.

require_relative "completion/version"
require_relative "completion/candidate"
require_relative "completion/result"
require_relative "completion/invocation"
require_relative "completion/index"
require_relative "completion/shell"
require_relative "completion/shell/bash"
require_relative "completion/shell/fish"
require_relative "completion/shell/zsh"
require_relative "completion/command/bundler"

module Completion
end
