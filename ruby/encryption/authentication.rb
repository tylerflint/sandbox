require 'digest/sha1'

def secure_digest(*args)
  Digest::SHA1.hexdigest(args.flatten.join('--'))
end

def make_token
  secure_digest(Time.now, (1..10).map{ rand.to_s })
end

def encrypt(password, salt, digest)
  password_digest(password, salt, digest)
end

def password_digest(password, salt, digest)
  # digest = make_token
  10.times do
    digest = secure_digest(digest, salt, password, digest)
  end
  digest
end

# puts "original pass: password"
# puts "encrypted: #{encrypt("password")}"

digest = 'aa910feeb2b7446ca367afe96c3de0f4842e6787'
salt   = 'd7dc35014c78099c302dca6530b0442695c4fcb9'

# puts "original pass: password"
# puts "encrypted: #{encrypt("password", salt, digest)}"

puts digest.length
puts salt.length