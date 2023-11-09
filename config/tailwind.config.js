module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      backgroundImage: {
        'main-image': "url('backgrounds/background.jpg')",
      },
    },
  },
  plugins: [],
}
