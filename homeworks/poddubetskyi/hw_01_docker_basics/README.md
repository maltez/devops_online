# Простой "веб-сервер" с использованием утилиты netcat
## Ссылки на источники информации
1) Источники кода "сервера": https://fabianlee.org/2016/09/26/ubuntu-simulating-a-web-server-using-netcat/
2) Закрыть соедининение после отправки ответа: https://serverfault.com/a/880289
3) Обработка сигналов в сценарии оболочки: http://linuxcommand.org/lc3_wss0150.php
4) Установка netcat в образ будущего придложения: https://github.com/subfuzion/docker-netcat/blob/master/Dockerfile


## Команды сборки, использования образа, остановки и удаления контейнера

1) Собрать образ:

     ```docker build --rm --file Dockerfile --tag poddubetskyi/hw-01-docker-basics:0.0.1 .```

2) Запустить образ на выполнение:

    ```docker run --name hw-01 --publish 8880:8880 poddubetskyi/hw-01-docker-basics:0.0.1```

3) Убедиться, что в результате работы команды контроля состояния работоспособности контейнера его статус в списке выполняемых контейнеров отображается как "healthy"

   ```docker ps --filter "name=hw-01" --filter "health=healthy"```

4) Протестировать "приложение" из терминала хост-компьютера:

    ```printf "\r\n" | nc 127.0.0.1 8880```

5) Протестировать "приложение" в браузере:

    http://127.0.0.1:8880

6) Подключиться к консоли контейнера (по необходимости):

    ```docker exec --interactive --tty hw-01 /bin/sh```

7) Остановить контейнер:

    ```docker stop hw-01```

8)  Удалить контейнер:

    ```docker container rm hw-01```

9)  Собрать контейнер с указанием другого номера порта в качестве прослушиваемого "приложением":

     ```docker build --rm --file Dockerfile --build-arg PORT=8008 --tag poddubetskyi/hw-01-docker-basics-p8008:0.0.1 .```

10) Убедиться, что в созданном образе номер порта, определенный для сетевого взаимодействия со внешней средой, соответствует значению аргумента сборки с именем PORT, переданному из командной строки во время сборки образа:

    ```docker inspect --format="{{json .Config.ExposedPorts }}" poddubetskyi/hw-01-docker-basics-p8008:0.0.1```

11)  Запустить новый образ на выполнение:

    ```docker run --name hw-01-p8008 --publish 8880:8008 poddubetskyi/hw-01-docker-basics-p8008:0.0.1```

12)  Убедиться, что значение переменной окружения PORT соответствует значению одноименного параметра сборки, указанному в командной строке во время создания образа:

    ```docker exec --tty hw-01-p8008 /bin/sh -c "echo PORT: ${PORT}, HOST: ${HOST} ; exit"```
