hpServeAuth -port 8080 -key sever.key -pem fullchain.cer >/dev/null 2>hp8801.log
nohup hpServeAuth -port 8080 -key server.key -pem fullchain.cer >/dev/null 2>hp8801.log &
