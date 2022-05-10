extends LineEdit

var scenev = preload("res://Node2D.tscn")



func _on_Button_pressed():
	SEED.sseed = text
	SEED.text= str("seed: ",SEED.sseed)
	get_tree().change_scene_to(scenev)
