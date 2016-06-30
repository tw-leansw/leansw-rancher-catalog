bash -c 'export EUREKA_INSTANCE_HOSTNAME=$(curl http://rancher-metadata/latest/self/container/primary_ip) &&  echo $EUREKA_INSTANCE_HOSTNAME &&  PROFILE=${ACTIVE_PROFILE:=docker} &&  java -Xmx512m -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=n -Djava.security.egd=file:/dev/./urandom -jar /deliflow-webapp.jar --eureka.instance.preferIpAddress=false  --spring.profiles.active=$PROFILE   --eureka.instance.hostname="$EUREKA_INSTANCE_HOSTNAME"'



curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{}' \
'http://deliflow-server:8080/v1/projects/1a5/services/1s58/?action=upgrade'
