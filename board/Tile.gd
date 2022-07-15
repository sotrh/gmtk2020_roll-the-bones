extends Sprite

class Type:
	var name = "UNDEFINED"
	var type = "UNDEFINED"
	var color = [0, 0, 0]
	var chance = 0

var type = Type.new()
var tile_types = {}

var hovered = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	if hovered and Input.is_mouse_button_pressed(BUTTON_LEFT):
		print(self.type)

func set_type(type):
	self.type = type
	self.modulate = Color(type.color[0], type.color[1], type.color[2])

func _on_Area2D_mouse_entered():
	hovered = true;


func _on_Area2D_mouse_exited():
	hovered = false;
