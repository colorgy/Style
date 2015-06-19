# Colorgy Style [![Gem Version](https://badge.fury.io/rb/colorgy_style.svg)](http://badge.fury.io/rb/colorgy_style)

Colorgy 的樣式指南、樣式表以及前端工具包。

The front-end bundle and style guide for Colorgy.

---

- [Styleguide](#styleguide)
- [Usage](#usage)
  - [Sass and Sprockets](#sass-and-sprockets)
  - [Standalone](#standalone)
- [Project Structure](#project-structure)
  - [Assets](#assets)
    - [Stylesheets](#stylesheetscolorgy)
    - [Javascripts](#javascriptscolorgy)
- [Styles](#styles)
  - [Stylesheet Conventions](#stylesheet-conventions)
  	- [Variable Naming](#variable-naming)
    - [Authoring Examples](#authoring-examples)
    - [Living Styleguide](#living-styleguide)
- [Development](#development)
- [Contributing](#contributing)

---


## Styleguide

[Here - 這裡](https://colorgy.github.io/Style/)。


## Usage

### Sass and Sprockets

_適用於任何使用 Compass/Sass/SCSS 以及 Sprockets 的專案，例如 Ruby on Rails 或 Middleman。_

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

_colorgy.js 是一個將所有相依套件都打包在一起的集合包，所以你將不需要另外 require 像是 jquery 或 modernizr 之類的函式庫。_

_你也可以選擇只導入部分的檔案或元件，詳情請參考 [Project Structure](#project-structure) 段落。_

#### Vendor

這份懶人包同時也將一些常用的函式庫一併包含進來了，你可以查看 [assets/javascripts/vendor](https://github.com/colorgy/Style/tree/master/assets/javascripts/vendor) 以及 [assets/stylesheets/vendor](https://github.com/colorgy/Style/tree/master/assets/stylesheets/vendor) 來找出有哪些東西可以加以利用，然後在你的 JS 或 SCSS 檔中像這樣引入它們：`//= require vendor/classnames.js` (JavaScript)、`@import "vendor/animate";` (SCSS)。

### Standalone

_適用於任何專案。_

直接下載打包後的 [colorgy.css](https://raw.githubusercontent.com/colorgy/Style/gh-pages/stylesheets/colorgy.css) 與 [colorgy.js](https://raw.githubusercontent.com/colorgy/Style/gh-pages/javascripts/colorgy.js) 檔案，並加它們加到你的網頁中。所有倚賴的 JavaScript 也已經被打包進去了，所以你不需要再引入像是 jQuery 等函式庫。


## Project Structure

```
├── README.md
├── ...
├── bin
│   └── ...
├── lib
│   └── ...
├── spec
│   └── ...
├── styleguide
│   ├── layouts
│   │   └── ...
│   ├── styleblocks
│   │   └── ...
│   └── ...
└── assets
    ├── fonts
    │   └── colorgy
    │       ├── ...
    |       └── icons
    |           └── ...
    ├── images
    │   └── colorgy
    │       └── ...
    ├── stylesheets
    |   ├── ...
    |   ├── colorgy.scss
    |   ├── colorgy
    |   │   ├── application.scss
    |   │   ├── core
    |   │   │   └── ...
    |   │   ├── layouts
    |   │   │   └── ...
    |   │   ├── structures
    |   │   │   └── ...
    |   │   └── components
    |   │       └── ...
    |   └── vendor
    |       └── ...
    └── javascripts
        ├── colorgy.js
        ├── bundle.js
        ├── colorgy
        │   ├── application.js
        │   ├── components
        │   |   └── ...
        │   ├── lib
        │   |   └── ...
        │   └── modernizr.js
        └── vendor
            └── ...
```

### 專案根目錄中的檔案

- `Gemfile` 和 `Gemfile.lock` - 用於 Bundler 的 Ruby Gems 相依套件列表
- `colorgy_style.gemspec` - 此 Gem 的規格
- `config.rb` - 專案 builder、開發用伺服器 - Middleman、KSS - 的組態文件
- `Rakefile` - 定義用於此專案的 Rake tasks

### `bin/`

放置可執行的 scripts。

- `console` - 啟動 Interactive Ruby Console
- `server` - 啟動本地端開發用伺服器
- `setup` - 在初次簽出專案時自動安裝所有相依套件

### `lib/`

放置 Ruby Gem 的 Library 程式碼。

### `spec/`

放置 Ruby Gem 的整合測試。

### `styleguide/`

用於樣式指南 (Living Style Guide) 的網頁源碼。

- `layouts/` - 各 layout 的範例
- `styleblocks/` - 與各元件 (components) 搭配的展示用 HTML
- 其他檔案 - 樣式指南網頁主體

### `assets/`

前端框架本體。

#### `fonts/colorgy`

所有字型檔案。為方便與其他前端框架整合，因此所有檔案皆放置於 `colorgy` 目錄下作為 namespace。

- `icons/` - icon font 的 SVG 原檔，係由該目錄底下的 `Icons.sketch` 匯出，並使用 [Font Custom](http://fontcustom.com/) 產生字體

#### `images/colorgy`

圖片檔案。為方便與其他前端框架整合，因此所有檔案皆放置於 `colorgy` 目錄下作為 namespace。

#### `stylesheets/colorgy`

樣式表。為方便與其他前端框架整合，因此所有檔案皆放置於 `colorgy` 目錄下作為 namespace，並遵照 [MVCSS](http://mvcss.io/)-like 的目錄架構。皆使用 Sass (SCSS) 撰寫。

- `application.scss` - 主 manifest 檔，引入所有部件
- `core/` - 基礎建設，包含 `config` (預設組態)、`fonts` (字型定義)、`base` (基本樣式) `grid` (網格系統) 等最核心的部分
- `layouts/` - 各種樣式的基本頁面佈局 (頁面中唯一、將直接與 `<body>` 標籤相依)
- `structures/` - 各式[結構](http://mvcss.io/structures/)，被重複使用的排版容器
- `components/` - 各式[元件](http://mvcss.io/components/)，可獨立使用的 UI 單位

#### `javascripts/colorgy`

使元件具有基本互動功能，或是輔助 CSS 作為 polyfill 的簡單 JavaScripts 代碼。

目錄結構大略與樣式表 `stylesheets/colorgy` 一致，使得一份 css 得以搭配一份 js (若需要的話)。

- `application.js` - manifest file for Sprockets
- `lib/` - 可跨部件使用的 helpers
- `modernizr.js` - 客製化的 Modernizr

注意此專案為基本前端樣式，加入 JavaScript 僅是為了對需要的「單一」CSS 元件/架構/佈局進行輔助，因此尤須注意不得跨區污染，或使用過度複雜的架構。

#### `javascripts/vender`

可引入使用的第三方 JavaScript 函式庫。為了方便而直接加入在此專案中。


## Styles

基本 coding style 可參考專案目錄下的 `.editorconfig` 並在編輯器安裝 [EditorConfig](http://editorconfig.org/) 來遵守。

### Stylesheet Conventions

CSS 部分採用了 SMACSS 的方法論以及 BEM 命名架構 [*]，並遵從大部份 [MVCSS](http://mvcss.io/) 的準則。

- `core/` 目錄下放置了 stylesheet 核心，包含 config、helpers、基本元素 (base)、utilities (例如 `.pull-right`、`.text-center`、`.inverse`) 等
- `layouts/` 底下收納了各種頁面的佈局結構 - 沒有實際表現風格，提供排版、又或是 RWD 輔助的鷹架，class name 以 `l-` 前綴
- `components/` 中放置各式元件 - 無相依性、可重複使用的 UI 基本單位

[*]: Element 的命名使用 `.card-header` 風格，而非原始的 `.card__header`。Modifier 命名慣例則為一致，但某些慣用的 state，例如 `.active`、`.disabled`、`.open`、`.collapse`、`.dismissible` 可以直接使用 class 表示 (而這些 class 通常也參與 JS 的互動)。

#### Variable Naming

`$component-name-element-name-modifier-property-property-variant`

以上各部分解釋如下：

- `component-name`: 該變數是屬於哪個 component (若有)
- `element-name`: 該變數是屬於哪個 element (若有)，注意無需再加上重複的 `component-name`
- `modifier`: 該變數是屬於哪個 modifier (若有)，注意無需再加上重複的 `component-name` 或 `element-name`，例如 `hover`、`active`、`inverse`
- `property`: 變數內容，例如 `color`、`bg`、`padding`、`font-size`
- `property-variant`: 變數本身的變形，例如 `dark`、`large`

範例：

- `$font-family-sans-serif`、`$font-family-serif`
- `$font-size-base`、`$font-size-large`、`$font-size-small`
- `$gray-darker`
- `$text-color`、`$text-color-inverse`
- `$padding-base-vertical`、`$box-padding-base-vertical`
- `$btn-border-width`
- `$btn-color`、`$btn-success-color`

#### Authoring Examples

##### Functions

```scss
// ----- Function Name ----- //
// -> Description
//
// $arg - the argument description

@function name($arg) {
	// ...
}
```

##### Mixins

```scss
// ----- Mixin Name ----- //
// -> Description
//
// $arg - the argument description

@mixin button-variant($arg) {
	// ...
}
```

##### Components

```scss
// *************************************
//
//   Component
//   -> Description
//
//   .component--modifier - description
//
//   Styleguide StyleguideSection
//
// *************************************

// -------------------------------------
//   Variables
// -------------------------------------

// ----- Colors ----- //

// ... (with the !default flag)

// ----- Sizing ----- //

// ... (with the !default flag)

// -------------------------------------
//   Helpers
// -------------------------------------

// ...

// -------------------------------------
//   Base
// -------------------------------------

.component {
	// ...
}

// -------------------------------------
//   Scaffolding
// -------------------------------------

// ----- Scaffolding Name ----- //

.component-scaffolding {
	// ...
}

// -------------------------------------
//   Modifiers
// -------------------------------------

// ----- Modifier Name ----- //

.component--modifier {
	// ...
}
```

#### Living Styleguide

寫好一個新元件後，照慣例 (KSS) 加入檔頭註解，在 `styleguide/styleblocks` 底下建立相對應的 sample HTML code (檔名與 css 一致)，接著編輯要歸入的 styleguide section (例如 `styleguide/components.html.haml`)，將 styleblock (像是 `= styleblock 'button', section: 'Button'`) 插入即可。


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then run `bin/server` to fire up the development server, or run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To complie the icon fonts from the SVGs in `assets/fonts/colorgy/icons` (exported from `assets/fonts/colorgy/icons/Icons.sketch`), run `fontcustom compile`. Note that this requires [Font Custom](http://fontcustom.com/) to be installed on your local machine.

To deploy the style guide to GitHub Pages, simply run `bundle exec rake deploy` and the source will be builded and pushed to `gh-pages` of the origin repo.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/colorgy/Style.
