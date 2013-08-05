require 'formula'

class CouchdbLuceneBuild < Formula
  homepage 'https://github.com/ifad/couchdb-lucene-build'
  url 'https://github.com/ifad/couchdb-lucene-build/archive/master.tar.gz'
  sha1 '0ede6ffe6386788c756150b5bcba7ff64c91f6e9'
  version '0.0.1'

  depends_on 'couchdb'

  def install
    bin.install Dir[ "bin/*" ]
    lib.install Dir[ 'lib/*' ]
  end

  plist_options :manual => "#{HOMEBREW_PREFIX}/opt/couchdb-lucene-build/bin/run"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"
      "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>EnvironmentVariables</key>
        <dict>
          <key>HOME</key>
          <string>~</string>
          <key>DYLD_LIBRARY_PATH</key>
          <string>/opt/local/lib:$DYLD_LIBRARY_PATH</string>
        </dict>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_prefix}/bin/run</string>
        </array>
        <key>StandardOutPath</key>
        <string>/dev/null</string>
        <key>StandardErrorPath</key>
        <string>/dev/null</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
      </dict>
    </plist>
    EOS
  end

end
