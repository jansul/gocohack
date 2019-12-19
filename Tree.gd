extends Spatial

func _on_Detector_body_entered(body):
	var push_point = $RigidBody/PushPoint.translation
	var force = Vector3(10, 0, 0)	
	
	var position_a = body.global_transform.origin
	var position_b = global_transform.origin
	var normal = (position_a - position_b).normalized()
	$RigidBody.apply_impulse(push_point, normal * 10)