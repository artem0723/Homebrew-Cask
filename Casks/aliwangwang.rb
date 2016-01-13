cask 'aliwangwang' do
  version '3.5.0-4428'
  sha256 'b1ea86f576833084c17ba1d6d66dc31e7941e239cc4474fe9d61e473169c434e'

  # alicdn.com is the official download host per the vendor homepage
  url "https://dbison.alicdn.com/updates/macww-nosandbox-#{version}.dmg"
  appcast 'https://update.labs.etao.com/macww/updates.xml',
          :checkpoint => '318225be4d39b03e47ccbb7c53e31d6bbe704ccce5c33daf11d15d4fa1582ed3'
  name 'Ali Wangwang'
  homepage 'https://wangwang.taobao.com'
  license :unknown # TODO: change license and remove this comment; ':unknown' is a machine-generated placeholder

  app 'AliWangwang.app'

  uninstall :quit => 'com.taobao.aliwangwang'

  zap :delete => [
                   '~/Library/Caches/com.taobao.aliwangwang',
                   '~/Library/Containers/com.taobao.aliwangwang',
                   '~/Library/Internet Plug-Ins/WangwangPlugin.plugin',
                   '~/Library/Preferences/com.taobao.aliwangwang.plist',
                   '~/Library/Saved Application State/com.taobao.aliwangwang.savedState',
                 ]
end
