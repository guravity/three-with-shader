module.exports = {
    mode: "development",
    entry: "./src/index.js", // バンドル対象
    output: {
        path: `${__dirname}/dist`,
        filename: "bundle.js",
    },
    devServer: {
        static: "./dist",
    },
    resolve: {
        extensions: [".js", ".glsl"]
    },
    module: {
        rules: [ // ローダー
            // JS
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: ["babel-loader"],
            },
            // Shader
            {
                test: /\.(glsl|vs|fs|vert|frag)$/,
                type: "asset/source",
                generator: {
                    filename: "asset/images/[hash][ext]",
                },
            },
            // Images
            {
                test: /\.(jpg|png|gif|svg)$/,
                type: "assets/resource",
                generator: {
                    filename: "asset/images/[hash][ext]",
                },
            },
            // CSS
            {
                test: /\.css$/,
                use: ["style-loader", "css-loader"],
            }
        ]
    }
};