Gem::Specification.new do |spec|
  spec.name          = 'anki_generator'
  spec.version       = '0.1.0'
  spec.authors       = ['Ceb']
  spec.email         = ['ceeb.developer@gmail.com']
  spec.summary       = 'A tool to generate Anki .apkg files from YAML definitions.'
  spec.description   = 'AnkiGenerator is a command-line tool to create Anki decks in .apkg format from YAML files.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb', 'bin/*']
  spec.bindir        = 'bin'
  spec.executables   = ['anki_generator']
  spec.require_paths = ['lib']

  spec.add_dependency 'anki2', '~> 0.1.2'
  spec.add_dependency 'minitest', '~> 5.25.1'
  spec.add_dependency 'thor', '~> 1.2'
end
