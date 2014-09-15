class Gingr < Cask
  version '1.0.1'
  sha256 '29a705836ae11114f4e9aa787c885e1960861cc9119c23afda22ea8618322498'

  url "https://github.com/marbl/gingr/releases/download/v#{version}/gingr-OSX64-v1.0.1.zip"
  homepage 'http://harvest.readthedocs.org/en/latest/content/gingr.html'

  app 'gingr-OSX64.app', :target => 'Gingr.app'
end
