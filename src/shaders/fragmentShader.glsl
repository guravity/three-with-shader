// ShaderMaterial
// void main() {
//     gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
// }

// RawShaderMaterial
precision mediump float; // mediumpは正確さを指定
void main(){
    gl_FragColor = vec4(0.0, 1.0, 1.0, 1.0); // r g b a
}