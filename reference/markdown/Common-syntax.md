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

All other link targets use `format` from file name extension and are treated as non-DITA files. Absolute links targets are treated as external scope links:

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

Images used in inline content will result in inline placement. If a block level image contains a title, it will be treated as an image wrapped in figure:

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

Unordered can be marked up with either hyphen or asterisk:

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

Ordered can be marked up with either number or number sign, followed by a period:

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

Definition lists use the [PHP Markdown Extra](https://michelf.com/projects/php-markdown/extra/#def-list) format:

```markdown
Term
: Definition.
```

```xml
<dl>
  <dlentry>
    <dt>Term</dt>
    <dd>Defintion.</dd>
  </dlentry>
</dl>
```

Each definition entry must have only one term and contain only inline content.

## Metadata

[YAML] metadata block as defined in Pandoc [pandoc_metadata_block] can be used to specify different metadata elements. The supported elements are:

- `author`
- `source`
- `publisher`
- `permissions`
- `audience`
- `category`
- `keyword`
- `resourceid`

Unrecognized keys are output using `data` element.

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

[pandoc_metadata_block]: https://pandoc.org/MANUAL.html#extension-yaml_metadata_block 'pandoc_metadata_block'
[shortcut reference links]: https://spec.commonmark.org/0.30/#shortcut-reference-link
[YAML]: https://www.yaml.org/ 'YAML'
