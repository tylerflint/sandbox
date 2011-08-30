#!/usr/bin/env ruby -wKU

raw = %{From: WordPress <wordpress@drockna.pagodabox.com>
Message-ID: <949f36be7cc32cf6a79f51f8a12a364b@drockna.pagodabox.com>
X-Priority: 3
X-Mailer: PHPMailer (phpmailer.sourceforge.net) [version 2.0.4]
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"

Username: tommas
Password: lyon
http://drockna.pagodabox.com/wp-login.php
}

parts = raw.split("\n\n")

puts parts[0]