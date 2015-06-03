# Colorgy Style [![Gem Version](https://badge.fury.io/rb/colorgy_style.svg)](http://badge.fury.io/rb/colorgy_style)

Colorgy 的樣式指南、樣式表以及前端工具包。

The front-end bundle and style guide for Colorgy. Builded on top of Bootstrap, following architecture inspired by [SMACSS](https://smacss.com/) and [MVCSS](http://mvcss.io/).

## Installation

### Ruby on Rails or Sass and Sprockets

將以下這行加入 Gemfile 裡：

```ruby
gem 'colorgy_style'
```

然後執行：

    $ bundle

#### Import Stylesheets (Using Sass)

在 `app/assets/stylesheets/application.scss` 或其他想要的地方引入 Colorgy 樣式表：

```scss
@import "colorgy_sprockets";
@import "colorgy";
```

_你也可以只拆出部分元件使用，或是調整一些變數，詳情請參考 [Project Structure](#project-structure) 段落。_

#### Require JavaScripts (Using Sprockets)

在 `app/assets/javascripts/application.js` 或其他需要的地方導入 JavaScripts：

```js
//= require colorgy
```

_colorgy 是一個將所有相依套件都打包在一起的集合包，所以你將不需要另外 require 像是 jquery 或 modernizr 之類的函式庫。_

_你也可以選擇只導入部分的檔案或元件，詳情請參考 [Project Structure](#project-structure) 段落。_

#### Vendor

這份懶人包同時也將一些常用的函式庫一併包含進來了，你可以查看 [assets/javascripts/vendor](https://github.com/colorgy/Style/tree/master/assets/javascripts/vendor) 以及 [assets/stylesheets/vendor](https://github.com/colorgy/Style/tree/master/assets/stylesheets/vendor) 來找出有哪些東西可以加以利用，然後在你的 JS 或 SCSS 檔中像這樣引入它們：`//= require vendor/classnames.js` (JavaScript)、`@import "vendor/animate";` (SCSS)。

## Project Structure

TODO: Write this.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then run `bin/server` to fire up the development server, or run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To deploy the builded style guide to GitHub Pages, simply run `bundle exec rake deploy` and the source will be builded and pushed to `gh-pages` of the origin repo.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/colorgy/Style.

