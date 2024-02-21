The following common Markdown constructs are processed in the same way for both `mdita` and `markdown` topics.

## Hard line breaks

A line break that is preceded by two or more spaces is parsed as a hard line break. Because DITA doesn’t have a `<br>` element for line break, hard line breaks are converted into `<?linebreak?>` processing instructions.

```markdown
foo··
baz
```

```xml
<p>foo<?linebreak?>baz</p>
```

The LwDITA plug-in contains extensions for HTML5 and PDF outputs to generate line breaks.

## Links

The format of local link targets is detected based on file name extension. The following extensions are treated as DITA files:

| extension   | format     |
| ----------- | ---------- |
| `.dita`     | `dita`     |
| `.xml`      | `dita`     |
| `.md`       | `markdown` |
| `.markdown` | `markdown` |

All other link targets detect the `format` from the file name extension and are treated as non-DITA files. Absolute link targets are treated as external scope links:

```markdown
[Markdown](test.md)
[DITA](test.dita)
[HTML](test.html)
[External](http://www.example.com/test.html)
```

```xml
<xref href="test.md">Markdown</xref>
<xref href="test.dita">DITA</xref>
<xref href="test.html" format="html">HTML</xref>
<xref href="http://www.example.com/test.html" format="html" scope="external">External</xref>
```

## Images

Images used in inline content are processed with inline placement. If a block-level image contains a title, it is treated as an image wrapped in a figure element:

```markdown
An inline ![Alt](test.jpg).

![Alt](test.jpg)

![Alt](test.jpg 'Title')
```

```xml
<p>An inline <image href="test.jpg"><alt>Alt</alt></image>.</p>
<image href="test.jpg" placement="break">
  <alt>Alt</alt>
</image>
<fig>
  <title>Title</title>
  <image href="test.jpg">
    <alt>Alt</alt>
  </image>
</fig>
```

## Key references

Keys can be referenced using standard Markdown syntax for [shortcut reference links]:

```markdown
[key]
[link text][key]
![image-key]
```

```xml
<xref keyref="key"/>
<xref keyref="key">link text</xref>
<image keyref="image-key"/>
```

## Inline

The following inline elements are supported:

```markdown
**bold**
_italic_
`code`
~~strikethrough~~
```

```xml
<b>bold</b>
<i>italic</i>
<codeph>code</codeph>
<ph status="deleted">strikethrough</ph>
```

## Lists

Standard Markdown syntax is used for both ordered (numbered) and unordered (bulleted) lists.

Unordered list items can be marked up using either asterisks “`*`” or hyphens “`-`” as list markers:

<!-- Prevent Prettier from “fixing” mixed list items -->
<!-- prettier-ignore-start -->
```markdown
* one
* two
  - three
  - four
```
<!-- prettier-ignore-end -->

```xml
<ul>
  <li>one</li>
  <li>two
    <ul>
      <li>three</li>
      <li>four</li>
    </ul>
  </li>
</ul>
```

Ordered lists use either numbers or number signs “`#`”, followed by a period:

```markdown
1.  one
2.  two
    #. three
    #. four
```

```xml
<ol>
  <li>one</li>
  <li>two
    <ol>
      <li>three</li>
      <li>four</li>
    </ol>
  </li>
</ol>
```

> **Note:** Markdown DITA supports both loose and [tight] list spacing (with no blank lines between list items). MDITA treats all lists as [loose], and wraps each list item in a paragraph (`<li><p>item</p></li>`).

Definition lists use the [PHP Markdown Extra](https://michelf.com/projects/php-markdown/extra/#def-list) format with a single-line term followed by a colon and the definition:

```markdown
Term
: Definition.
```

```xml
<dl>
  <dlentry>
    <dt>Term</dt>
    <dd>Definition.</dd>
  </dlentry>
</dl>
```

Each definition list entry must have only one term and contain only inline content.

## Metadata

A [YAML] metadata block as defined in the [pandoc_metadata_block] extension can be used to specify metadata elements for the DITA prolog.

The supported elements are:

- `author`
- `source`
- `publisher`
- `permissions`
- `audience`
- `category`
- `keyword`
- `resourceid`

Any unrecognized keys are output using the `<data>` element.

```markdown
---
author:
  - Author One
  - Author Two
source: Source
publisher: Publisher
permissions: Permissions
audience: Audience
category: Category
keyword:
  - Keyword1
  - Keyword2
resourceid:
  - Resourceid1
  - Resourceid2
workflow: review
---

# Sample with YAML header
```

```xml
<title>Sample with YAML header</title>
<prolog>
  <author>Author One</author>
  <author>Author Two</author>
  <source>Source</source>
  <publisher>Publisher</publisher>
  <permissions view="Permissions"/>
  <metadata>
    <audience audience="Audience"/>
    <category>Category</category>
    <keywords>
      <keyword>Keyword1</keyword>
      <keyword>Keyword2</keyword>
    </keywords>
  </metadata>
  <resourceid appid="Resourceid1"/>
  <resourceid appid="Resourceid2"/>
  <data name="workflow" value="review"/>
</prolog>
```

[loose]: https://spec.commonmark.org/0.30/#loose
[pandoc_metadata_block]: https://pandoc.org/MANUAL.html#extension-yaml_metadata_block 'pandoc_metadata_block'
[shortcut reference links]: https://spec.commonmark.org/0.30/#shortcut-reference-link
[tight]: https://spec.commonmark.org/0.30/#tight
[YAML]: https://www.yaml.org/ 'YAML'
