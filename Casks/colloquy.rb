cask 'colloquy' do
  version '2.4.3'
  sha256 'b1c54047b9a4aed313e9a4a86073aa5b1215cb8a4ea462c59e7a52d8be6b1a93'

  url "http://colloquy.info/downloads/colloquy-#{version}.zip"
  appcast 'http://colloquy.info/update.php?rss',
          :checkpoint => '0a09b0c260d780f13338a8d7598d8f948cc7c3d35dcdc1a9def84e2e5947e6ee'
  name 'Colloquy'
  homepage 'http://colloquy.info/'
  license :gpl

  app 'Colloquy.app'

  postflight do
    suppress_move_to_applications
  end

  zap :delete => [
                   '~/Library/Application Support/Colloquy',
                   '~/Library/Caches/info.colloquy',
                   '~/Library/Preferences/info.colloquy.plist',
                   '~/Library/Saved Application State/info.colloquy.savedState',
                   '~/Library/Scripts/Applications/Colloquy',
                 ]
end
