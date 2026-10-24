
extends CharacterBody2D
var leaf_count = 0

func _physics_process(_delta):
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1
	if Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1
	if Input.is_key_pressed(KEY_DOWN):
		direction.y += 1
	if Input.is_key_pressed(KEY_UP):
		direction.y -= 1

	velocity = direction.normalized() * 400
	move_and_slide()


func _on_pick_up_area_area_entered(area):
	if area.is_in_group("bush") and not $heldbush.visible:
		$heldbush.texture = area.get_node("Sprite2D").texture
		area.queue_free()
		$heldbush.visible = true
	if area.is_in_group("basket") and $heldbush.visible:
		$heldbush.visible = false
		leaf_count += 1
		$CanvasLayer/DirtCountDisplay.text = "pieces in basket: " + str(leaf_count)
		
		
