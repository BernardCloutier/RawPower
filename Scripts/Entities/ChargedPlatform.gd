class_name ChargePlatform
extends KinematicBody


export(NodePath) var start
export(NodePath) var end

var _energy := 0.0

var passengers = []

func set_position_percent(percent: float) -> void:
	var start_pos_local = get_node(start).transform.origin
	var start_pos = get_node(start).global_transform.origin
	var end_pos = get_node(end).global_transform.origin
	
	var delta_pos = percent * (end_pos - start_pos)
	self.transform.origin = start_pos_local + delta_pos
	for passenger in self.passengers:
		passenger.global_transform.origin += delta_pos
