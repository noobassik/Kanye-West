# Redis

1. Добавить репозиторий редиса `sudo add-apt-repository ppa:chris-lea/redis-server`
2. Установить `sudo apt-get install redis-server`
3. Добавить в автозапуск `sudo systemctl enable redis-server`

Проверить с помощью `redis-cli ping`

# Sidekiq

## При обновлении версии ruby

Проверить соответствие `GEM_PATH` и переменных окружения в `/bin/bash`, т.к. они используются при запуске сервиса

## Установка

1. Установить Redis
2. Включить systemctl для пользователя `loginctl enable-linger <user>`
3. Скопировать файл [sidekiq.service](https://github.com/mperham/sidekiq/blob/master/examples/systemd/sidekiq.service) 
в `~/.config/systemd/user` (если такой папки нет - создать)
4. Изменить соответствующие слева переменные в файле на следующие:
```
ExecStart=/bin/bash -lc 'exec /home/propimo/website/current/bin/bundle exec sidekiq -e production'
WorkingDirectory=/home/propimo/website/current

#User=propimo
#Group=propimo
#UMask=0002

RestartSec=10
WantedBy=default.target
```
5. Добавить в автозапуск. См. **Взаимодействие**

### Взаимодействие
1. Статус `systemctl --user status sidekiq.service`
2. Рестарт `systemctl --user restart sidekiq.service`
3. Старт `systemctl --user start sidekiq.service`
4. Остановка `systemctl --user stop sidekiq.service`
5. Логи `journalctl -u sidekiq.service`
6. При изменении файла `sidekiq.service` запустить `systemctl --user daemon-reload`
7. Убрать из автозапуска `systemctl --user disable sidekiq.service`
8. Добавить из автозапуска `systemctl --user enable sidekiq.service`

### Источники
[Установка redis+sidekiq+systemctl](https://medium.com/@thomasroest/properly-setting-up-redis-and-sidekiq-in-production-on-ubuntu-16-04-f2c4897944b5)
[Как использовать systemctl](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
[Как запускать сервис от конкретного пользователя](https://unix.stackexchange.com/a/497011)
[Как передать ENV в запуск systemctl](https://www.runrails.com/deploying/sidekiq-with-environment-variables-and-systemd/)
