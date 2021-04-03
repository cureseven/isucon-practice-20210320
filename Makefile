gogo:
	sudo systemctl stop nginx
	#sudo systemctl stop isutrain-go.service
	sudo systemctl stop isutrain-go-2.service
	ssh isucon9-final-c "sudo systemctl stop mysql"
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/nginx/error.log
	$(MAKE) build
	ssh isucon9-final-c "sudo systemctl start mysql "
	#sudo systemctl start isutrain-go.service
	sudo systemctl start isutrain-go-2.service
	sudo systemctl start nginx
	sleep 6
	$(MAKE) bench
build:
	 go build -o bin/main  isutrain/webapp/go/main.go isutrain/webapp/go/utils.go

bench:
	ssh ubuntu@13.113.182.64 "make -C /home/admin/isucon bench"

kataribe:
	cd  ../ && sudo cat /var/log/nginx/access.log | ./kataribe

