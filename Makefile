include .env
MYSQL_DUMPS_DIR=./backups

update:
	sudo docker-compose down -v
	sudo docker image rm jetbrains/teamcity-server
	sudo docker-compose up -d

logs:
	sudo docker-compose logs -f

start:
	sudo docker-compose up -d

stop:
	sudo docker-compose down -v

restart:
	sudo docker-compose down -v
	sudo docker-compose up -d

ps:
	sudo docker-compose ps

create-database:
	sudo docker exec -i mariadb mysql -u${MARIADB_ROOT_USER} -p${MARIADB_ROOT_PASSWORD} -e "create database teamcity;"

backup:
	@mkdir -p $(MYSQL_DUMPS_DIR)
	sudo chmod -R 777 $(MYSQL_DUMPS_DIR)
	docker exec mysql mysqldump -u${MARIADB_ROOT_USER} -p${MARIADB_ROOT_PASSWORD} teamcity --single-transaction --quick --lock-tables=false | sudo zip > $(MYSQL_DUMPS_DIR)/`date "+%Y%m%d-%H%M-%Z"`-teamcity.zip
