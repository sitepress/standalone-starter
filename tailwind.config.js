/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./pages/**/*.*",
    "./models/**/*.*",
    "./helpers/**/*.*",
    "./layouts/**/*.*",
    "./partials/**/*.*"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
}
