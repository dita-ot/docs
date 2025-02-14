The presentation of various [block](./Block-styles.md) and [inline](./Inline-styles.md) elements can be adjusted by setting `style` keys. Each category takes XSL-FO key definitions and keys specific to that style.

While the style keys may look like CSS, the keys are XSL-FO properties and the underlying PDF2 plug-in does not use CSS compatibility properties.

- Instead of `padding-top`, use `padding-before`.
- Instead of `margin-left`, use `start-indent`. Note that these two keys do not have matching semantics, see [XSL 1.1][refine-margin-space-indent].

The built-in `default` theme defines base key values that extend the PDF2 default styling. To define common settings of your own, create a theme file for shared settings, and use the [`extends` key](./Extending-themes.md) in other themes to build on the common foundation.

```yaml
style:
  body:
    font-family: serif
    font-size: 12pt
    space-after: 6pt
    space-before: 6pt
    start-indent: 25pt
  topic:
    font-family: sans-serif
    font-size: 26pt
  link:
    color: blue
    text-decoration: underline
```

## XSL-FO extension properties

In addition to the block and inline styles, themes support XSL-FO extension properties implemented by XSL formatters:

- `background-size: [ <length> | <percentage> | auto ]{1,2}` — Size of background image.

[refine-margin-space-indent]: https://www.w3.org/TR/xsl11/#refine-margin-space-indent
