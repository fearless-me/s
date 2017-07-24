openssl.exe genrsa -out rsa_private_key_pkcs1.pem 1024
ping -n 5 127.1 > nul
openssl.exe pkcs8 -topk8 -inform PEM -in rsa_private_key_pkcs1.pem -outform PEM -nocrypt -out rsa_private_key_pkcs8.pem
ping -n 5 127.1 > nul
openssl.exe rsa -in rsa_private_key_pkcs8.pem -pubout -out rsa_public_key.pem