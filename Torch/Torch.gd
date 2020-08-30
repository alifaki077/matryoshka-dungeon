extends Area2D

export var active: bool = false
export var always_active: bool = false
var bodies = 0

func _ready() -> void:
	if always_active:
		active = true
		$Sprite/Particles2D.emitting = true
		$Light2D.enabled = true

func _on_Torch_body_entered(body: Node) -> void:
	active = true
	$Sprite/Particles2D.emitting = true
	$Light2D.enabled = true
	bodies += 1
	

func _on_Torch_body_exited(body: Node) -> void:
	bodies -= 1
	if bodies == 0 and not always_active:
		active = false
		$Sprite/Particles2D.emitting = false
		$Light2D.enabled = false
