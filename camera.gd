extends Camera2D

func _process(delta: float) -> void:
	var speed := 1000.0;
	var direction := Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down");
	var velocity := speed * direction / zoom;
	position += delta * velocity;
	
	position.x = clamp(position.x, limit_left, limit_right);
	position.y = clamp(position.y, limit_top, limit_bottom);
	
	var zoom_direction := Input.get_axis("camera_in", "camera_out");
	zoom += Vector2.ONE * zoom_direction * delta * zoom;
	zoom.x = max(1.5, zoom.x);
	zoom.y = max(1.5, zoom.y);
