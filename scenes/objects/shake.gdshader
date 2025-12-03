shader_type canvas_item;

uniform float shake_intensity = 0.0;

uniform float shake_speed = 20.0;

void vertex() {
	vec2 shake = vec2(0.0);

	if(VERTEX.y < 0.0)
	{
		shake.x = sin(TIME * shake_speed + VERTEX.y) * shake_intensity;
	}

	VERTEX.xy += shake;
	// Called for every vertex the material is visible on.
}








/*void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}*/
