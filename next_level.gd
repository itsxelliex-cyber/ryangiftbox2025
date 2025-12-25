extends Area2D

@export var next_level_path: PackedScene

func _ready():
# Connect the 'body_entered' signal to the function
	connect("body_entered", Callable(self, "_on_body_entered"))


func _on_body_entered(body):
	# Only trigger if the object entering is the player
	if body.name == "Player" and next_level_path:
		# Debug prints
		print("Player touched portal!")
		print("Next level resource path:", next_level_path.resource_path)

		# Load the next level and replace the current scene
		# Godot 4 requires a path string to change_scene_to_file
		get_tree().change_scene_to_file(next_level_path.resource_path)

#func _on_some_trigger():
	#if next_level_path:
		#var new_scene = next_level_path.instantiate()
		#get_tree().change_scene_to(new_scene)
