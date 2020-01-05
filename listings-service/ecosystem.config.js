module.exports = {
  apps: [
    {
      name: "listings-service",
      script: "dist/bundle.js",
      env: {
        PORT: 80,
        NODE_ENV: "production"
      }
    }
  ]
};
