The presentation of inline elements can be adjusted by setting `style` keys. Inline keys support styling properties from [XSL fo:inline] and [XSL extensions].

## Inline keys

### `link`

Link elements.

- `link-url: 'true' | 'false'` — Output URL for external links after explicitly defined link text. Defaults to `false`.
- `link-page-number: 'true' | 'false'` — Generate page number reference after link text. Defaults to `true`.
- `content: content-template` — Link text template. Supported fields are:
  - `link-text`: link text
  - `pagenum`: page number reference

### `link-external`

External link elements.

- `content: content-template` — Link text template. Supported fields are:
  - `link-text`: link text
  - `url`: link URL

### `tm`

Trademark element.

- `symbol-scope: 'always' | 'chapter' | 'never'` — Output trademark symbol always, once per chapter, or never.

### `keyword`

Keyword element.

### `term`

Term element.

### `codeph`

Code phrase element.

### `filepath`

File path element.

### `cmdname`

Comment name element.

### `varname`

Variable name element.

### `userinput`

User input element.

### `systemoutput`

System output element.

### `apiname`

API name element.

### `option`

Option element.

### `parmname`

Parameter name element.

### `synph`

Syntax phrase element.

### `syntaxdiagram`

Syntax diagram element.

### `groupseq`

Group sequence element.

### `groupchoice`

Group choice element.

### `groupcomp`

Group composite element.

### `fragment`

Syntax fragment element.

### `fragref`

Syntax fragment reference element.

### `synblk`

Syntax block element.

### `synnote`

Syntax note element.

### `synnoteref`

Syntax note reference element.

### `kwd`

Syntax keyword element.

### `var`

Syntax variable element.

### `oper`

Syntax operator element.

### `delim`

Syntax delimiter character element.

### `sep`

Syntax separator character element.

### `repsep`

Syntax repeat separator character element.

### `b`

Bold highlighting element.

### `i`

Italic highlighting element.

### `u`

Underline highlighting element.

### `tt`

Teletype highlighting element.

### `sup`

Superscript highlighting element.

### `sub`

Subscript highlighting element.

### `line-through`

Strikethrough highlighting element.

### `overline`

Overline highlighting element.

### `markupname`

Named markup token element.

### `uicontrol`

User interface control element.

### `wintitle`

Window or dialog title element.

### `menucascade`

Menu cascade element used to document a series of menu choices.

- `separator-content: content-template` — Separator between **uicontrol** elements, defaults to “`>`”.

### `shortcut`

Keyboard shortcut element.

### `screen`

Screen element.

### `filepath`

File path element.

### `xmlelement`

XML element element.

### `xmlatt`

XML attribute element.

### `textentity`

XML text entity element.

### `parameterentity`

XML parameter entity element.

### `numcharref`

XML character reference element.

### `xmlnsname`

XML namespace name element.

### `xmlpi`

XML processing instruction element.

## XSL-FO extension properties

Themes support XSL-FO extension properties implemented by XSL formatters:

- `background-size: [ <length> | <percentage> | auto ]{1,2}` — Size of background image.

[XSL fo:inline]: https://www.w3.org/TR/xsl11/#fo_inline
[XSL extensions]: #xsl-fo-extension-properties
