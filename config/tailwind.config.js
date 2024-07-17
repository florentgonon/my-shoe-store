const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        "light-coral": "#EE7674",
        "jade": "#08B46F",
        "gamboge": "#EA9713",
        "tiffany-blue": "#A2E8DD"
      }
    },
  },
  safelist: [
    "bg-light-coral",
    "bg-jade",
    "bg-gamboge",
    "bg-tiffany-blue",
    "rounded-r-lg",
    "rounded-l-lg",
    "mb-1"
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
