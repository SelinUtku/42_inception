# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sutku <sutku@student.42heilbronn.de>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/19 14:45:54 by sutku             #+#    #+#              #
#    Updated: 2023/12/19 20:47:30 by sutku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = ./docker-compose.yml

DB_VOLUME = ./data/mysql
WP_VOLUME = ./data/wordpress

all: run

run:
	@mkdir -p $(DB_VOLUME)
	@mkdir -p $(WP_VOLUME)
	@docker compose -f $(COMPOSE_FILE) up -d --build 

rm-volume:
	@sudo rm -rf $(DB_VOLUME)
	@sudo rm -rf $(WP_VOLUME)

prune:
	@docker container prune
	@docker image prune -a
	@docker volume prune

fclean:
	docker compose -f $(COMPOSE_FILE) down
	# @sudo rm -rf $(DB_VOLUME)
	# @sudo rm -rf $(WP_VOLUME)
	# @sudo docker image rm -f srcs_nginx
	# @sudo docker image rm -f srcs_wordpress
	# @sudo docker image rm -f srcs_mariadb


re: fclean run
	
.PHONY: all run rm-volume prune fclean re