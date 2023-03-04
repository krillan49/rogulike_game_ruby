# 1. Конструктор навыков

# 2. Первичные характеристики
strength = 5
vitality = 5
dexterity = 5
perception = 5
intelligence = 5

stats = 10


while stats != 0
  max_hp_pl = (vitality * 10) + (strength * 5)
  recovery_hp_pl = vitality + rand(0..vitality)
  mindam_pl = ((strength.to_f / 3) + (dexterity.to_f / 2)).round(1)
  maxdam_pl = strength * 1.5
  accuracy_pl = (perception * 10) + (dexterity * 5)
  armor_pl = 0
  exp_pl = 0
  lvl_pl = 0

  points = intelligence

  hp_pl = max_hp_pl

  puts "Ваши статы:\nСила #{strength}\nЖивучесть #{vitality}\nЛовкость #{dexterity}\nВосприятие #{perception}\nИнтеллект #{intelligence}"
  puts "--------------------------------------------------------------------------------------------------------------"
  puts "Ваши характеристики:\nУровень #{lvl_pl}\nЖизни #{hp_pl}/#{max_hp_pl} {(vitality * 10) + (strength * 5)}\nВосстановление #{recovery_hp_pl} {vitality + rand(0..vitality)}\nУрон #{mindam_pl}-#{maxdam_pl} {mindam_pl = (strength / 3) + (dexterity / 2) maxdam_pl = strength * 1.5}\nТочность #{accuracy_pl} {(perception * 10) + (dexterity * 5)}\nБроня #{armor_pl}"
  puts "--------------------------------------------------------------------------------------------------------------"
  puts "Распределите очки статов. У вас осталось #{stats} очков"
  print "+Сила(S). +Живучесть(V). +Ловкость(D). +Восприятие(P). +Интеллект(I) "
  distribution = gets.strip.upcase
  if distribution == "S"
    strength += 1
  elsif distribution == "V"
    vitality += 1
  elsif distribution == "D"
    dexterity += 1
  elsif distribution == "P"
    perception += 1
  elsif distribution == "I"
    intelligence += 1
  else
    puts "Вы ввели неверный символ, попробуйте есще раз"
    stats += 1
  end
  stats -= 1
  puts "======================================================================================================"
end
puts "Ваши характеристики:\nУровень #{lvl_pl}\nЖизни #{hp_pl}/#{max_hp_pl} = (vitality * 10) + (strength * 5)\nВосстановление #{recovery_hp_pl} = vitality + rand(0..vitality)\nУрон #{mindam_pl}-#{maxdam_pl} mindam_pl = (strength / 3) + (dexterity / 2) maxdam_pl = strength * 1.5\nТочность #{accuracy_pl} = (perception * 10) + (dexterity * 5)\nБроня #{armor_pl}"
