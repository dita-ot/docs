MDITA is the [Lightweight DITA][LwDITA] authoring format based on [Markdown].

It is designed for users who want to write structured content with the minimum of overhead, but who also want to take advantage of the reuse mechanisms associated with the DITA standard and the multi-channel publishing afforded by standard DITA tooling.

The _MDITA_ format uses [CommonMark] as the underlying markup language.

The MDITA parser included in the `org.lwdita` plug-in provides preliminary support for MDITA and additional Markdown constructs as described in this syntax reference.

To apply LwDITA-specific processing to Markdown topics, set the `@format` attribute to `mdita`:

```xml
<map>
  <topicref href="mdita-topic.md" format="mdita"/>
</map>
```

In this case, the first paragraph in the topic will be treated as a short description, and tables will be converted to DITA `<simpletable>` elements.

## MDITA Syntax

The MDITA parser processes topics according to the MDITA _“Extended profile”_ proposed for LwDITA. The _"Core profile"_ can be enabled for custom parser configurations.

> **Note**
>
> Setting the `@format` attribute to `mdita` triggers stricter parsing than the more lenient approach that is applied to `markdown` documents.

MDITA files must be UTF-8 encoded.

### Titles and document structure

The first header level will generate a topic and the second header level a section:

```markdown
# Topic title

## Section title
```

```xml
<topic id="topic_title">
  <title>Topic title</title>
  <body>
    <section>
      <title>Section title</title>
    </section>
  </body>
</topic>
```

The ID is generated from title contents.

### Topic content

The first paragraph is treated as a `shortdesc` element.

```markdown
# Topic title

First paragraph.

Second paragraph.
```

```xml
<topic id="topic_title">
  <title>Topic title</title>
  <shortdesc>First paragraph.</shortdesc>
  <body>
    <p>Second paragraph.</p>
  </body>
</topic>
```

### Tables

Tables use [MultiMarkdown] table extension format:

```markdown
| First Header | Second Header | Third Header |
| ------------ | :-----------: | -----------: |
| Content      |    _Cell_     |         Cell |
| Content      |   **Cell**    |         Cell |
```

MultiMarkdown tables are converted to DITA `<simpletable>` elements.

> **Note**  
> Cell alignment information is not preserved, as the `@align` attribute is are not available for `<simpletable>` elements.

```xml
<simpletable>
  <sthead>
    <stentry>
      <p>First Header</p></stentry>
    <stentry>
      <p>Second Header</p></stentry>
    <stentry>
      <p>Third Header</p></stentry>
  </sthead>
  <strow>
    <stentry>
      <p>Content</p></stentry>
    <stentry>
      <p><i>Cell</i></p></stentry>
    <stentry>
      <p>Cell</p></stentry>
  </strow>
  <strow>
    <stentry>
      <p>Content</p></stentry>
    <stentry>
      <p><b>Cell</b></p></stentry>
    <stentry>
      <p>Cell</p></stentry>
  </strow>
</simpletable>
```

Table cells may only contain inline content.

## Markdown DITA Map Syntax

> Since 5.2, requires DITA-OT 4.1 or newer.

DITA Map documents in MDITA syntax need to use file name extension `mditamap`:

```markdown
# Map title

- [Topic title](topic.md)
  - [Nested title](nested.md)
```

```xml
<map>
  <title>Map Title</title>
  <topicref href="topic.dita" navtitle="Topic title">
    <topicref href="nested.dita" navtitle="Nested title"/>
  </topicref>
</map>
```

Bulleted and ordered list items create `topicref` elements.

## Common Markdown Syntax

The following common Markdown constructs are processed in the same way for both `mdita` and `markdown` topics.

### Hard line breaks

A line break that is preceded by two or more spaces is parsed as a hard line break. Because DITA doesn't have a `<br>` element for line break, hard line breaks are converted into `<?linebreak?>` processing instruction.

```markdown
foo· ·
baz
```

```xml
<p>foo<?linebreak?>baz</p>
```

LwDITA plug-in contains extensions for HTML5 and PDF outputs to generate the line break.

### Links

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

### Images

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

### Key references

Key reference can be used with [shortcut reference links]:

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

### Inline

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

### Lists

Unordered can be marked up with either hyphen or asterisk:

```markdown
- one
- two
  - three
  - four
```

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
    </ul>
  </li>
</ul>
```

Definition lists use the [PHP Markdown Extra](https://michelf.com/projects/php-markdown/extra/#def-list) format:

```markdown
Term
: Definition.
```

```xml
<dl>
  <delentry>
    <dt>Term</dt>
    <dd>Defintion.</dd>
  </delentry>
</dl>
```

Each definition entry must have only one term and contain only inline content.

### Metadata

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

[LwDITA]: https://docs.oasis-open.org/dita/LwDITA/v1.0/cn01/LwDITA-v1.0-cn01.html
[Markdown]: https://daringfireball.net/projects/markdown/
[CommonMark]: https://commonmark.org/ 'CommonMark'
[MultiMarkdown]: https://fletcherpenney.net/multimarkdown/ 'MultiMarkdown'
[shortcut reference links]: https://spec.commonmark.org/0.30/#shortcut-reference-link
