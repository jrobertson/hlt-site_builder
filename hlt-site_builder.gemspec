Gem::Specification.new do |s|
  s.name = 'hlt-site_builder'
  s.version = '0.2.0'
  s.summary = 'hlt-site_builder'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('hlt')
  s.add_dependency('dynarex')
  s.add_dependency('html-to-css')
  s.signing_key = '../privatekeys/hlt-site_builder.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/hlt-site_builder'
end
