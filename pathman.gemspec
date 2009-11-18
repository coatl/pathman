# -*- encoding: utf-8 -*-

require "#{File.dirname(__FILE__)}/lib/pathman/version"
Pathman::Description=open("README.txt"){|f| f.read[/^==+ ?description[^\n]*?\n *\n?(.*?\n *\n.*?)\n *\n/im,1] }
Pathman::Latest_changes="###"+open("History.txt"){|f| f.read[/\A===(.*?)(?====)/m,1] }

Gem::Specification.new do |s|
  s.name = "pathman"
  s.version = Pathman::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Caleb Clausen"]
  s.date = Time.now.strftime("%Y-%m-%d")
  s.email = %q{caleb (at) inforadical (dot) net}
  s.extra_rdoc_files = ["README.txt", "LICENSE"]
  s.files = `git ls-files`.split
  s.has_rdoc = true
  s.homepage = %{http://github.com/coatl/pathman}
  s.rdoc_options = %w[--inline-source --main README.txt]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pathman}
  s.rubygems_version = %q{1.3.0}
  s.test_files = %w[test/test_all.rb]
  s.summary = "Pathman assembles groups of projects into collections so they can be used together smoothly."
  s.description = Pathman::Description
end
