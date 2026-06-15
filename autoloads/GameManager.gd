extends Node
var max_health := 100.0
var money = 0
var player_damage = 10

signal money_changed(new_amount)
signal stats_changed()

var health_upgrade_cost = 200
var damage_upgrade_cost = 200

# Called when the node enters the scene tree for the first time.
func add_money(amount) -> void:
	money = money + amount
	money_changed.emit(money)
	
	
func buy_health_upgrade():
	if money >= health_upgrade_cost:
		money = money - health_upgrade_cost
		max_health = max_health + 20
		health_upgrade_cost = health_upgrade_cost + 100
		
		money_changed.emit(money)
		stats_changed.emit()
		var player = get_tree().get_first_node_in_group("Player")
		if player != null:
			player.apply_health_upgrade()

func buy_damage_upgrade():
	if money >= damage_upgrade_cost:
		money = money - damage_upgrade_cost
		player_damage = player_damage + 10
		damage_upgrade_cost = damage_upgrade_cost + 100
		
		money_changed.emit(money)
		stats_changed.emit()
	
		
