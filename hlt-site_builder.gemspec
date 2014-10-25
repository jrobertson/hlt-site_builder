Gem::Specification.new do |s|
  s.name = 'hlt-site_builder'
  s.version = '0.3.0'
  s.summary = 'hlt-site_builder'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_runtime_dependency('hlt', '~> 0.2', '>=0.2.13')
  s.add_runtime_dependency('dynarex', '~> 1.2', '>=1.2.94')
  s.add_runtime_dependency('html-to-css', '~> 0.1', '>=0.1.7')
  s.signing_key = '../privatekeys/hlt-site_builder.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/hlt-site_builder'
  s.required_ruby_version = '>= 2.1.3'
end
