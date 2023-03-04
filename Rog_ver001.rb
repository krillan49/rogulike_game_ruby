# Рогулайк игра. Версия 001 (16.03.2022)
# (19.03.2022)


puts "==========================================================================="
puts "Добро пожаловать в рогулайк РПГ \"Пиздецовое подземелье\""
puts "==========================================================================="

max_hp_pl = 100
regen_hp_pl_base = 0
recovery_hp_pl = max_hp_pl * 0.1
max_mp_pl = 100
regen_mp_pl_base = 0
recovery_mp_pl = max_mp_pl * 0.1
mindam_pl_base = 5
maxdam_pl_base = 5
accuracy_pl_base = 80
armor_pl_base = 0
exp_pl = 0
lvl_pl = 0

points = 5

# Блок выбора класса..............................................................................................
print "Выберите класс персонажа. S-Солдат V-Вор U-Ученик(+2 очка характеристик) "
prof_choiсe = gets.strip.upcase
if prof_choiсe == "S"
  prof_pl = "Солдат"
  weapon = "Ржавый топорик"
  torso = "без нагрудника"
  helmet = "без шлема"
  gloves = "без перчаток"
  story_pl = "Ты солдат новобранец, полная серость. Но махаешь оружием все же чуть лучше оборванца"

  name_special_pl = "Сильный удар"
  special_damage_pl = 2
  special_accuracy_pl = 1
  special_mp_cost_pl = 15
  lor_secial_pl = ": урон сильнее в 2 раза, наносится всегда по телу. Цена 15 выносливости"

  name_passive_pl = "Ошеломление(пас)"
  lor_passive_pl = ": при нанесении большого урона противник теряет часть точности"
elsif prof_choiсe == "V"
  prof_pl = "Вор"
  weapon = "Ножик"
  torso = "без нагрудника"
  helmet = "без шлема"
  gloves = "без перчаток"
  story_pl = "Ты отребье и промышлял карманными кражами. Зато воровство развило ловкость рук"

  name_special_pl = "Точный удар"
  special_damage_pl = 1
  special_accuracy_pl = 1.5
  special_mp_cost_pl = 5
  lor_secial_pl = ": точнее в 1.5 раза, наносится всегда по телу. Цена 5 выносливости"
elsif prof_choiсe == "U"
  prof_pl = "Ученик"
  weapon = "Дубинка"
  torso = "без нагрудника"
  helmet = "без шлема"
  gloves = "без перчаток"
  points += 2
  story_pl = "Ты бездарный ученик. Но хоть какие-то знания тебе все же вдолбили"
else
  prof_pl = "Пьяньчуга"
  weapon = "без оружия"
  torso = "без нагрудника"
  helmet = "без шлема"
  gloves = "без перчаток"
  max_hp_pl -= 10
  max_mp_pl -= 10
  mindam_pl_base -= 2
  accuracy_pl -= 5
  story_pl = "Ты конченый алкаш. Проснулся непонятно где"
end
puts "--------------------------------------------------------------------------------------------------------"
puts story_pl
#--------------------------------------------------------------------------------------------------------------------

# Блок стартовой брони, точности и доп эффектов(регенерация) -------------------------------------------------------
if torso == "без нагрудника"
  armor_torso = 0
end

if helmet == "без шлема"
  armor_helmet = 0
end

if gloves == "без перчаток"
  armor_gloves = 0
  accuracy_gloves = 0
end

armor_pl = armor_pl_base + armor_torso + armor_helmet + armor_gloves
accuracy_pl = accuracy_pl_base + accuracy_gloves
regen_hp_pl = regen_hp_pl_base
regen_mp_pl = regen_mp_pl_base
#--------------------------------------------------------------------------------------------------------------------

# Блок стартового оружия и урона ----------------------------------------------------------------------------------
if weapon == "без оружия"
  mindam_weapon = 0
  maxdam_weapon = 0
elsif weapon == "Ржавый топорик"
  mindam_weapon = 1
  maxdam_weapon = 6
elsif weapon == "Ножик"
  mindam_weapon = 2
  maxdam_weapon = 5
elsif weapon == "Дубинка"
  mindam_weapon = 3
  maxdam_weapon = 4
end

mindam_pl = mindam_pl_base + mindam_weapon
maxdam_pl = maxdam_pl_base + maxdam_weapon
#-------------------------------------------------------------------------------------------------------------------
exp_lvl = [0, 2, 5, 9, 13, 20, 30, 45, 65, 100]
hp_pl = max_hp_pl
mp_pl = max_mp_pl
# Основной игровой блок ===============================================================================================
leveling = 0
while true

  # Блок распределения очков характеристик ------------------------------------------------
  while points != 0
    puts "Класс #{prof_pl}\nУровень #{lvl_pl} (#{exp_pl}/#{exp_lvl[lvl_pl + 1]})"
    puts "Н А В Ы К И:\n#{name_special_pl} #{lor_secial_pl}\n#{name_passive_pl} #{lor_passive_pl}"
    puts "С Т А Т Ы:\nHP #{hp_pl.round}/#{max_hp_pl} Реген #{regen_hp_pl_base} Восстановление #{recovery_hp_pl.round}\nMP #{mp_pl.round}/#{max_mp_pl} Реген #{regen_mp_pl_base} Восстановление #{recovery_mp_pl.round}\nУрон #{mindam_pl}-#{maxdam_pl} (базовый #{mindam_pl_base}-#{maxdam_pl_base} + #{weapon} #{mindam_weapon}-#{maxdam_weapon})\nТочность #{accuracy_pl} (базовая #{accuracy_pl_base} + #{gloves} #{accuracy_gloves})\nБроня #{armor_pl} (базовая #{armor_pl_base} + #{torso} #{armor_torso} + #{helmet} #{armor_helmet} + #{gloves} #{armor_gloves})"

    puts "Распределите очки. У вас осталось #{points} очков"
    print "+5 жизней(H). +5 выносливости(M). +1 мин/макс случайно урон(X). +1 точность(A)  "
    distribution = gets.strip.upcase
    if distribution == "H"
      max_hp_pl += 5
      hp_pl += 5
      recovery_hp_pl = max_hp_pl * 0.1
    elsif distribution == "M"
      max_mp_pl += 5
      mp_pl += 5
      recovery_mp_pl = max_mp_pl * 0.1
    elsif distribution == "X"
      min_or_max = rand(0..1)
      if min_or_max == 0 and mindam_pl_base < maxdam_pl_base
        mindam_pl_base += 1
        mindam_pl = mindam_pl_base + mindam_weapon
      else
        maxdam_pl_base += 1
        maxdam_pl = maxdam_pl_base + maxdam_weapon
      end
    elsif distribution == "A"
      accuracy_pl_base += 1
    else
      puts "Вы ввели неверный символ, попробуйте есще раз"
      points += 1
    end
    points -= 1
    puts "-------------------------------------------------------------------------------------------------------"
  end
  puts "Класс #{prof_pl}\nУровень #{lvl_pl} (#{exp_pl}/#{exp_lvl[lvl_pl + 1]})"
  puts "Н А В Ы К И:\n#{name_special_pl} #{lor_secial_pl}\n#{name_passive_pl} #{lor_passive_pl}"
  puts "С Т А Т Ы:\nHP #{hp_pl.round}/#{max_hp_pl} Реген #{regen_hp_pl_base} Восстановление #{recovery_hp_pl.round}\nMP #{mp_pl.round}/#{max_mp_pl} Реген #{regen_mp_pl_base} Восстановление #{recovery_mp_pl.round}\nУрон #{mindam_pl}-#{maxdam_pl} (базовый #{mindam_pl_base}-#{maxdam_pl_base} + #{weapon} #{mindam_weapon}-#{maxdam_weapon})\nТочность #{accuracy_pl} (базовая #{accuracy_pl_base} + #{gloves} #{accuracy_gloves})\nБроня #{armor_pl} (базовая #{armor_pl_base} + #{torso} #{armor_torso} + #{helmet} #{armor_helmet} + #{gloves} #{armor_gloves})"
  #-------------------------------------------------------------------------------------------------------------

  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  # Блок восстановления жизней и маны между боями-----------------------------------------------------------------
  if (max_hp_pl - hp_pl) >= recovery_hp_pl
    hp_pl += recovery_hp_pl
    puts "Передохнув вы восстанавливаете #{recovery_hp_pl.round} жизней, теперь у вас #{hp_pl.round}/#{max_hp_pl} жизней"
  elsif (max_hp_pl - hp_pl) < recovery_hp_pl and hp_pl < max_hp_pl
    hp_pl = max_hp_pl
    puts "Передохнув вы восстанавливаете #{recovery_hp_pl.round} жизней, теперь у вас #{hp_pl.round}/#{max_hp_pl} жизней"
  end

  if (max_mp_pl - mp_pl) >= recovery_mp_pl
    mp_pl += recovery_mp_pl
    puts "Передохнув вы восстанавливаете #{recovery_mp_pl.round} выносливости, теперь у вас #{mp_pl.round}/#{max_mp_pl} выносливости"
  elsif (max_mp_pl - mp_pl) < recovery_mp_pl and mp_pl < max_mp_pl
    mp_pl = max_mp_pl
    puts "Передохнув вы восстанавливаете #{recovery_mp_pl.round} выносливости, теперь у вас #{mp_pl.round}/#{max_mp_pl} выносливости"
  end
  #--------------------------------------------------------------------------------------------------------------

  print "Чтобы начать следующий бой нажмите Enter"
  gets
  puts "++++++++++++++++++++++++++++++++++++++ Бой #{leveling + 1} +++++++++++++++++++++++++++++++++++++++++++++++++"

  # Блок назначения противника ---------------------------------------------------------------------------------
  enemy_rand = rand(1..12) + rand(0..leveling)

  weapon_en = "без оружия"
  mindam_weapon_en = 0
  maxdam_weapon_en = 0
  torso_en = "без нагрудника"
  armor_torso_en = 0
  helmet_en = "без шлема"
  armor_helmet_en = 0
  gloves_en = "без перчаток"
  armor_gloves_en = 0
  accurasy_gloves_en = 0

  if enemy_rand <= 5
    name_en = "Оборванец"

    hp_en = 80
    mindam_en_base = 1
    maxdam_en_base = 5
    accurasy_en_base = 60
    armor_en_base = 0
    exp = 1
  elsif enemy_rand > 5 and enemy_rand <= 10
    name_en = "Бешеный пес"

    hp_en = 60
    mindam_en_base = 1
    maxdam_en_base = 8
    accurasy_en_base = 50
    armor_en_base = 0
    exp = 1
  elsif enemy_rand > 10 and enemy_rand <= 15
    name_en = "Гоблин"
    rand_weapon_en = rand(1..2)
    if rand_weapon_en == 1
      weapon_en = "Ножик"
      mindam_weapon_en = 2
      maxdam_weapon_en = 5
    elsif rand_weapon_en == 2
      weapon_en = "Кинжал"
      mindam_weapon_en = 3
      maxdam_weapon_en = 6
    end
    rand_gloves_en = rand(0..1)
    if rand_gloves_en == 1
      gloves_en = "Кожаные перчатки"
      armor_gloves_en = 0
      accurasy_gloves_en = 10
    end

    hp_en = 65
    mindam_en_base = 3
    maxdam_en_base = 3
    accurasy_en_base = 85
    armor_en_base = 0
    exp = 2
  elsif enemy_rand > 15 and enemy_rand <= 20
    name_en = "Бандит"
    rand_weapon_en = rand(1..3)
    if rand_weapon_en == 1
      weapon_en = "Ржавый топорик"
      mindam_weapon_en = 1
      maxdam_weapon_en = 6
    elsif rand_weapon_en == 2
      weapon_en = "Ножик"
      mindam_weapon_en = 2
      maxdam_weapon_en = 5
    elsif rand_weapon_en == 3
      weapon_en = "Дубинка"
      mindam_weapon_en = 3
      maxdam_weapon_en = 4
    end
    rand_torso_en = rand(0..1)
    if rand_torso_en == 1
      torso_en = "Кожанка"
      armor_torso_en = 1
    end
    rand_helmet_en = rand(0..1)
    if rand_helmet_en == 1
      helmet_en = "Кожаный шлем"
      armor_helmet_en = 1
    end
    rand_gloves_en = rand(0..1)
    if rand_gloves_en == 1
      gloves_en = "Кожаные перчатки"
      armor_gloves_en = 0
      accurasy_gloves_en = 10
    end

    hp_en = 100
    mindam_en_base = 5
    maxdam_en_base = 5
    accurasy_en_base = 80
    armor_en_base = 0
    exp = 2
  elsif enemy_rand > 20 and enemy_rand <= 25
    name_en = "Дезертир"
    rand_weapon_en = rand(1..3)
    if rand_weapon_en == 1
      weapon_en = "Ржавый топорик"
      mindam_weapon_en = 1
      maxdam_weapon_en = 6
    elsif rand_weapon_en == 2
      weapon_en = "Топорик"
      mindam_weapon_en = 5
      maxdam_weapon_en = 8
    elsif rand_weapon_en == 3
      weapon_en = "Фальшион"
      mindam_weapon_en = 5
      maxdam_weapon_en = 10
    end
    rand_torso_en = rand(0..2)
    if rand_torso_en == 1
      torso_en = "Кожанка"
      armor_torso_en = 1
    elsif rand_torso_en == 2
      torso_en = "Стеганка"
      armor_torso_en = 2
    end
    rand_helmet_en = rand(0..2)
    if rand_helmet_en == 1
      helmet_en = "Кожаный шлем"
      armor_helmet_en = 1
    elsif rand_helmet_en == 2
      helmet_en = "Стеганый шлем"
      armor_helmet_en = 2
    end
    rand_gloves_en = rand(0..2)
    if rand_gloves_en == 1
      gloves_en = "Кожаные перчатки"
      armor_gloves_en = 0
      accurasy_gloves_en = 10
    elsif rand_gloves_en == 2
      gloves_en = "Стеганые перчатки"
      armor_gloves_en = 1
      accurasy_gloves_en = 7
    end

    hp_en = 120
    mindam_en_base = 5
    maxdam_en_base = 5
    accurasy_en_base = 80
    armor_en_base = 0
    exp = 3
  elsif enemy_rand > 25 #and enemy_rand <= 30
    name_en = "Орк"
    rand_weapon_en = rand(1..2)
    if rand_weapon_en == 1
      weapon_en = "Топор"
      mindam_weapon_en = 6
      maxdam_weapon_en = 10
    elsif rand_weapon_en == 2
      weapon_en = "Цеп"
      mindam_weapon_en = 0
      maxdam_weapon_en = 20
    end

    hp_en = 180
    mindam_en_base = 7
    maxdam_en_base = 7
    accurasy_en_base = 70
    armor_en_base = 0
    exp = 4
  end
  mindam_en = mindam_en_base + mindam_weapon_en
  maxdam_en = maxdam_en_base + maxdam_weapon_en
  armor_en = armor_en_base + armor_torso_en + armor_helmet_en + armor_gloves_en
  accurasy_en = accurasy_en_base + accurasy_gloves_en
  #--------------------------------------------------------------------------------------------------------------------

  puts "В бой! Ваш противник #{name_en}"
  puts "#{mindam_en}-#{maxdam_en} = #{mindam_en_base}-#{maxdam_en_base} + #{mindam_weapon_en}-#{maxdam_weapon_en}(#{weapon_en})"
  puts "#{armor_en} = #{armor_en_base} + #{armor_torso_en}(#{torso_en}) + #{armor_helmet_en}(#{helmet_en}) + #{armor_gloves_en}(#{gloves_en})"
  puts "#{accurasy_en} = #{accurasy_en_base} + #{accurasy_gloves_en}(#{gloves_en})"

  # Блок хода боя ===============================================================================================
  run = ""
  lap = 1 # номер хода
  while hp_en > 0 and run != "Y"

    # Блок расчета урона----------------------------------------------------------------------------------------
    damage_pl = rand(mindam_pl..maxdam_pl) - armor_en
    if damage_pl < 0
      damage_pl = 0
    end

    damage_en = rand(mindam_en..maxdam_en) - armor_pl
    if damage_en < 0
      damage_en = 0
    end
    #----------------------------------------------------------------------------------------------------------

    puts "====================================== ХОД #{lap} ============================================"

    # Блок выбора вида атаки ------------------------------------------------------------------------------------
    cant_do = 0
    while cant_do == 0
      cant_do += 1
      print "Атакуйте! 1.По телу(B) 2.По голове(H) 3.По ногам(L) 4.Навык(S) "
      target_pl = gets.strip.upcase
      target_name_pl = "по телу"
      if target_pl == "H"
        damage_pl *= 1.5
        accuracy_action_pl = accuracy_pl * 0.7
        target_name_pl = "по голове"
      elsif target_pl == "L"
        damage_pl *= 0.7
        accuracy_action_pl = accuracy_pl * 1.5
        target_name_pl = "по ногам"
      elsif target_pl == "S"
        if mp_pl >= special_mp_cost_pl
          damage_pl *= special_damage_pl
          accuracy_action_pl = accuracy_pl * special_accuracy_pl
          target_name_pl = name_special_pl
          mp_pl -= special_mp_cost_pl
        else
          puts "Недостаточно маны на #{name_special_pl}"
          cant_do -= 1
        end
      else
        accuracy_action_pl = accuracy_pl
      end
    end
    # -----------------------------------------------------------------------------------------------------
    # Блок направления атаки бота ----------------------------------------------------------------------------
    target_en = rand(1..10)
    target_name_en = "по телу"
    if target_en >= 1 and target_en <= 3
      damage_en *= 1.5
      accurasy_action_en = accurasy_en * 0.7
      target_name_en = "по голове"
    elsif target_en >= 4 and target_en <= 6
      damage_en *= 0.7
      accurasy_action_en = accurasy_en * 1.5
      target_name_en = "по ногам"
    else
      accurasy_action_en = accurasy_en
    end
    #-----------------------------------------------------------------------------------------------------------
    puts "-----------------------------------------------------------------------------------------"

    # Блок расчета попадания/промаха и нанесения атак-----------------------------------------------------------
    if accuracy_action_pl >= rand(1..100)
      hp_en -= damage_pl
      puts "Вы нанесли #{damage_pl.round} урона #{target_name_pl}"
      hit_miss_pl = 1
    else
      puts "Вы промахнулись #{target_name_pl}"
      hit_miss_pl = 0
    end

    if name_passive_pl == "Ошеломление(пас)"
      if hit_miss_pl == 1 and damage_pl > hp_en/2
        accurasy_action_en *= 0.1*rand(1..9)
        puts "атака ошеломила врага, уменьшив его точность до #{(accurasy_en * 0.1 * rand(1..9)).round}"
      end
    end

    if accurasy_action_en >= rand(1..100)
      hp_pl -= damage_en
      puts "#{name_en} нанес #{damage_en.round} урона #{target_name_en}"
      hit_miss_en = 1
    else
      puts "#{name_en} промахнулся #{target_name_en}"
      hit_miss_en = 0
    end
    #------------------------------------------------------------------------------------------------------------------

    # Блок доп эффектов(регенерация)------------------------------------------------------------------------------
    if (max_hp_pl - hp_pl) >= regen_hp_pl and regen_hp_pl > 0
      hp_pl += regen_hp_pl
      puts "Вы регенерируете #{regen_hp_pl} жизней, теперь у вас #{hp_pl.round}/#{max_hp_pl} жизней"
    elsif (max_hp_pl - hp_pl) < regen_hp_pl and hp_pl < max_hp_pl and regen_hp_pl > 0
      hp_pl = max_hp_pl
      puts "Вы регенерируете #{regen_hp_pl} жизней, теперь у вас #{hp_pl.round}/#{max_hp_pl} жизней"
    end

    if (max_mp_pl - mp_pl) >= regen_mp_pl and regen_mp_pl > 0
      mp_pl += regen_mp_pl
      puts "Вы регенерируете #{regen_mp_pl} выносливости, теперь у вас #{mp_pl.round}/#{max_mp_pl} выносливости"
    elsif (max_mp_pl - mp_pl) < regen_mp_pl and mp_pl < max_mp_pl and regen_mp_pl > 0
      mp_pl = max_mp_pl
      puts "Вы регенерируете #{regen_mp_pl} выносливости, теперь у вас #{mp_pl.round}/#{max_mp_pl} выносливости"
    end
    #---------------------------------------------------------------------------------------------------------------

    # Блок результата обмена ударами --------------------------------------------------------------------------------
    if hp_pl > 0 and hp_en > 0
      puts "У вас осталось #{hp_pl.round}/#{max_hp_pl} жизней и #{mp_pl.round}/#{max_mp_pl} выносливости, у #{name_en}а осталось #{hp_en.round} жизней."
    elsif hp_pl > 0 and hp_en <= 0
      puts "У вас осталось #{hp_pl.round}/#{max_hp_pl} жизней и #{mp_pl.round}/#{max_mp_pl} выносливости, у #{name_en}а осталось #{hp_en.round} жизней."
      puts "#{name_en} убит, победа!!!"
    elsif hp_pl <= 0
      puts "Ты убит - слабак!"
      exit
    end
    #------------------------------------------------------------------------------------------------------------------

    # Блок побега ---------------------------------------------------------------------------------------------------
    if hp_pl < (max_hp_pl * 0.15) and hp_pl > 0 and hp_en > 0
      print "Ты на пороге смерти. Чтобы убежать введи Y : "
      run = gets.strip.upcase
      if run == "Y"
        puts "Сбежал ссыкло, штраф 5 опыта"
        exp = -5
      end
    end
    #-----------------------------------------------------------------------------------------------------------------

    lap += 1 # номер хода

  end
  #===================================================================================================================

  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  # Блок сбора лута-----------------------------------------------------------------------------------------------------
  if run != "Y"

    loot = rand(0..5)
    if loot <= 5 and loot >=4
      if (max_hp_pl - hp_pl) >= 20
        hp_pl += 20
      elsif (max_hp_pl - hp_pl) < 20 and hp_pl < max_hp_pl
        hp_pl = max_hp_pl
      end
      puts "Обыскав все вокруг ты нашел зелье восстанавливающее 20 жизней, теперь у тебя #{hp_pl.round}/#{max_hp_pl} жизней"
    elsif loot <= 3 and loot >= 2
      puts "Рядом нет ничего ценного"
    elsif loot <= 1
      hp_pl -= 5
      puts "Пока ты шарил по углам, тебя укусила крыса(-5 жизней), теперь у тебя #{hp_pl.round}/#{max_hp_pl} жизней"
      if hp_pl <= 0
        puts "Ты подох от укуса крысы. Жалкая смерть"
        exit
      end
    end

    stash_magic = rand(1..200)
    if stash_magic <= 10
      puts "Осмотревшись вы заметили тайник мага, а в нем... "
      bonus_hp = rand(1..3)
      puts "Эликсир здоровья. Ваши жизни #{hp_pl.round}/#{max_hp_pl} увеличиваются на #{bonus_hp}"
      max_hp_pl += bonus_hp
      hp_pl += bonus_hp
      puts "Теперь у вас #{hp_pl.round}/#{max_hp_pl} жизней"
    elsif stash_magic <= 20
      puts "Осмотревшись вы заметили тайник мага, а в нем... "
      bonus_mp = rand(1..3)
      puts "Эликсир выносливости. Ваша выносливость #{mp_pl.round}/#{max_mp_pl} увеличивается на #{bonus_mp}"
      max_mp_pl += bonus_mp
      mp_pl += bonus_mp
      puts "Теперь у вас #{mp_pl.round}/#{max_mp_pl} выносливости"
    elsif stash_magic <= 25
      puts "Осмотревшись вы заметили тайник мага, а в нем... "
      bonus_accuracy = rand(1..2)
      puts "Эликсир точности. Ваша точность #{accuracy_pl_base} увеличивается на #{bonus_accuracy}"
      accuracy_pl_base += bonus_accuracy
      puts "Теперь у вас #{accuracy_pl_base} точности"
    elsif stash_magic <= 28
      puts "Осмотревшись вы заметили тайник мага, а в нем... "
      bonus_points = 1
      puts "Книга знаний. Ваши очки характеристик увеличились на #{bonus_points}"
      points += bonus_points
    elsif stash_magic <= 29
      puts "Осмотревшись вы заметили тайник мага, а в нем... "
      bonus_armor = 1
      puts "Эликсир камня. Ваша броня #{armor_pl_base} увеличивается на #{bonus_armor}"
      armor_pl_base += bonus_armor
      puts "Теперь у вас #{armor_pl_base} брони"
    elsif stash_magic <= 30
      puts "Осмотревшись вы заметили тайник мага, а в нем... "
      bonus_hp_regen = 1
      puts "Эликсир троля. Регенерация жизней #{regen_hp_pl_base} увеличивается на #{bonus_hp_regen}"
      regen_hp_pl_base += bonus_hp_regen
      puts "Теперь у вас #{regen_hp_pl_base} регенерации жизней"
    elsif stash_magic <= 31
      puts "Осмотревшись вы заметили тайник мага, а в нем... "
      bonus_mp_regen = 1
      puts "Эликсир единорога. Регенерация выносливости #{regen_mp_pl_base} увеличивается на #{bonus_mp_regen}"
      regen_mp_pl_base += bonus_mp_regen
      puts "Теперь у вас #{regen_mp_pl_base} регенерации выносливости"
    end

    weapon_loot = rand(0..1)
    if weapon_loot == 1 and weapon_en != "без оружия"
      puts "Обыскав труп #{name_en} ты нашел #{weapon_en}"
      print "Поменяем #{weapon}(#{mindam_weapon}-#{maxdam_weapon}) на #{weapon_en}(#{mindam_weapon_en}-#{maxdam_weapon_en}) Y/N? "
      weapon_loot_choice = gets.strip.upcase
      if weapon_loot_choice == "Y"
        weapon = weapon_en
        mindam_weapon = mindam_weapon_en
        maxdam_weapon = maxdam_weapon_en
        mindam_pl = mindam_pl_base + mindam_weapon
        maxdam_pl = maxdam_pl_base + maxdam_weapon
      end
    end

    torso_loot = rand(0..1)
    if torso_loot == 1 and torso_en != "без нагрудника"
      puts "Обыскав труп #{name_en} ты нашел #{torso_en}"
      print "Поменяем #{torso}(#{armor_torso}) на #{torso_en}(#{armor_torso_en}) Y/N? "
      torso_loot_choice = gets.strip.upcase
      if torso_loot_choice == "Y"
        torso = torso_en
        armor_torso = armor_torso_en
      end
    end

    helmet_loot = rand(0..1)
    if helmet_loot == 1 and helmet_en != "без шлема"
      puts "Обыскав труп #{name_en} ты нашел #{helmet_en}"
      print "Поменяем #{helmet}(#{armor_helmet}) на #{helmet_en}(#{armor_helmet_en}) Y/N? "
      helmet_loot_choice = gets.strip.upcase
      if helmet_loot_choice == "Y"
        helmet = helmet_en
        armor_helmet = armor_helmet_en
      end
    end

    gloves_loot = rand(0..1)
    if helmet_loot == 1 and gloves_en != "без перчаток"
      puts "Обыскав труп #{name_en} ты нашел #{gloves_en}"
      print "Поменяем #{gloves}(бр-#{armor_gloves} точ-#{accuracy_gloves}) на #{gloves_en}(бр-#{armor_gloves_en} точ-#{accurasy_gloves_en}) Y/N? "
      gloves_loot_choice = gets.strip.upcase
      if gloves_loot_choice == "Y"
        gloves = gloves_en
        armor_gloves = armor_gloves_en
        accuracy_gloves = accurasy_gloves_en
      end
    end

    regen_hp_pl = regen_hp_pl_base
    regen_mp_pl = regen_mp_pl_base
    recovery_hp_pl = max_hp_pl * 0.1
    recovery_mp_pl = max_mp_pl * 0.1
    armor_pl = armor_pl_base + armor_torso + armor_helmet + armor_gloves
    accuracy_pl = accuracy_pl_base + accuracy_gloves
  end
  #-------------------------------------------------------------------------------------------------------------
  puts " "
  # Блок получения опыта и очков -------------------------------------------------------------------------------------
  exp_lvl = [0, 2, 5, 9, 13, 20, 30, 45, 65, 100]
  exp_pl += exp
  puts "Вы получили #{exp} опыта. Теперь у вас #{exp_pl} опыта"
  for i in 0...exp_lvl.size
    if exp_pl >= exp_lvl[i] and lvl_pl < i
      new_points = i - lvl_pl
      points += new_points
      lvl_pl += (i - lvl_pl)
      puts "Вы получили новый уровень, теперь ваш уровень #{lvl_pl}й"
      print "Вы получили #{new_points} очков характеристик. "
    end
  end
  puts "У вас #{points} свободных очков характеристик"
  #-----------------------------------------------------------------------------------------------------------------
  puts "-------------------------------------------------------------------------------------------------"
  leveling += 1
end
#====================================================================================================================
