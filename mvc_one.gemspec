# frozen_string_literal: true

require_relative "lib/mvc_one/version"

Gem::Specification.new do |spec|
  spec.name = "mvc_one"
  spec.version = MvcOne::VERSION
  spec.authors = ["Evgenii Sendziuk"]
  spec.email = ["evgeniisendziuk@taxdome.com"]

  spec.summary = "Simple mvc framework, not for production purposes"
  spec.description = "Simple mvc framework, not for production purposes"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"


  spec.metadata["source_code_uri"] = "https://github.com/senzpo/mvc_one.git"
  spec.metadata["changelog_uri"] = "https://github.com/senzpo/mvc_one.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "thor"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
