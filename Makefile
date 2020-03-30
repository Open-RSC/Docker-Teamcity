upgrade:
	sudo docker-compose down -v
	sudo docker image rm nginx
	sudo docker image rm jetbrains/teamcity-server
	sudo docker image rm jetbrains/teamcity-agent
	sudo docker image rm jetbrains/teamcity-minimal-agent
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