
up:
	docker-compose up -d

down:
	docker-compose down -v

ssh:
	docker exec -it internal-utils-postgres /bin/bash

install:
	docker exec internal-utils-postgres /sql-bin/install.sh

  