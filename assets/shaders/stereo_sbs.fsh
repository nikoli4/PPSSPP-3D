// Side by side stereo, useful for old 3D TVs.
//
// NOTE: Will only be compiled for Vulkan so doesn't follow all the usual conventions.

uniform sampler2DArray sampler0;
varying vec2 v_texcoord0;

uniform vec4 u_setting;

void main() {
	float leftEye = u_setting.x >= 0.5 ? 1.0 : 0.0;
	float rightEye = u_setting.x >= 0.5 ? 0.0 : 1.0;

	if (v_texcoord0.x < 0.5) {
		gl_FragColor.rgb = texture(
			sampler0,
			vec3(v_texcoord0.x * 2.0, v_texcoord0.y, leftEye)
		).xyz;
	} else {
		gl_FragColor.rgb = texture(
			sampler0,
			vec3((v_texcoord0.x - 0.5) * 2.0, v_texcoord0.y, rightEye)
		).xyz;
	}

	gl_FragColor.a = 1.0;
}
