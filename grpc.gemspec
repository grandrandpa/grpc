# -*- ruby -*-
# encoding: utf-8
$LOAD_PATH.push File.expand_path('../src/ruby/lib', __FILE__)
require 'grpc/version'

Gem::Specification.new do |s|
  s.name          = 'grpc'
  s.version       = GRPC::VERSION
  s.authors       = ['gRPC Authors']
  s.email         = 'temiola@google.com'
  s.homepage      = 'https://github.com/google/grpc/tree/master/src/ruby'
  s.summary       = 'GRPC system in Ruby'
  s.description   = 'Send RPCs from Ruby using GRPC'
  s.license       = 'BSD-3-Clause'

  s.required_ruby_version = '>= 2.0.0'
  s.requirements << 'libgrpc ~> 0.11.0 needs to be installed'

  s.files = %w( Rakefile Makefile )
  s.files += %w( etc/roots.pem )
  s.files += Dir.glob('src/ruby/bin/**/*')
  s.files += Dir.glob('src/ruby/ext/**/*')
  s.files += Dir.glob('src/ruby/lib/**/*')
  s.files += Dir.glob('src/ruby/pb/**/*')
  s.files += Dir.glob('include/grpc/**/*')
  s.files += Dir.glob('src/core/**/*')
  s.test_files = Dir.glob('src/ruby/spec/**/*')
  s.bindir = 'src/ruby/bin'
  %w(math noproto).each do |b|
    s.executables += ["#{b}_client.rb", "#{b}_server.rb"]
  end
  s.executables += %w(grpc_ruby_interop_client grpc_ruby_interop_server)
  s.require_paths = %w( src/ruby/bin src/ruby/lib src/ruby/pb )
  s.platform      = Gem::Platform::RUBY

  s.add_dependency 'google-protobuf', '~> 3.0.0alpha.1.1'
  s.add_dependency 'googleauth', '~> 0.4'

  s.add_development_dependency 'bundler', '~> 1.9'
  s.add_development_dependency 'logging', '~> 2.0'
  s.add_development_dependency 'simplecov', '~> 0.9'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'rake-compiler', '~> 0.9'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rubocop', '~> 0.30.0'
  s.add_development_dependency 'signet', '~>0.6.0'

  s.extensions = %w(src/ruby/ext/grpc/extconf.rb)
end
