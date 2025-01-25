The presentation of various block and inline elements can be adjusted by setting `style` keys. Each category takes XSL-FO key definitions and keys specific to that style.

While the style keys may look like CSS, the keys are XSL-FO properties and the underlying PDF2 plug-in does not use CSS compatibility properties.

- Instead of `padding-top`, use `padding-before`.
- Instead of `margin-left`, use `start-indent`. Note that these two keys do not have matching semantics, see [XSL 1.1][refine-margin-space-indent].

[refine-margin-space-indent]: https://www.w3.org/TR/xsl11/#refine-margin-space-indent

There is no default theme that defines base key values. Instead, a theme extends the PDF2 default styling. If you want to define common settings, create a theme file for shared settings, and use the [`extends` key](#extending-themes) in other themes to build on the common foundation.

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

Themes support XSL-FO extension properties implemented by XSL formatters:

- `background-size = [ <length> | <percentage> | auto ]{1,2}` — Size of background image.

## Block keys

### `body`

Default body text, for example `<p>` elements.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `shortdesc`

Shortdesc and abstract styles.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `h<n>`

Topic titles. `<n>` is a number ranging from 1 to 6, representing each of the six heading levels.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `title-numbering = boolean`

### `chapter`

Chapter title.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `title-numbering = boolean`

### `chapter-toc`

Chapter table of contents.

- `maximum-level = number` — number of TOC levels to show

### `chapter-toc-<n>`

TOC entry in chapter TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `part`

Part title.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `title-numbering = boolean`

### `part-toc`

Part table of contents.

- `maximum-level = number` — number of TOC levels to show

### `part-toc-chapter`

Bookmap chapter TOC entry in part TOC.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `part-toc-<n>`

TOC entry in part TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `appendix`

Appendix title.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

<!--
- `title-numbering = boolean`
-->

### `appendix-toc`

Appendix table of contents.

- `maximum-level = number` — number of TOC levels to show

### `appendix-toc-<n>`

TOC entry in appendix TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `cover`

Cover page.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `cover-title`

Cover page title.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `content = content-template`

### `cover-titlealt`

Cover page subtitle or alternative title.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `section`

Section element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `section-title`

Section element title.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `example`

Example element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `example-title`

Example element title.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `fig`

Figure element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `caption-number = 'chapter' | 'document'` — Number figures with chapter prefix or use whole document numbering.
- `caption-position = 'before' | 'after'` — Place figure caption before or after figure.

### `fig-caption`

Figure caption.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `content`: Contents of figure caption. Supported fields are:
  - `number`: caption number
  - `title`: caption contents

### `note`

Note element with `@type` `note` or without `@type`.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `note-label`

Label for note elements.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

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

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

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

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

- `content` — Content template.

### `dl`

Definition list element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `dl-type = 'table' | 'list' | 'html'` — Style definition list as bulleted list or indented list.

### `ol`

Ordered list.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `ul`

Unordered list.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `parml`

Parameter list element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `plentry`

Parameter list entry element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `pt`

Parameter term element within a parameter list entry.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `pd`

Parameter definition element within a parameter list entry.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `pre`

Preformatted element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `codeblock`

Code block element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `line-numbering = boolean` — Line numbering.
- `show-whitespace = boolean` — Show whitespace characters.

### `table`

Table element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `caption-number = 'chapter' | 'document'` — Number figures with chapter prefix or use whole document numbering.
- `caption-position = 'before' | 'after'` — Place figure caption before or after figure.
- `table-continued = boolean` — Output "table continued" when table breaks across pages.

### `table-caption`

Table caption.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

- `content = content-template` — Contents of table caption. Supported fields are:
  - `number`: caption number
  - `title`: caption contents

### `table-header`

Table header row

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `toc`

Table of contents.

- `maximum-level = number` — number of TOC levels to show

### `toc-appendix`

Bookmap appendix TOC entry.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `toc-chapter`

Bookmap chapter TOC entry.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `toc-part`

Bookmap part TOC entry.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `toc-<n>`

TOC entry in main TOC. `<n>` is a number ranging from 1 to 6, representing each of the six TOC entry levels.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `hazardstatement`

Hazard statement element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `hazardstatement-label`

Hazard statement label element.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

### `hazardstatement-<type>-label`

Label for hazard statement elements with `@type`.

The styling properties that can be used are listed in [XSL fo:block] and [XSL extensions].

## Inline keys

### `link`

Link elements.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

- `link-url = 'true' | 'false'` — Output URL for external links after explicitly defined link text. Defaults to `false`.
- `link-page-number = 'true' | 'false'` — Generate page number reference after link text. Defaults to `true`.
- `content = content-template` — Link text template. Supported fields are:
  - `link-text`: link text
  - `pagenum`: page number reference

### `link-external`

External link elements.

- `content = content-template` — Link text template. Supported fields are:
  - `link-text`: link text
  - `url`: link URL

### `tm`

Trademark element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

- `symbol-scope = 'always' | 'chapter' | 'never'` — Output trademark symbol always, once per chapter, or never.

### `keyword`

Keyword element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `term`

Term element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `codeph`

Code phrase element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `filepath`

File path element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `cmdname`

Comment name element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `varname`

Variable name element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `userinput`

User input element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `systemoutput`

System output element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `apiname`

API name element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `option`

Option element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `parmname`

Parameter name element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `synph`

Syntax phrase element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `syntaxdiagram`

Syntax diagram element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `groupseq`

Group sequence element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `groupchoice`

Group choice element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `groupcomp`

Group composite element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `fragment`

Syntax fragment element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `fragref`

Syntax fragment reference element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `synblk`

Syntax block element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `synnote`

Syntax note element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `synnoteref`

Syntax note reference element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `kwd`

Syntax keyword element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `var`

Syntax variable element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `oper`

Syntax operator element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `delim`

Syntax delimiter character element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `sep`

Syntax separator character element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `repsep`

Syntax repeat separator character element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `b`

Bold highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `i`

Italic highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `u`

Underline highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `tt`

Teletype highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `sup`

Superscript highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `sub`

Subscript highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `line-through`

Strikethrough highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `overline`

Overline highlighting element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `markupname`

Named markup token element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `uicontrol`

User interface control element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `wintitle`

Window or dialog title element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `menucascade`

Menu cascade element used to document a series of menu choices.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

- `separator-content = content-template` — Separator between uicontrol elements, defaults to `" > "`.

### `shortcut`

Keyboard shortcut element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `screen`

Screen element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `filepath`

File path element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `xmlelement`

XML element element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `xmlatt`

XML attribute element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `textentity`

XML text entity element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `parameterentity`

XML parameter entity element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `numcharref`

XML character reference element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `xmlnsname`

XML namespace name element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

### `xmlpi`

XML processing instruction element.

The styling properties that can be used are listed in [XSL fo:inline] and [XSL extensions].

[XSL fo:inline]: https://www.w3.org/TR/xsl11/#fo_inline
[XSL fo:block]: https://www.w3.org/TR/xsl11/#fo_block
[XSL extensions]: #xsl-fo-extension-properties
