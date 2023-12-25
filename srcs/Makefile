# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sutku <sutku@student.42heilbronn.de>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/19 14:45:54 by sutku             #+#    #+#              #
#    Updated: 2023/12/25 21:45:34 by sutku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sutku <sutku@student.42heilbronn.de>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/19 14:45:54 by sutku             #+#    #+#              #
#    Updated: 2023/12/24 17:32:07 by sutku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = ./docker-compose.yml

DB_VOLUME = /home/sutku/data/mysql
WP_VOLUME = /home/sutku/data/wordpress

all: run

run:
	@mkdir -p $(DB_VOLUME)
	@mkdir -p $(WP_VOLUME)
	@docker-compose -f $(COMPOSE_FILE) up -d --build 

rm-volume:
	@sudo rm -rf $(DB_VOLUME)
	@sudo rm -rf $(WP_VOLUME)

prune:
	@docker container prune
	@docker image prune -a
	@docker volume prune

down:
	docker-compose -f $(COMPOSE_FILE) down

fclean:
	@sudo make rm-volume
	@sudo make prune
	@sudo docker volume rm mariadb wordpress


re: down fclean run
	
.PHONY: all run rm-volume prune fclean re down