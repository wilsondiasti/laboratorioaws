#!/bin/bash

Todos="elasticsearch logstash kibana auditbeat filebeat functionbeat heartbeat metricbeat packetbeat"
elasticsearch="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.0-linux-x86_64.tar.gz"
logstash="https://artifacts.elastic.co/downloads/logstash/logstash-7.10.0-linux-x86_64.tar.gz"
kibana="https://artifacts.elastic.co/downloads/kibana/kibana-7.10.0-linux-x86_64.tar.gz"
auditbeat="https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.10.0-linux-x86_64.tar.gz"
filebeat="https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.10.0-linux-x86_64.tar.gz"
functionbeat="https://artifacts.elastic.co/downloads/beats/functionbeat/functionbeat-7.10.0-linux-x86_64.tar.gz"
heartbeat="https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.10.0-linux-x86_64.tar.gz"
metricbeat="https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.10.0-linux-x86_64.tar.gz"
packetbeat="https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.10.0-linux-x86_64.tar.gz"

situacao1(){
        echo -n "[$Binario]" && wget -q https://artifacts.elastic.co/downloads/$Binario/$Binario-7.10.0-linux-x86_64.tar.gz && echo " => Download OK" || echo " => Download com ERRO"
        echo
}

situacao2(){
        echo -n "[$Binario]" && wget -q https://artifacts.elastic.co/downloads/beats/$Binario/$Binario-7.10.0-linux-x86_64.tar.gz && echo " => Download OK" || echo " => Download com ERRO"
        echo
}

master(){
while true
do
        clear
        echo -e "\n [Download automatizado dos Beats Elastic] \n"
        for I in $Todos ; do echo -e " [$I]" ; done
        echo
        read -p " Informe o nome do Beat que queira baixar ou
  digite 'todos' para baixar todos os beats relacionados na lista acima: " Binario
        echo $Todos todos | grep $Binario > /dev/null
        if [ $? -eq 0 ] ; then
                echo -e "\n Você escolheu $Binario! Baixando ...\n"
                if [[ "$Binario" =~ "todos" ]] ; then
                  echo -n "[elasticsearch]"     && wget -q $elasticsearch       && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[logstash]"          && wget -q $logstash            && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[kibana]"            && wget -q $kibana              && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[auditbeat]"         && wget -q $auditbeat           && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[filebeat]"          && wget -q $filebeat            && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[functionbeat]"      && wget -q $functionbeat        && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[heartbeat]"         && wget -q $heartbeat           && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[metricbeat]"        && wget -q $metricbeat          && echo " => Download OK" || echo " => Download com ERRO"
                  echo -n "[packetbeat]"        && wget -q $packetbeat          && echo " => Download OK" || echo " => Download com ERRO"
                  exit
                elif [[ "$Binario" =~ "elasticsearch" || "$Binario" =~ "logstash" || "$Binario" =~ "kibana" ]] ; then
                  situacao1 $Binario
                  exit
                else
                  situacao2 $Binario
                  exit
                fi
        else
                echo -e "\n ERRO. Digite um nome válido." ; sleep 2
        fi
done
}
master