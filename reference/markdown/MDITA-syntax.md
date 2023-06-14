In 2017, the Markdown plug-in was superseded by the _LwDITA_ plug-in, which was bundled with DITA-OT 3.0, and added new formats for [Lightweight DITA][LwDITA]. The `mdita` format implements the subset of Markdown features proposed in the latest specification drafts, but differs in some ways from the original [Markdown DITA](./Markdown-DITA-syntax.md) format.

To apply the stricter LwDITA-specific processing to a Markdown topic, create a topic reference in your map and set the `@format` attribute to `mdita`:

```xml
<map>
  <topicref href="mdita-topic.md" format="mdita"/>
</map>
```

In this case, the first paragraph in the topic is treated as a short description, and tables are converted to DITA `<simpletable>` elements.

The _MDITA_ format uses [CommonMark] as the underlying markup language. MDITA files must be UTF-8 encoded.

The MDITA parser processes topics according to the MDITA _“Extended profile”_ proposed for LwDITA. The _"Core profile"_ can be enabled for custom parser configurations.

The following Markdown constructs are parsed differently when the `@format` attribute is set to `mdita`.

## Titles and document structure

The first heading level generates a topic and the second heading level a section:

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

The ID is generated automatically from the title content.

## Topic content

The first paragraph is treated as a `<shortdesc>` element.

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

## Tables

Tables use the [MultiMarkdown] table extension format:

```markdown
| First Header | Second Header | Third Header |
| ------------ | :-----------: | -----------: |
| Content      |    _Cell_     |         Cell |
| Content      |   **Cell**    |         Cell |
```

Tables in MDITA files are converted to DITA `<simpletable>` elements:

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

> **Note**
> Cell alignment information is not preserved, as the `@align` attribute is are not available for `<simpletable>` elements.

Table cells may only contain inline content.

## MDITA map syntax

DITA maps can be written in MDITA using standard Markdown syntax for links and lists.

<!-- Since 5.2 -->

> **Note:** Requires DITA-OT 4.1 or newer.

In MDITA, maps use the file name extension `mditamap` to define the file as a map:

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

In MDITA, both ordered and unordered list items create `<topicref>` elements.

[LwDITA]: https://docs.oasis-open.org/dita/LwDITA/v1.0/cn01/LwDITA-v1.0-cn01.html
[CommonMark]: https://commonmark.org/ 'CommonMark'
[MultiMarkdown]: https://fletcherpenney.net/multimarkdown/ 'MultiMarkdown'
