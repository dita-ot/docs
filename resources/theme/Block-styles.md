The presentation of block elements can be adjusted by setting `style` keys. Block keys support styling properties from [XSL fo:block] and [XSL extensions].

## Block keys

### `body`

Default body text, for example `<p>` elements.

### `shortdesc`

Short description and abstract styles.

### `h<n>`

Topic titles. `<n>` is a number ranging from 1 to 6, representing each of the six heading levels.

- `title-numbering: boolean`

### `chapter`

Chapter title.

- `title-numbering: boolean`

### `chapter-toc`

Chapter table of contents.

- `maximum-level: number` — number of TOC levels to show

### `chapter-toc-<n>`

TOC entry in chapter TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `part`

Part title.

- `title-numbering: boolean`

### `part-toc`

Part table of contents.

- `maximum-level: number` — number of TOC levels to show

### `part-toc-chapter`

Bookmap chapter TOC entry in part TOC.

### `part-toc-<n>`

TOC entry in part TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `appendix`

Appendix title.

<!--
- `title-numbering: boolean`
-->

### `appendix-toc`

Appendix table of contents.

- `maximum-level: number` — number of TOC levels to show

### `appendix-toc-<n>`

TOC entry in appendix TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `cover`

Cover page.

### `cover-title`

Cover page title.

- `content: content-template`

### `cover-titlealt`

Cover page subtitle or alternative title.

### `section`

Section element.

### `section-title`

Section element title.

### `example`

Example element.

### `example-title`

Example element title.

### `fig`

Figure element.

- `caption-number: 'chapter' | 'document'` — Number figures with chapter prefix or use whole document numbering.
- `caption-position: 'before' | 'after'` — Place figure caption before or after figure.

### `fig-caption`

Figure caption.

- `content`: Contents of figure caption. Supported fields are:
  - `number`: caption number
  - `title`: caption contents

### `note`

Note element with `@type` `note` or without `@type`.

### `note-label`

Label for note elements.

- `content` — Content template.

### `note-<type>`

Note element with `@type`. Type values are:

- `note`
- `tip`
- `fastpath`
- `restriction`
- `important`
- `remember`
- `attention`
- `caution`
- `notice`
- `danger`
- `warning`
- `trouble`
- `other`

To add an image to a note, use the `background-image` property.

```yaml
style:
  note-other:
    background-image: legal.svg
    background-repeat: no-repeat
    # image width plus padding
    padding-start: 60pt + 1em
    # image width plus parent indentation
    start-indent: 60pt + from-parent(start-indent)
```

### `note-<type>-label`

Label for note elements with `@type`.

- `content` — Content template.

### `dl`

Definition list element.

- `dl-type: 'table' | 'list' | 'html'` — Style definition list as bulleted list or indented list.

### `ol`

Ordered list.

### `ul`

Unordered list.

### `parml`

Parameter list element.

### `plentry`

Parameter list entry element.

### `pt`

Parameter term element within a parameter list entry.

### `pd`

Parameter definition element within a parameter list entry.

### `pre`

Preformatted element.

### `codeblock`

Code block element.

- `line-numbering: boolean` — Line numbering.
- `show-whitespace: boolean` — Show whitespace characters.

### `table`

Table element.

- `caption-number: 'chapter' | 'document'` — Number figures with chapter prefix or use whole document numbering.
- `caption-position: 'before' | 'after'` — Place figure caption before or after figure.
- `table-continued: boolean` — Output "table continued" when table breaks across pages.

### `table-caption`

Table caption.

- `content: content-template` — Contents of table caption. Supported fields are:
  - `number`: caption number
  - `title`: caption contents

### `table-header`

Table header row

### `toc`

Table of contents.

- `maximum-level: number` — number of TOC levels to show

### `toc-appendix`

Bookmap appendix TOC entry.

### `toc-chapter`

Bookmap chapter TOC entry.

### `toc-part`

Bookmap part TOC entry.

### `toc-<n>`

TOC entry in main TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `hazardstatement`

Hazard statement element.

### `hazardstatement-label`

Hazard statement label element.

### `hazardstatement-<type>-label`

Label for hazard statement elements with `@type`.

## XSL-FO extension properties

Themes support XSL-FO extension properties implemented by XSL formatters:

- `background-size: [ <length> | <percentage> | auto ]{1,2}` — Size of background image.

[XSL fo:block]: https://www.w3.org/TR/xsl11/#fo_block
[XSL extensions]: #xsl-fo-extension-properties
