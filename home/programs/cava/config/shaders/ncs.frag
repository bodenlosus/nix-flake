#version 330
in vec2 fragCoord;
out vec4 fragColor;

// Audio data
uniform float bars[512];
uniform int bars_count;
uniform vec3 u_resolution;

// Customizable parameters
uniform vec3 bg_color;     // Background color
uniform vec3 fg_color;     // Primary color
uniform int gradient_count;
uniform vec3 gradient_colors[8];

// Constants for the visualization
const float PI = 3.14159265359;
const float MAX_RINGS = 3.0;    // Number of circular waves
const float ROTATION_SPEED = 0.3;// How fast the visualization rotates
uniform float time;            // Time for animation

// Helper function for smooth color interpolation
vec3 normalize_C(float t, vec3 col_1, vec3 col_2, float t_min, float t_max) {
    float tr = (t - t_min) / (t_max - t_min);
    return col_1 * (1.0 - tr) + col_2 * tr;
}

// Function to create a circular wave
float circle_wave(vec2 uv, float radius, float amplitude, float frequency) {
    float dist = length(uv);
    float wave = sin(dist * frequency - time * ROTATION_SPEED) * amplitude;
    float ring = smoothstep(0.0, 0.02, abs(dist - radius + wave));
    return 1.0 - ring;
}

void main() {
    // Center and normalize coordinates
    vec2 uv = fragCoord - 0.5;
    uv.x *= u_resolution.x/u_resolution.y;
    
    // Initialize color
    vec4 color = vec4(bg_color, 1.0);
    
    // Calculate base frequency from audio data
    float avg_amplitude = 0.0;
    for(int i = 0; i < bars_count; i++) {
        avg_amplitude += bars[i];
    }
    avg_amplitude /= float(bars_count);
    
    // Create multiple circular waves
    float wave_intensity = 0.0;
    for(float i = 1.0; i <= MAX_RINGS; i++) {
        float radius = 0.2 * i;
        float amplitude = 0.05 * avg_amplitude * (MAX_RINGS - i + 1.0) / MAX_RINGS;
        float frequency = 20.0 + i * 5.0;
        
        wave_intensity += circle_wave(uv, radius, amplitude, frequency);
    }
    
    // Apply color based on intensity
    if (gradient_count > 0) {
        float t = wave_intensity;
        int color_index = int(t * (gradient_count - 1));
        color_index = clamp(color_index, 0, gradient_count - 2);
        
        vec3 wave_color = normalize_C(
            t,
            gradient_colors[color_index],
            gradient_colors[color_index + 1],
            float(color_index) / (gradient_count - 1.0),
            float(color_index + 1) / (gradient_count - 1.0)
        );
        
        color = mix(color, vec4(wave_color, 1.0), wave_intensity);
    } else {
        color = mix(color, vec4(fg_color, 1.0), wave_intensity);
    }
    
    // Add a slight glow effect
    float glow = wave_intensity * 0.5;
    color += vec4(fg_color * glow * 0.3, 0.0);
    
    // Output final color
    fragColor = color;
}