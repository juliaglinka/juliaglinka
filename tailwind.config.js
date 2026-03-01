/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./dev/index.html",
    "./src/**/*.purs"
  ],
  theme: {
    extend: {
      colors: {
        accent: '#9c8b75',
        cream: '#faf8f5',
        mocha: '#8b7355',
      },
      fontFamily: {
        display: ['Playfair Display', 'serif'],
        serif: ['Cormorant Garamond', 'serif'],
        body: ['Lora', 'serif'],
        sans: ['Inter', 'sans-serif'],
        handwriting: ['Great Vibes', 'cursive'],
      },
    }
  },
  plugins: [],
}
