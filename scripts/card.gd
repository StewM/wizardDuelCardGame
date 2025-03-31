extends Area2D

@export var value = 0
@export var suit = Enums.Suits.CLUBS
@export var flipped = false

@onready var sprite = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = Vector2(949, 490)
	#update_sprite()
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _input(_event: InputEvent) -> void:
	pass
	
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
		"suit": Enums.Suits.keys()[suit].to_lower()
	})
	return load(res_path)
