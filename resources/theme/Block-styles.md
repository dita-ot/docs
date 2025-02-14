The presentation of block elements can be adjusted by setting `style` keys. Block keys support styling properties from [XSL fo:block] and [XSL extensions].

## Block keys

### `appendix`

Appendix title.

<!--
- `title-numbering: 'true' | 'false'`
-->

### `appendix-toc`

Appendix table of contents.

- `maximum-level: <n>` — Number of TOC levels to show

### `appendix-toc-<n>`

TOC entry in appendix TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `body`

Default body text, for example `<p>` elements.

### `chapter`

Chapter title.

- `title-numbering: 'true' | 'false'`

### `chapter-toc`

Chapter table of contents.

- `maximum-level: <n>` — Number of TOC levels to show

### `chapter-toc-<n>`

TOC entry in chapter TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `codeblock`

Code block element.

- `line-numbering: 'true' | 'false'` — Line numbering.
- `show-whitespace: 'true' | 'false'` — Show whitespace characters.

### `cover`

Cover page.

### `cover-title`

Cover page title.

- `content: content-template`

### `cover-titlealt`

Cover page subtitle or alternative title.

### `dl`

Definition list element.

- `dl-type: 'table' | 'list' | 'html'` — Style definition list as bulleted list or indented list.

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

### `glossary`

Glossary title.

### `h<n>`

Topic titles. `<n>` is a number ranging from 1 to 6, representing each of the six heading levels.

- `title-numbering: 'true' | 'false'`

### `hazardstatement`

Hazard statement element.

### `hazardstatement-label`

Hazard statement label element.

### `hazardstatement-<type>-label`

Label for hazard statement elements with `@type`.

### `index`

Index title.

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

### `ol`

Ordered list.

### `parml`

Parameter list element.

### `part`

Part title.

- `title-numbering: 'true' | 'false'`

### `part-toc`

Part table of contents.

- `maximum-level: <n>` — Number of TOC levels to show

### `part-toc-chapter`

Bookmap chapter TOC entry in part TOC.

### `part-toc-<n>`

TOC entry in part TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `pd`

Parameter definition element within a parameter list entry.

### `plentry`

Parameter list entry element.

### `pre`

Preformatted element.

### `pt`

Parameter term element within a parameter list entry.

### `section`

Section element.

### `section-title`

Section element title.

### `shortdesc`

Short description and abstract styles.

### `table`

Table element.

- `caption-number: 'chapter' | 'document'` — Number figures with chapter prefix or use whole document numbering.
- `caption-position: 'before' | 'after'` — Place figure caption before or after figure.
- `table-continued: 'true' | 'false'` — Output "table continued" when table breaks across pages.

### `table-caption`

Table caption.

- `content: content-template` — Contents of table caption. Supported fields are:
  - `number`: caption number
  - `title`: caption contents

### `table-header`

Table header row

### `task-labels`

Boolean key to generate default section labels for tasks.

### `toc`

Table of contents.

- `maximum-level: <n>` — Number of TOC levels to show

### `toc-appendix`

Bookmap appendix TOC entry.

### `toc-chapter`

Bookmap chapter TOC entry.

### `toc-part`

Bookmap part TOC entry.

### `toc-<n>`

TOC entry in main TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

### `ul`

Unordered list.

[XSL fo:block]: https://www.w3.org/TR/xsl11/#fo_block
[XSL extensions]: ./Styles.md#xsl-fo-extension-properties
