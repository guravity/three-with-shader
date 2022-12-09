// RawShaderMaterial 
// uniform mat4 projectionMatrix; // カメラが映す領域 near-far
// uniform mat4 viewMatrix; // カメラの位置、方向
// uniform mat4 modelMatrix; // 物体の位置、大きさ 
// attribute vec3 position;

uniform vec2 uFreq;
uniform float uTime;

varying vec2 vUV;
varying float vElevation;

void main(){
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
    // 上の操作を分解し、動かす
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    
    // modelPosition.x += 0.3;
    float elevation = 0.1 * sin(modelPosition.x * uFreq.x + uTime);
    elevation += 0.1 * sin(modelPosition.y * uFreq.y + uTime);
    modelPosition.z += elevation;
    vElevation = elevation;

    // modelPosition.y *= 0.6;


    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;
    gl_Position = projectionPosition;

    vUV = uv; // uvはすでに定義されている
}

/*
修飾子についてのメモ
attribute→頂点情報など
uniform→グローバル変数
varying→VertexShaderからFragmentShaderに変数を渡すとき
precision
*/