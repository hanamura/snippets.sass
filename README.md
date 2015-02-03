# snippets.sass

Some snippets for Sass.

## Mixins

### selector-find-append($target-selector, $appending-selector)

Find `$target-selector` from ancestors and append `$appending-selector` to the matched selector.

#### Example

```sass
// Sass

@import 'path/to/selector-find-append'

main
  article,
  section
    h1
      color: black
      font-weight: normal
      +selector-find-append('main', '.inactive')
        opacity: 0.5
      +selector-find-append('article', '.alert')
        color: red
      +selector-find-append('h1', '.strong')
        font-weight: bold
```

```css
/* CSS */

main article h1,
main section h1 {
  color: black;
  font-weight: normal;
}

main.inactive article h1,
main.inactive section h1 {
  opacity: 0.5;
}

main article.alert h1 {
  color: red;
}

main article h1.strong,
main section h1.strong {
  font-weight: bold;
}
```

### selector-find-replace($target-selector, $replacing-selector)

Find `$target-selector` from ancestors and replace the matched selector with `$replacing-selector`

#### Example

```sass
// Sass

@import 'path/to/selector-find-replace'

main
  article,
  section
    h1
      color: black
      +selector-find-replace('main', 'aside')
        opacity: 0.5
      +selector-find-replace('article', 'article a')
        color: blue
```

```css
/* CSS */

main article h1,
main section h1 {
  color: black;
}

aside article h1,
aside section h1 {
  opacity: 0.5;
}

main article a h1 {
  color: blue;
}
```

### selector-index-append($target-index, $appending-selector)

Refer `$target-index`th selector from ancestors and append `$appending-selector` to it. `1` refers to the root selector and `-1` refers to the last one.

#### Example

```sass
// Sass

@import 'path/to/selector-index-append'

main
  article,
  section
    h1
      color: black
      font-weight: normal
      +selector-find-append(1, '.inactive')
        opacity: 0.5
      +selector-find-append(-2, '.alert')
        color: red
      +selector-find-append(-1, '.strong')
        font-weight: bold
```

```css
/* CSS */

main article h1,
main section h1 {
  color: black;
  font-weight: normal;
}

main.inactive article h1,
main.inactive section h1 {
  opacity: 0.5;
}

main article.alert h1,
main section.alert h1 {
  color: red;
}

main article h1.strong,
main section h1.strong {
  font-weight: bold;
}
```

### selector-index-replace($target-index, $replacing-selector)

Refer `$target-index`th selector from ancestors and replace it with `$replacing-selector`. `1` refers to the root selector and `-1` refers to the last one.

#### Example

```sass
// Sass

@import 'path/to/selector-index-replace'

main
  article,
  section
    h1
      color: black
      +selector-index-replace(1, 'aside')
        opacity: 0.5
      +selector-find-replace(-1, 'a')
        color: blue
```

```css
/* CSS */

main article h1,
main section h1 {
  color: black;
}

aside article h1,
aside section h1 {
  opacity: 0.5;
}

main article a,
main section a {
  color: blue;
}
```

## License

MIT
