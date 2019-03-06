# 🚀 Middleman Tailwind CSS and Webpack Starter Project 🚀

### A Git repo of a Middleman 4 project set up with Tailwind CSS and Webpack preconfigured. Which is great, because Webpack is kind of a bitch.

The webpack setup has all CSS being tree shaken (removing all unused CSS so that Tailwind isn't 400kb.) as well as minified. All Javascript is transpiled via Babel and of course minified. This is all done outside of Middleman's asset pipeline, so you probably don't want to mess around with that too too much.

On a different note, this package is definitely opinionated. I have installed all my favorite gems to get me building [client](https://www.nobullco.com) websites as quickly as possible. It includes things such as image compression, sitemap building, easy svg tags, meta tags building among other helpers and tools.

If you don't want that and just want the webpack.config.js, feel free to rip it out.

### Credits
Massive thanks to the work done by [gabrielecanepa](https://github.com/gabrielecanepa) and his work on his [middleman-webpack template](https://github.com/gabrielecanepa/middleman-webpack). It was a major help putting together this project and wouldn't have been possible without his help.
