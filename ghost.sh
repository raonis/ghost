# /bin/bash
#
#
#
#
#
DATABASE=ghost

case $1 in
  "start")
    docker-compose up -d 
    sleep 30
    CONTAINER=`docker ps | grep ghost_db_1 | awk '{print $1}'`
    cat $DATABASE.sql | docker exec -i $CONTAINER /usr/bin/mysql -u root --password='example' $DATABASE ;;
  "stop")
    CONTAINER=`docker ps | grep ghost_db_1 | awk '{print $1}'`
    docker exec $CONTAINER /usr/bin/mysqldump -u root --password='example' $DATABASE > $DATABASE.sql
    docker-compose down ;;
  *) 
  echo "Use start or stop" ;;

esac
