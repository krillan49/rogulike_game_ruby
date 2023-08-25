## Консольная рогулайк игра "Xxxxxxовое подземелье".

Игра сделана в начале моего обучения, на самых минимальных знаниях в программировании(условные операторы, циклы, массивы)
(16.03.2022 - 27.04.2022)

Ruby(3.0)

## Запуск

```bash
ruby Rog_ver0035.rb
```
или
```bash
ruby Rog_ver003.rb
```
или
```bash
ruby Rog_ver002.rb
```
или
```bash
ruby Rog_ver001.rb
```

##Описание(актуально для Rog_ver0035.rb и Rog_ver003.rb):

Общее описание:
-
* Бои происходят пошагово, можно выбрать из нескольких типов атаки
* При получении нового уровня можно прокачивать свои характеристики и навыки
* 5 типов снаряжения(выбиваются из противников): оружие, щит, шлем, нагрудник, перчатки
* В тайнике мага можно найти бонусы усиливающие персонажа
* Игра бесконечная, но можно считать за победу убийство босса "Рыцарь-зомби"
* Чем дальше вы заходите в подземелье тем больше шанс встретить более сильных противников

Характеристики и эффекты:
-
* Хитпоинты, манапоинты - не думаю что требует объяснения)
* Урон - зависит от экипированного оружия, а так же можно прокачивать его дополнительно. Есть разброс соотв максимальный и минимальный урон.
* Точность - шанс попадания в %, одни виды атак точнее других
* Броня - просто отнимается от наносимого урона
* Шанс блока - работает только если экипирован щит, зависит от щита и навыка "Мастер щита"
* Блокируемый урон - зависит от текущего здоровья
* Регенерация - восстановление хитпоинтов за каждый ход в бою
* Восстановление - восстановление хитпоинтов на отдыхе между боями
* Очки опыта - даются за убийство противника
* Очки характеристик и очки навыков - даются на старте и при повышении уровня

Активные навыки(тратят ману):
-
* "Точный удар"  - сильно увеличивает точность и немного урон
* "Сильный удар" - сильно увеличивает урон

Пассивные навыки:
-
* "Концентрация" - наносит дополнительный урон при атаке в зависимости от максимального показателя маны
* "Мастер щита" - увеличивает шанс блока щитом(число урона блокируемое щитом не зависит от навыка, а только от текущего здоровья персонажа)
* "Ошеломление" - при определенном соотношении разового нанесенного урона к остатку хитпоинтов противника, можно снизить точность его следующего удара

Небоевые навыки(работают между боями):
-
* "Первая помощь" (активный) - на привале между битвами восстанавливает часть здоровья, тем больше чем больше разница между максимальным здоровьем и оставшимся
* "Кладоискатель" (пассивный) - увеличивает шанс и ценность выпадающего после боя лута
