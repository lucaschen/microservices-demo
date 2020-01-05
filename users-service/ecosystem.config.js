module.exports = {
  apps: [
    {
      name: "users-service",
      script: "dist/bundle.js",
      env: {
        PORT: 80,
        NODE_ENV: "production"
      }
    }
  ]
};
