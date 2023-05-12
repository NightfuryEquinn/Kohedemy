/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        "just": ["Just Another Hand", "cursive"],
        "source": ["Source Sans Pro", "sans-serif"]
      },
      colors: {
        "sand": "#e6ccb2",
        "wood": "#ddb892",
        "brown": "#9c6644",
        "darkbrown": "#633d24"
      }
    },
  },
  plugins: [],
}

