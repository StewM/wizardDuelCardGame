extends Area2D

enum Suits {CLUBS, DIAMONDS, HEARTS, SPADES}

@export var value = 0
@export var suit = Suits.CLUBS
@export var flipped = false

@onready var sprite = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(949, 490)
	update_sprite()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_click"):
		var newValue = value + 1
		if newValue > 13:
			newValue = 1
		value = newValue
		update_sprite()
	
	if Input.is_action_just_pressed("right_click"):
		var newSuit = suit + 1
		if newSuit > 3:
			newSuit = 0
		suit = newSuit as Suits
		update_sprite()
	
func update_sprite() -> void:
	if sprite:
		sprite.texture = get_texture()
		if value == 0 or value > 13:
			sprite.hide()

func get_texture() -> Resource:
	if flipped or value == 0 or value >13:
		return preload("res://assets/cards/back.png")
	
	var res_path = "res://assets/cards/{value}_{suit}.png".format({
		"value": str(value),
		"suit": Suits.keys()[suit].to_lower()
	})
	return load(res_path)
