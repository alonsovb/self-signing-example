const axios = require("axios");

(async () => {
  try {
    const response = await axios.get("https://nginx.avb"); // Use the nginx alias
    console.log(`Response from Nginx: ${response.data}`);
  } catch (error) {
    console.error(`Error: ${error.message}`);
  }
})();
