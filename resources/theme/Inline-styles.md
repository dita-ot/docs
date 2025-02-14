The presentation of inline elements can be adjusted by setting `style` keys. Inline keys support styling properties from [XSL fo:inline] and [XSL extensions].

## Inline keys

### `apiname`

API name element.

### `b`

Bold highlighting element.

### `cmdname`

Comment name element.

### `codeph`

Code phrase element.

### `delim`

Syntax delimiter character element.

### `filepath`

File path element.

### `fragment`

Syntax fragment element.

### `fragref`

Syntax fragment reference element.

### `groupchoice`

Group choice element.

### `groupcomp`

Group composite element.

### `groupseq`

Group sequence element.

### `i`

Italic highlighting element.

### `keyword`

Keyword element.

### `kwd`

Syntax keyword element.

### `line-through`

Strikethrough highlighting element.

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

### `markupname`

Named markup token element.

### `menucascade`

Menu cascade element used to document a series of menu choices.

- `separator-content: content-template` — Separator between **uicontrol** elements, defaults to “`>`”.

### `numcharref`

XML character reference element.

### `oper`

Syntax operator element.

### `option`

Option element.

### `overline`

Overline highlighting element.

### `parameterentity`

XML parameter entity element.

### `parmname`

Parameter name element.

### `repsep`

Syntax repeat separator character element.

### `screen`

Screen element.

### `sep`

Syntax separator character element.

### `shortcut`

Keyboard shortcut element.

### `sub`

Subscript highlighting element.

### `sup`

Superscript highlighting element.

### `synblk`

Syntax block element.

### `synnote`

Syntax note element.

### `synnoteref`

Syntax note reference element.

### `synph`

Syntax phrase element.

### `syntaxdiagram`

Syntax diagram element.

### `systemoutput`

System output element.

### `term`

Term element.

### `textentity`

XML text entity element.

### `tm`

Trademark element.

- `symbol-scope: 'always' | 'chapter' | 'never'` — Output trademark symbol always, once per chapter, or never.

### `tt`

Teletype highlighting element.

### `u`

Underline highlighting element.

### `uicontrol`

User interface control element.

### `userinput`

User input element.

### `var`

Syntax variable element.

### `varname`

Variable name element.

### `wintitle`

Window or dialog title element.

### `xmlatt`

XML attribute element.

### `xmlelement`

XML element element.

### `xmlnsname`

XML namespace name element.

### `xmlpi`

XML processing instruction element.

[XSL fo:inline]: https://www.w3.org/TR/xsl11/#fo_inline
[XSL extensions]: ./Styles.md#xsl-fo-extension-properties
