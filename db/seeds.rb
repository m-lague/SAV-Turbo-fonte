Ticket.destroy_all
puts "tickets deleted..."

TaskTodoList.destroy_all
Task.destroy_all
TodoList.destroy_all
puts "tasks & todo_lists deleted..."

DisplayedDiagnostic.destroy_all
Diagnostic.destroy_all
puts "diagnostics deleted..."

AlarmsLed.destroy_all
Led.destroy_all
puts "leds deleted..."

AlarmProbablyCause.destroy_all
ProbablyCause.destroy_all
puts "probably_causes deleted..."

Alarm.destroy_all
puts "alarms deleted..."

ErrorCode.destroy_all
puts "error_codes deleted..."

Component.destroy_all
puts "components deleted..."

Problem.destroy_all
puts "problems deleted..."

Phase.destroy_all
Stove.destroy_all
puts "phases & stoves deleted !"


stoves_names = ["Mona", "Lisa", "Tal" ]
stoves_rated_output_heat = ["6kW", "8kW","9kW"]

phases_name = %w(Heat-up fuel-ignition test-fire burning fire-stop)

problems = ["Lors de la phase d'allumage la sonde de température des fumées ne détecte pas la temperature minimum pour passer en mode combustion",
            "Le pressostat détecte que la depression dans la chambre de combustion est inférieur à 10pa"]

components = %w(charge heating-system tremie extractor)

error_codes = %w(E001 E004 E101 E105 E108 E109 E110 E111 A001 A002 A007 ----)

probably_causes = ["defaut su dysteme d'allumage", "usure des jints d'etanchéité", "sonde de température de fumées defectueuse"]

led_names = %w(balai cle tremie)
led_colors = %w(red orange)

alarms = ["coupure de liaison", "allumage raté", "alarme sonde de granulé", "nettoyage poele"]

tasks = ["verifier que la tremie a granulé soit pleine", "Vérifier que le brasero soit installé correctement avec les 2 ergots dans leur
logement et le trou de la bougie en face du fourreau", "Vérifier que la bougie soit incandescente 1 minute après l’allumage du poêle.",
"Faire un enregistrement de température avec LAB TOOLS et contrôler que
pendant la phase de préchauffage, la température mesurée atteint bien la
température minimum.", "Si le problème vient de la qualité des granulés, passer en recette 2 ou 3 le temps
de consommer la totalité des granulés. Les recettes 2 et 3 permettent
d’augmenter le débit d’air de combustion."]

stoves_names.each do |name|
  Stove.create(name: name, rated_heat_output: stoves_rated_output_heat[rand(0...stoves_rated_output_heat.size)])
end

puts "#{Stove.count} stoves created.."

Stove.all.each do |stove|
  phases_name.each do |phase|
    Phase.create(stove: stove, name: phase, duration: rand(1..2000) )
  end
end

puts "#{Phase.count} phases created !"

problems.each do |problem|
  Problem.create(description: problem)
end

puts "#{Problem.count} problems created !"

components.each do |component|
  Component.create(name: component)
end

puts "#{Component.count} components created !"



error_codes.each do |error_code|
  ErrorCode.create(number: error_code)
end

puts "#{ErrorCode.count} error_codes created"

probably_causes.each do |probably_cause|
  ProbablyCause.create(description: probably_cause)
end
puts "#{ProbablyCause.count} probably_causes created"

led_names.each do |led|
  led_colors.each do |color|
    Led.create(icon: led, color: color, status: rand(0..2))
  end
end
puts "#{Led.count} leds created !"

alarms.each do |description|
  error_code = ErrorCode.all[rand(0...ErrorCode.count)]
  a = Alarm.create(description: description, error_code: error_code)
  a.leds << Led.all[rand(0...Led.count)]
  a.probably_causes << ProbablyCause.all[rand(0...ProbablyCause.count)]
end

puts "#{Alarm.count} alarms creeated !"

tasks.each do |task|
  Task.create(description: task)
end

puts "#{Task.count} tasks created !"













