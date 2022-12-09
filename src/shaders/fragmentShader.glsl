// RawShaderMaterial
// precision mediump float; // mediumpは正確さを指定

uniform vec3 uColor; // rgb
uniform sampler2D uTexture; // texture用の型

varying vec2 vUV;
varying float vElevation;

void main(){
    vec4 textureColor = texture2D(uTexture, vUV);
    // gl_FragColor = vec4(uColor, 1.0); // r g b a
    textureColor.rgb *= vElevation * 2.0 + 0.7;
    gl_FragColor = textureColor;
}