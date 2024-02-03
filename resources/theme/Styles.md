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

## Block keys

### `body`

Default body text, for example `<p>` elements.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `shortdesc`

Shortdesc and abstract styles.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `h1`

First-level topic titles.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `title-numbering = boolean`

### `h2`

Second-level topic titles.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `title-numbering = boolean`

### `h3`

Third-level topic titles.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `title-numbering = boolean`

### `h4`

Fourth-level topic titles.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `title-numbering = boolean`

### `cover`

Cover page.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `cover-title`

Cover page title.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `content = content-template`

### `cover-titlealt`

Cover page subtitle or alternative title.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `section`

Section element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `section-title`

Section element title.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `dl`

Definition list element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `dl-type = 'table' | 'list' | 'html'` — Style definition list as bulleted list or indented list.

### `example`

Example element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `example-title`

Example element title.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `fig`

Figure element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `caption-number = 'chapter' | 'document'` — Number figures with chapter prefix or use whole document numbering.
- `caption-position = 'before' | 'after'` — Place figure caption before or after figure.

### `fig-caption`

Figure caption.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `content`: Contents of figure caption. Supported fields are:
  - `number`: caption number
  - `title`: caption contents

### `note`

Note element with `@type` `note` or without `@type`.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `note-label`

Label for note elements.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

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

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `note-<type>-label`

Label for note elements with `@type`.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

- `content` — Content template.

### `ol`

Ordered list.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `ul`

Unordered list.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `pre`

Preformatted element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `codeblock`

Code block element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `line-numbering = boolean` — Line numbering.
- `show-whitespace = boolean` — Show whitespace characters.

### `table`

Table element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `caption-number = 'chapter' | 'document'` — Number figures with chapter prefix or use whole document numbering.
- `caption-position = 'before' | 'after'` — Place figure caption before or after figure.
- `table-continued = boolean` — Output "table continued" when table breaks across pages.

### `table-caption`

Table caption.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

- `content = content-template` — Contents of table caption. Supported fields are:
  - `number`: caption number
  - `title`: caption contents

### `table-header`

Table header row

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `toc-1`

First-level TOC entry.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `toc-2`

Second-level TOC entry.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `toc-3`

Third-level TOC entry.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `toc-4`

Fourth-level TOC entry.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `parml`

Parameter list element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `plentry`

Parameter list entry element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `pt`

Parameter term element within a parameter list entry.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `pd`

Parameter definition element within a parameter list entry.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `hazardstatement`

Hazard statement element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `hazardstatement-label`

Hazard statement label element.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

### `hazardstatement-<type>-label`

Label for hazard statement elements with `@type`.

The styling properties that can be used are listed in [XSL fo:block](https://www.w3.org/TR/xsl11/#fo_block).

## Inline keys

### `link`

Link elements.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

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

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

- `symbol-scope = 'always' | 'chapter' | 'never'` — Output trademark symbol always, once per chapter, or never.

### `keyword`

Keyword element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `term`

Term element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `codeph`

Code phrase element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `filepath`

File path element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `cmdname`

Comment name element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `varname`

Variable name element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `userinput`

User input element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `systemoutput`

System output element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `apiname`

API name element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `option`

Option element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `parmname`

Parameter name element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `synph`

Syntax phrase element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `syntaxdiagram`

Syntax diagram element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `groupseq`

Group sequence element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `groupchoice`

Group choice element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `groupcomp`

Group composite element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `fragment`

Syntax fragment element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `fragref`

Syntax fragment reference element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `synblk`

Syntax block element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `synnote`

Syntax note element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `synnoteref`

Syntax note reference element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `kwd`

Syntax keyword element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `var`

Syntax variable element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `oper`

Syntax operator element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `delim`

Syntax delimiter character element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `sep`

Syntax separator character element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `repsep`

Syntax repeat separator character element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `b`

Bold highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `i`

Italic highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `u`

Underline highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `tt`

Teletype highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `sup`

Superscript highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `sub`

Subscript highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `line-through`

Strikethrough highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `overline`

Overline highlighting element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `markupname`

Named markup token element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `uicontrol`

User interface control element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `wintitle`

Window or dialog title element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `menucascade`

Menu cascade element used to document a series of menu choices.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `shortcut`

Keyboard shortcut element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `screen`

Screen element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `filepath`

File path element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `xmlelement`

XML element element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `xmlatt`

XML attribute element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `textentity`

XML text entity element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `parameterentity`

XML parameter entity element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `numcharref`

XML character reference element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `xmlnsname`

XML namespace name element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).

### `xmlpi`

XML processing instruction element.

The styling properties that can be used are listed in [XSL fo:inline](https://www.w3.org/TR/xsl11/#fo_inline).
