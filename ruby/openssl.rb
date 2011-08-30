#!/usr/bin/env ruby

require 'openssl'

key_string = "-----BEGIN RSA PRIVATE KEY-----\nMIIEogIBAAKCAQEA1idQE6Ie7Y9a1T+ZXSxiFo9hGf5gewsocMV5IX0YwwqdGPtH\n7rfiGu5FQhzqCf0pjQbhNF6r93mHYXn5ylI69kTMx4RGOeFWYPmfF46AHwgYkJGS\nCjVWieuDMOxF0hOvBnlIZa8To+yd7TSvhxd1Tr8cajj97NndU9JisWjXPA4jcDQG\n7UJ5OWMLkOc+1CGesgjx7NOCdH92YcR5VkGWPDJQrBZfvCv0ANoWqQcsm/LmgS2V\nhniyUjYPuJXCBNtvQI3s6oYtTXnSVFlROv5b0ugHwFFtYgXvhRke7ZEeNMD/VTIC\nfAmJX3zSE7UHMUKBY9Mv2AI6GckDxbwY5o6UNQIDAQABAoIBAAXqHAoOxi/lb6rI\nEOJD4Ymh+BqRrfR4AGvs6EWGgPKSDnisJ/Zt2a7Iudzzk3snJMiiUgHyQ2mYT6bf\niYiO8NXwXH9+JbpfgNU4z64E34D75kHH43KounUgrgTh4aPFq2XQX7F/PlmepVXx\nyI9AlJrSKGS+ojSyZ6xy+QrRTHB6HowSkgGkuAVxAG7I3xDeltkZaYcA62C3CSg4\nhLE7/15m3EeTf+5B6+IjEaZBU8tR1j2h0CeSSRX5TBleJtuUz6rv2dNkNGwV+DDE\nlRTllKlynbpnAbYCFLCbQbtqPMNdTh9t6IUPHNcH7o6o1IkF4eMMFPmLPhhZFFrM\nwwZTxoECgYEA8R+bJxip4GnM6HV+oW7GPQGXFgV0VgwuKyK/8eqkwtj2MybzFIv5\nw/vxonXyZ7I9iK8hGTQ3uzBldf8UslKKZ4t4c+0vw+uc+ql/WrrTANG4t74J6O+1\nh03PjlcdkAbVaNXTWORH1LRoaXm4Pt4Z9ScbC7+dXxtIHsurOiOJA9ECgYEA4127\n8H1eX11xqhFS2tDlvxTT7WITT0CoJ20sAIZjUTWo7M3eD0DoDhDv1rwi5+XM6Dhw\n74midqvNeoO5CctBlAxG3hUYNLoQSUcrvAUGpPjM/UQVtzhaxlDA46hG1hXdzLSL\npX7qdCcm2oQCjcp4wUkrjM+qNdqyA9O4WxJlVyUCgYA/ixvBPt+t01P7wtL/SgkW\nFLAzTnatIoKcPYkmALcw3iprqo0O0iCdRG0WakzahP9wYO6xDLDPNN7YLMPQhq4Q\nwZGZw1z+Hb591GNKjseChMJQMdW8vEczhA75rP2Oci6VdRxAZdCEPpLxkPE8KB3h\nHFAlVXbslGz6KKRUKv81sQKBgGibD4StqWWm0Ey2e7BAu/MV2gs1PD0SOkspZz02\nlysdzQJmFOxfqGQQVsgs9sJKb+PHU+5hHGYM1RSw1ckzwpAitdgnTGO11xhfrjdq\n+IueDHHZiUQqoVjsflI/cZe9p7YuurEBm0ylVrLiWWpy5OvIhkjaoiz02UH5frAn\n3oghAoGALUm/lEyBSCDXunjaqbi2Lh9qlDP0iv4nYLY8YHZ8K6RWUMwet8mOIQcm\nSAqjlLVyA3u4IQnkAgBzMKS4ptQV8vewgSNv+19Ci5v2OP/HMJPRoGVGbMFp9zGg\nTz8dzn7iHt+T4fcWRfRGPDlSC2mpUnSLFe1a0Clypsbo5FQPfo0=\n-----END RSA PRIVATE KEY-----\n"
key_string2 = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEAsdsbs0PK+dVsZRsRZyxEEAqdkXgY/ktMZ6Hifl8qrez5SfdL\nePm1LVjWXCi8MxEvyeU9Oimtb/5sfFnZ4KtupnBA+UEiwAK5DGYNMutEaGGbR9+O\n8QxK9CUb0sQEN4gUnjmGyU4c89MwFahiNTRMlG0s5nByJUKfkq+GJev0+637ecI+\nEBUhhlw2Jk+N6agFXtrRl38v5XfG+Sb3DfZpxJ8V37hmEG4YlVN3msIoHnWICQsn\nKQ/6pF6fEewsUsDT4eF3snDA2QJ+fqil+4kShcWs3mHRbxRf5wy2wGcWmGHuJWB8\n77gICm8UawKgPdJE0WmSZ17xGv1192w1LNooFwIDAQABAoIBAQClykx4/7Hez57a\nZLAFT9MmbO7SonQR39kaJWJ/UHD1bhg3Zck5vPOxkMVJZUOCCvxUJFe9twoQgsdX\n513dO5DKn4tBjgE5oZAjyaF2HK9I6euYxQF3G3FnQow8HTKdHUGy+Ib3cdQ1SWDi\nX3Mki1rzZQ3cxWbx6rfbQbk38ksMq2QrY9GNKarBqMu0/ccg2BR6v9EsyT9l+zJB\nDvf6X6yqV0qp6q1CaflZCh1R0Ib5O3RZTfhTOhpW6L1VvrZVB+UQj33dBEGriPgi\n34rLRCqIl0RfEXtQbHEVaoPkOMQ2ujuO1OyIjC2yYuiUJsq/BXe+ocnQhZOjL+P+\nCSZMbp8hAoGBAORfDyHzrbPQEAgshaO++3afD3/uUzo4f3gBu3NHXsfwdBf7HKxF\nkEoqKqlS2daCxAmxqDtCWgKJhinua9XGRSXnLj4jBxUtxHMMXMuth8NmoSmK8dUK\np5g8iLviK9VtHXFUoWj88GxD2XaFRlXJz/zqvWU0T0Zs5goRBL0lGuenAoGBAMdf\nhiNPbR+uE+d8CxN2D0rHzh5Ykxt5BbvWiEC6D2D8QiK+PSrEYxGGVBZv1+OK1D8x\nJaRAcZlpqv6AEH1rrvD0I8IVZfrnN8bzIBFjpRYHC0hGz+qvCpyjkLNwPc8V6Tjc\ny9HSHcA/SMFdg6x/lQPtUhNNEd7H+UuiOpRDYcoRAoGBAKMY9MDFvHegD+MWkPcK\nDaOBI9u1BMGe2gKGEi7ZeOqIYxFBaQ/ruooNJVy6bBNUXtehhsmTsJ8BQs0tltwc\n9wOD4LXF5GgOwK9908QvEbfO0yjNL7t8GYeTLAArHi0V+aIX1BMcGkToDCYmNr5M\nHHu/1jWyLy/X1E66Ks0+88EfAoGAFgf+QKSkQF3yISBZ8PqY0gCmTEApcV28PneE\ncvKchHEbtc8j3zf4YpVfcWNGjgRnU9xQdogQhY1hseHg8JsXp9Sypt3KeSFXzopL\nPuCt+3Mn0gLRMvPIzmpcsRd0HRAkx33OoA8B7p6PoZ590HAAvYBaE3vuv5mFeNAi\nfQO9KKECgYBpShOkblJYqb8dgUdkh9NXpggaLYm6DM9dIG4/jfnArRWE/AoXcyW1\nwpyTgOFO4KIb5ka7Ar+9mTqiP3Wu1MLfunt2xLbgugUynIa8RpKWKqNR5ZBZeDrc\np2hzZ+wQfNuKW4AJ0itabvpZ6+4RIGhm2uZAqu9Pf/x30o3vHaxZ1w==\n-----END RSA PRIVATE KEY-----\n"
cert_string = "-----BEGIN CERTIFICATE-----\nMIIE+jCCA+KgAwIBAgIBAjANBgkqhkiG9w0BAQUFADCBoDELMAkGA1UEBhMCVVMx\nFzAVBgNVBAgTDk5vcnRoIENhcm9saW5hMRYwFAYDVQQHEw1GdXF1YXkgVmFyaW5h\nMRgwFgYDVQQKDA9XZWJQb3dlciBEZXNpZ24xFTATBgNVBAsMDFdlYiBTZWN1cml0\neTELMAkGA1UEAwwCQ0ExIjAgBgkqhkiG9w0BCQEME2Vhc3NsQHJ1Ynlmb3JnZS5v\ncmcwHhcNMTEwMzE4MTkyMTA5WhcNMTYwMzE2MTkyMTA5WjCBgjELMAkGA1UEBhMC\nVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExDDAKBgNVBAcTA3JleDELMAkGA1UECgwC\ndHkxDjAMBgNVBAsMBXR5bGVyMRMwEQYDVQQDDApnb29nbGUuY29tMR4wHAYJKoZI\nhvcNAQkBDA90eWxlckB0eWxlci5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQDWJ1AToh7tj1rVP5ldLGIWj2EZ/mB7CyhwxXkhfRjDCp0Y+0fut+Ia\n7kVCHOoJ/SmNBuE0Xqv3eYdhefnKUjr2RMzHhEY54VZg+Z8XjoAfCBiQkZIKNVaJ\n64Mw7EXSE68GeUhlrxOj7J3tNK+HF3VOvxxqOP3s2d1T0mKxaNc8DiNwNAbtQnk5\nYwuQ5z7UIZ6yCPHs04J0f3ZhxHlWQZY8MlCsFl+8K/QA2hapByyb8uaBLZWGeLJS\nNg+4lcIE229Ajezqhi1NedJUWVE6/lvS6AfAUW1iBe+FGR7tkR40wP9VMgJ8CYlf\nfNITtQcxQoFj0y/YAjoZyQPFvBjmjpQ1AgMBAAGjggFZMIIBVTAJBgNVHRMEAjAA\nMAsGA1UdDwQEAwIFoDAdBgNVHQ4EFgQUzX/+R/T+YbHlrJNBuS/GNEwqHwQwEwYD\nVR0lBAwwCgYIKwYBBQUHAwEwNwYJYIZIAYb4QgENBCoWKFJ1YnkvT3BlblNTTC9F\nYVNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNhdGUwgc0GA1UdIwSBxTCBwoAU1CdpIA71\ngBZ19q2d3+NVY2RzyU2hgaakgaMwgaAxCzAJBgNVBAYTAlVTMRcwFQYDVQQIEw5O\nb3J0aCBDYXJvbGluYTEWMBQGA1UEBxMNRnVxdWF5IFZhcmluYTEYMBYGA1UECgwP\nV2ViUG93ZXIgRGVzaWduMRUwEwYDVQQLDAxXZWIgU2VjdXJpdHkxCzAJBgNVBAMM\nAkNBMSIwIAYJKoZIhvcNAQkBDBNlYXNzbEBydWJ5Zm9yZ2Uub3JnggEBMA0GCSqG\nSIb3DQEBBQUAA4IBAQA7ojYJoj8YYuOqOauZzVJnRZcto9r49mwWoGA7u1L5qrWT\naXqtVEkQOE+oRgVtLjd4cl+6Z8OSM2+qulRkFcm/jK6NMttS60IoNWpk4DLEFQmD\nRwa1sLcq+kZkHX1Yk6xswDWFPr1idG/vQMpUhxWDSeSE3CKYwFc43X9SIMLyElJw\nHYFBLz2y0ctlIgDehGkiESANCKaHk2cf6i7yW7VsKl+EBmyZskB4rOlc1gg4WjqI\nwZkUidqKiruC4zopEnzdJM9Po81gieSfcs8ZYwKzM1a2mdagwym80ePiDJqNbabU\nvHB3Ed+D0NTcJ7Tc6JSejaz98CFScId5vhcsm/lz\n-----END CERTIFICATE-----\n"

key = OpenSSL::PKey::RSA.new(key_string)
cert =  OpenSSL::X509::Certificate.new(cert_string)

puts cert.check_private_key(key)

