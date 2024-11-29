shader_type canvas_item;

uniform sampler2D gradient;



void vertex() {
	// Called for every vertex the material is visible on.
}


vec2 cmul(vec2 a, vec2 b) {
	float real = (a.x * b.x) - (a.y * b.y);
	float imag = (a.x * b.y) + (a.y * b.x);
	return vec2(real, imag);
}


vec2 cadd(vec2 a, vec2 b) {
	return a + b;
}


vec2 formula(vec2 z, vec2 c) {
	return cadd(cmul(z,z),c);
}


void fragment() {
	vec2 rect_position = - 2.0 * vec2(16.0/9.0, 1.0); 
	vec2 rect_size = 4.0 * vec2(16.0/9.0, 1.0);
	vec2 rect_start = rect_position;
	vec2 rect_end = rect_position + rect_size;
	vec2 coords = mix(rect_start, rect_end, UV);
	vec2 z = vec2(0,0);
	for (int i = 0; i < 20; i++) {
		z = formula(z, coords);
	}
	float dist = log2(length(z));
	if (dist < 1.0) {
		COLOR = vec4(0,0,0,1);
	}
	else {
		COLOR = texture(gradient, vec2(clamp((dist) / 100.0, 0, 1), 0.0));
	}
}
