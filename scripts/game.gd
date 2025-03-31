extends Node

@export var card_scene: PackedScene

var deck = []
var discard = []
var hand = []
var selected = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func start_game() -> void:
	# build deck
	for n in range(1, 14):
		for suit in Enums.Suits.values():
			var card = card_scene.instantiate()
			card.value = n
			card.suit = suit as Enums.Suits
			deck.push_front(card)
			add_child(card)
	
	deck.shuffle()
	
	# draw hand
	for n in 7:
		hand.append(deck.pop_front())
	
	# test showing hand
	for index in hand.size():
		var x = 486 + (158 * index)
		hand[index].position = Vector2(x, 490)
		hand[index].update_sprite()
		hand[index].show()
		
