shader_type canvas_item;

uniform float magnification : hint_range(1.0, 5.0) = 4.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    // Get mask from circle texture
    float mask = texture(TEXTURE, UV).a;

    if (mask < 0.1) {
        discard;
    }

    // Current screen position
    vec2 screen_pos = SCREEN_UV;

    // Offset from sprite center (UV 0.5 = center)
    vec2 center_offset = UV - 0.5;

    // For magnification: sample from a smaller area around the current position
    // Divide offset by magnification to "compress" the sampling area
    vec2 magnified_offset = center_offset / (5.0-magnification);

    // Estimate sprite size in screen coordinates using derivatives
    vec2 sprite_size_screen = abs(dFdx(SCREEN_UV)) + abs(dFdy(SCREEN_UV));

    // Apply the magnified offset
    vec2 sample_uv = screen_pos - magnified_offset * sprite_size_screen * 100.0;

    COLOR = texture(SCREEN_TEXTURE, sample_uv);
}