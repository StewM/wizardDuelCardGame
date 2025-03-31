extends Node

@export var card_scene: PackedScene

var deck = []
var discard = []
var hand = []
var selected = []
var screen_size

var card_width = 156
var hand_padding = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().size
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
	draw(10)
	# render hand
	render_hand()

func draw(num: int) -> void:
	var hand_size = hand.size()
	for n in num:
		var card = deck.pop_front()
		card.hand_index = hand_size + n
		hand.append(card)

func render_hand() -> void:
	var card_offset = card_width + hand_padding
	var extra_offset = card_offset/2 if hand.size() % 2 == 0 else 0
	var starting_x = screen_size.x/2 + extra_offset - ((hand.size() / 2) * card_offset)
	
	for n in hand.size():
		var x = starting_x + (card_offset * n)
		hand[n].position = Vector2(x, screen_size.y/2)
		hand[n].update_sprite()
		hand[n].show()
