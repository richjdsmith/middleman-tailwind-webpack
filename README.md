# 🚀 Middleman Tailwind CSS and Webpack Starter Project 🚀

### A Git repo of a Middleman 4 project set up with Tailwind CSS and Webpack preconfigured. Which is great, because Webpack is kind of a bitch.

The webpack setup has all CSS being tree shaken (removing all unused CSS so that Tailwind isn't 400kb.) as well as minified. All Javascript is transpiled via Babel and of course minified. This is all done outside of Middleman's asset pipeline, so you probably don't want to mess around with that too too much.

On a different note, this package is definitely opinionated. I have installed all my favorite gems to get me building [client](https://www.nobullco.com) websites as quickly as possible. It includes things such as image compression, sitemap building, easy svg tags, meta tags building among other helpers and tools.

If you don't want that and just want the webpack.config.js, feel free to rip it out.

### Credits

Massive thanks to the work done by [gabrielecanepa](https://github.com/gabrielecanepa) and his work on his [middleman-webpack template](https://github.com/gabrielecanepa/middleman-webpack). It was a major help putting together this project and wouldn't have been possible without his help.

Looking through [arandilopez's](arandilopez/arandilopez.me) repo for his personal site ([https://github.com/arandilopez/arandilopez.me](https://github.com/arandilopez/arandilopez.me)) was very helpful as well.

---

## Install Instructions & Details

The following section is from the original [middleman-webpack template](https://github.com/gabrielecanepa/middleman-webpack) repo mentioned above; some steps are helpful for setup.

This is a template for [**Middleman 4**](https://middlemanapp.com).

It integrates some of the best modern tools and snippets to create advanced static websites.

It's mainly based on [**Yarn**](https://yarnpkg.com), a reliable and easy to use package manager, [**webpack**](https://webpack.js.org), a module bundler capable of packaging almost any kind of asset, and [**Sass**](https://sass-lang.com), one of the most powerful CSS extension language.

All this combined with the simplicity of _Ruby and its gems_, some reinvented _powerful snippets_, and the _best available linters and debuggers_.

## Table of contents

-   [What's included?](#whats-included)
-   [Dependencies](#dependencies)
-   [Installation](#installation)
-   [Usage](#usage)
    -   [Getting started](#getting-started)
    -   [Styling](#styling)
    -   [Using Yarn and webpack](#using-yarn-and-webpack)
    -   [Images](#images)
    -   [Building and deploying](#building-and-deploying)
-   [Extra](#extra)
    -   [Testing and linters](#testing-and-linters)
    -   [404 page](#404-page)
-   [Contributing](#contributing)
-   [License](#license)

## What's included?

#### Core

-   [Middleman](https://middlemanapp.com)
-   [Yarn](https://yarnpkg.com)
-   [webpack](https://webpack.js.org) with [Babel](https://babeljs.org)
-   [Sass](https://sass-lang.com)
-   [Slim templating](http://slim-lang.com)

#### Middleman extensions

-   [Autoprefixer](https://github.com/middleman/middleman-autoprefixer)
-   [Deploy](https://github.com/karlfreeman/middleman-deploy)
-   [Dotenv](https://github.com/karlfreeman/middleman-dotenv)
-   [Favicon maker](https://github.com/follmann/middleman-favicon-maker)
-   [Livereload](https://github.com/middleman/middleman-livereload)
-   [Meta tags](https://github.com/gabrielecanepa/middleman-meta-tags)
-   [Minify HTML](https://github.com/middleman/middleman-minify-html)
-   [Pry](https://github.com/AndrewKvalheim/middleman-pry)
-   [Robots](https://github.com/yterajima/middleman-robots)

#### Snippets

-   [Inline SVGs](#images)
-   [Favicon helper](#favicon)
-   [404 page](#404-page)

#### Linters

-   [ESLint](https://eslint.org) for JavaScript
-   [RuboCop](https://github.com/rubocop-hq/rubocop) for Ruby
-   [stylelint](https://stylelint.io) for SCSS

#### Debuggers

-   [Pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
-   [Rake](https://github.com/ruby/rake)

## Dependencies

You must have the following tools installed to use this boilerplate:

-   [Bundler](https://bundler.io)
-   [Node](https://nodejs.org) (> v4)
-   [Yarn](https://yarnpkg.com)

## Installation

Start a new project in your current directory

```bash
$ middleman init -T gabrielecanepa/middleman-webpack
```

or in a new one:

```bash
$ middleman init <project-name> -T gabrielecanepa/middleman-webpack
```

You can also set up an alias like `middleman:webpack` in one of your shell profiles

```bash
# ~/.bash_profile
alias middleman:webpack="middleman init $1 gabrielecanepa/middleman-webpack"
```

and use it to quickly initialize a new project.

## Usage

> 💡 A good usage example, that will be used through this wiki, is the same [documentation website](https://github.com/gabrielecanepa/middleman-webpack-www) of the template

```bash
$ middleman server   # Run a local server
$ middleman build    # Build the static files
$ middleman deploy   # Deploy the built site
```

### Getting started

You'll find the main settings of your website in `data/site.yml`.

The properties you set up here will be used by the `auto_display_meta_tag` helper to inject specific tags in your views.

The default configuration

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen1.png?sanitize=true)

produces the following tags for the homepage:

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen2.png?sanitize=true)

Any tag can be overwritten (or created) in each page or layout with the `set_meta_tag` helper (see `source/index.html.erb`)

```erb
<% set_meta_tags title: data.site.name + ": " + data.site.description,
                 full_title: false %>
```

or [frontmatter](https://middlemanapp.com/basics/frontmatter) (see `source/404.html.erb`):

```yaml
---
title: Page not found
description: This page was not found by Middleman webpack 🤔
keywords: page, not, found
---
```

> 💡 The full title option is set to true by default, and uses `-` as separator.
> You can set this option to false to use an indipendant title, or change the symbol you want to use as separator (e.g. `<% set_meta_tags title: "Secondary page", separator: '∙' %>`)

#### Favicon

The icon you specify in the **favicon** field (`_favicon.svg` by default) must be relative to `source/assets/images`.

The leading underscore prevents it from being copied into the build directory.
The image format should be either PNG or SVG.

In production, it will be used to generate your favicons and show the correspondent tags in your layouts, thanks to the `auto_display_favicon_tags` helper.

You can change the favicons you want to produce in your `config.rb`, and the tags generated by the helper will change dynamically.

The favicons set by default

```ruby
# config.rb
set :favicons, [
  {
    rel: 'apple-touch-icon',
    size: '180x180',
    icon: 'apple-touch-icon.png'
  },
  {
    rel: 'icon',
    type: 'image/png',
    size: '32x32',
    icon: 'favicon32x32.png'
  },
  {
    rel: 'icon',
    type: 'image/png',
    size: '16x16',
    icon: 'favicon16x16.png'
  },
  {
    rel: 'shortcut icon',
    size: '64x64,32x32,24x24,16x16',
    icon: 'favicon.ico'
  }
]
```

generate the following tags and relative icons:

```html
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon16x16.png">
<link rel="shortcut icon" sizes="64x64,32x32,24x24,16x16" href="favicon.ico">
```

### Styling

This repo has been updated to use [Tailwind CSS 1.x](https://tailwindcss.com/). It's fairly opinionated, but a great way to style apps.

#### 1. Settings

Your website setting must be imported first and contain the variables, mixins and rules you will use in your style. Check the [Sass documentation](https://sass-lang.com/documentation/file.SASS_REFERENCE) for a better usage of this tools.

#### 2. Vendors

Import external stylesheets right after your website settings, and before any eventual setting overriding the default library configuration.

Any stylesheet added with Yarn can be imported into your stylesheet files with an `@import` statement followed by the path relative to the `node_modules` folder.

> 💡 You can also import stylesheets in your JavaScript files.
> Check the [Yarn and webpack section](#importing-stylesheets)

### Using Yarn and webpack

The repository comes configured with [**Yarn**](https://yarnpkg.com), [**webpack**](https://webpack.js.org) and the following loaders:

-   [Babel](https://babeljs.io) for JavaScript
-   [style-loader](https://github.com/webpack-contrib/style-loader), [css-loader](https://github.com/webpack-contrib/css-loader), and [sass-loader](https://github.com/webpack-contrib/sass-loader) for CSS and SCSS

webpack has been integrated thanks to the in-built external pipeline extension (find the configuration in `config.rb`), that allows Middleman to run multiple subprocesses.

Every time a server is run (in development or production), also the relative Yarn command gets executed (`yarn run start` or `yarn run build`), which runs, in turn, the right webpack process.

> 💡 Want to set up your application with a different JavaScript pipeline? Have a look at the relative [Middleman documentation](https://middlemanapp.com/advanced/external-pipeline)

#### Installing packages

You can install a new package with the following command:

```shell
yarn add <package-name> [--dev]
```

In your JavaScript files, import modules from a package with the `import` command:

```javascript
import tippy from 'tippy.js';

tippy.setDefaults({
  arrow: true,
  arrowType: 'round',
  duration: [275, 200],
  inertia: true
});
```

#### Importing stylesheets

You can also import CSS and SCSS in your scripts by following the path relative to the `node_modules` folder.

For example, to import the same Bootstrap grid style:

```javascript
import 'bootstrap/scss/bootstrap-grid.scss';
```

> 💡 If you want to extract CSS/SCSS into separate files check the [mini-css-extractor-plugin](https://www.npmjs.com/package/mini-css-extract-plugin)

#### Advanced configuration

webpack it is capable of transforming, bundling, or packaging just about any resource or asset, but can be tricky to configure.

If you want to understand and master a wide variety of tools and features that this tool offers, have a look at the [official webpack guides](https://webpack.js.org/guides).

### Images

You can embed inline SVG icons in your views thanks to the `svg_tag` helper:

```ruby
svg_tag(file_name, attributes = {})
```

The `file_name` has to be relative to your images folder. HTML `attributes` (id, class, title, etc.) can be specified directly with the helper.

The biggest advantage of using inline SVGs is being able to have complete control over the different shapes using CSS and JavaScript (check the footer of the documentation website 😎).

You can find an example in your `source/index.html.erb`:

```erb
<%= svg_tag "logo.svg", class: "middleman-logo" %>
```

### Building and deploying

Finally, when you are ready to deliver static code, you will need to build the site. Using the command-line, from the project folder, run the corresponding Middleman command:

```bash
$ middleman build
```

This will create a static file for each file located in your source folder, compile your webpack bundles, and generate the specified favicons.

Any enabled build-time features (such as minification and compression) will be executed. You can find the extensions already activated in the build-specific section of your `config.rb`.

After building the site you will have everything you need within the `build` directory.

A very handy tool to deploy a build is [middleman-deploy](https://github.com/karlfreeman/middleman-deploy). By default, it has been configured to deploy your website on [GitHub Pages](https://pages.github.com) via the `gh-pages` branch, and build the static files before any new deployment.

To activate the extension, simply run from your command-line:

```bash
$ middleman deploy
```

## Extra

### Testing and linters

You can test your code thanks to the [Rake gem](https://github.com/ruby/rake), that allows to write tests and tasks in standard Ruby syntax.

By default, 3 tasks have been defined, each one testing the style for a specific language (JavaScript, SCSS and Ruby). Run them with the `rake` command:

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen3.png?sanitize=true)

If you use [Atom](https://atom.io) as text editor, you can install [linter-eslint](https://atom.io/packages/linter-eslint), [linter-rubocop](https://atom.io/packages/linter-rubocop) and [linter-stylelint](https://atom.io/packages/linter-stylelint) to check your style while you type. If you use [Sublime Text](https://www.sublimetext.com), have a look at the [ESLint](https://packagecontrol.io/packages/ESLint), [RuboCop](https://packagecontrol.io/packages/RuboCop) and [stylelint](https://packagecontrol.io/packages/SublimeLinter-stylelint) packages.

### 404 page

A simple 404 page has already been provided. Use it to display a custom page when visitors attempt to access paths that you haven't defined:

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen4.png?sanitize=true)

## Contributing

1.  [Fork the repository](https://github.com/gabrielecanepa/middleman-webpack)
2.  Create your feature branch (`git checkout -b my-new-feature`)
3.  Commit your changes (`git commit -m "Add some feature"`)
4.  Push to the branch (`git push origin my-new-feature`)
5.  Create a new pull request

## License

[MIT](https://gabrielecanepa.mit-license.org)