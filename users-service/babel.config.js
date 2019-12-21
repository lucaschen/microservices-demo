module.exports = {
  plugins: [
    [
      "module-resolver",
      {
        alias: {
          "#root": "./src"
        }
      }
    ]
  ],
  presets: [
    [
      "@babel/preset-env",
      {
        targets: {
          node: "current"
        }
      }
    ]
  ]
};
