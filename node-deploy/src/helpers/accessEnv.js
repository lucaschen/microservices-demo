const cache = {};

const accessEnv = (key, defaultValue) => {
  if (cache[key]) return cache[key];
  
  if (!(key in process.env)) {
    if (defaultValue) return defaultValue;
    throw new Error(`${key} not found in process.env! and default value was not set`);
  }

  cache[key] = process.env[key];

  return cache[key];
};

module.exports = accessEnv;
