cask 'domino-cli' do
  version :latest
  sha256 :no_check

  url 'https://app.dominodatalab.com/assets/cli/default/domino-install-mac.dmg'
  name 'Domino Client'
  homepage 'https://www.dominodatalab.com/'
  license :unknown

  auto_updates true

  installer script: 'Domino Installer.app/Contents/MacOS/JavaApplicationStub',
            args:   %w[-q -c -overwrite],
            sudo:   true
  binary '/Applications/domino/domino'

  uninstall script: {
                      executable: '/Applications/domino/Domino Uninstaller.app/Contents/MacOS/JavaApplicationStub',
                      args:       %w[-q -c],
                      sudo:       true,
                    }
end
