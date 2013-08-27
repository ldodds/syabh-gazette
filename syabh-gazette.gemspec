PKG_FILES = %w( README.md Rakefile ) + 
  Dir.glob("{bin,tests,lib}/**/*")

RDOC_OPTS = ['--quiet', '--title', 'SYABH Gazette Reference', '--main', 'README']

Gem::Specification.new do |s|
  s.name = "syabh-gazette"
  s.version = "0.0.1"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.9.3"    
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.md"]
  s.rdoc_options = RDOC_OPTS
  s.summary = "SYABH Gazette Generated"
  s.description = s.summary
  s.author = "Leigh Dodds"
  s.email = 'leigh@ldodds.com'
  s.homepage = 'http://github.com/ldodds/syabh-gazette'
  s.files = PKG_FILES
  s.require_path = "lib" 
  s.bindir = "bin"
  s.executables = ["syabh-gazette"]
  s.test_file = "tests/ts_syabh_gazette.rb"
#  s.add_dependency("json")
#  s.add_dependency("redcarpet")
#  s.add_development_dependency("fakefs")
end
