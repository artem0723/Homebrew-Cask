cask :v1 => 'lyx' do
  version '2.1.2.2'
  sha256 '82047ac2aec85f422d94e3f3ea88ffb911264499c09fe9eee341f10537495990'

  url "ftp://ftp.lyx.org/pub/lyx/bin/#{version}/LyX-#{version}+qt4-x86_64-cocoa.dmg"
  gpg "#{url}.sig",
      :key_id => 'de7a44fac7fb382d'
  name 'LyX'
  homepage 'http://www.lyx.org'
  license :unknown    # todo: change license and remove this comment; ':unknown' is a machine-generated placeholder

  app 'LyX.app'
end
