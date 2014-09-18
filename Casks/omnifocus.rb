class Omnifocus < Cask
  version :latest
  sha256 :no_check

  url 'http://www.omnigroup.com/download/latest/omnifocus'
  homepage 'http://www.omnigroup.com/products/omnifocus/'

  app 'OmniFocus.app'
  zap :delete => [
                  '~/Library/Application Support/OmniFocus/Plug-Ins',
                  '~/Library/Application Support/OmniFocus/Themes',
                  '~/Library/Preferences/com.omnigroup.OmniFocus.plist',
                 ]
end
