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
        "gamboge": "#EA9713"
      }
    },
  },
  safelist: [
    "bg-light-coral",
    "bg-jade",
    "bg-gamboge",
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
