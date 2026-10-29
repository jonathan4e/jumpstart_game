extends CharacterBody2D

var coin_count=0

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()


func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin") and not $HeldCoin.visible:
		area.queue_free()
		$HeldCoin.visible = true
		
	if area.is_in_group("basket") and $HeldCoin.visible:
		$HeldCoin.visible = false
		coin_count += 1
		$CanvasLayer/CoinCountDisplay.text = "Coins: " + str(coin_count)
