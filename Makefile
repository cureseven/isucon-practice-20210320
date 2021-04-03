gogo:
	sudo systemctl stop nginx
	sudo systemctl stop isutrain-go.service
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/nginx/error.log
	sudo systemctl start isutrain-go.service
	sudo systemctl start nginx
	sleep 6
	$(MAKE) bench

bench:
	ssh ubuntu@18.181.154.178 "make -C /home/admin/isucon bench"

kataribe:
	cd  ../ && sudo cat /var/log/nginx/access.log | ./kataribe

