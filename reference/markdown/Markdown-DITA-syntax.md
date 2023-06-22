In 2015, the original _DITA-OT Markdown_ plug-in introduced a series of conventions to convert [Markdown] content to DITA, and vice-versa. This Markdown flavor was called _“Markdown DITA”_. The `markdown` format adds several complementary constructs to represent DITA content in Markdown, beyond those proposed for the [MDITA](./MDITA-syntax.md) format in the [Lightweight DITA][LwDITA] specification drafts.

To add a Markdown topic to a DITA publication, create a topic reference in your map and set the `@format` attribute to `markdown`. This allows the toolkit to recognize the source file as Markdown and convert it to DITA:

```xml
<map>
  <topicref href="markdown-dita-topic.md" format="markdown"/>
</map>
```

In this case, the first paragraph in the topic is treated as a body paragraph, and each heading level generates a nested topic.

The _Markdown DITA_ format uses [CommonMark] as the underlying markup language, with several extensions as noted below. Markdown DITA files must be UTF-8 encoded.

The following Markdown constructs are parsed differently when the `@format` attribute is set to `markdown`.

## Titles and document structure

Each heading level generates a topic and associated title:

```markdown
# Topic title

## Nested topic title
```

```xml
<topic id="topic_title">
  <title>Topic title</title>
  <topic id="nested_topic_title">
    <title>Nested topic title</title>
  </topic>
</topic>
```

Pandoc [header attributes] or PHP Markdown Extra [special attributes] can be used to define `id` or `outputclass` attributes:

```markdown
# Topic title {#carrot .juice audience=novice}
```

```xml
<topic id="carrot" outputclass="juice" audience="novice">
  <title>Topic title</title>
```

If topic ID is not defined using header attributes, the ID is generated from title contents.

If the Markdown document doesn’t contain a level 1 heading, one is generated based on YAML metadata or from the document file name.

## Topic content

In Markdown DITA documents, all paragraphs appear inside the `body` element.

```markdown
# Topic title

First paragraph.

Second paragraph.
```

```xml
<topic id="topic_title">
  <title>Topic title</title>
  <body>
    <p>First paragraph.</p>
    <p>Second paragraph.</p>
  </body>
</topic>
```

## Specialization types

The following class values in [header attributes] have a special meaning on level 1 headings:

- `concept`
- `task`
- `reference`

They can be used to change the Markdown DITA topic type to one of the built-in structural specialization types.

```markdown
# Task {.task}

Context

1.  Command

    Info.
```

```xml
<task id="task">
  <title>Task </title>
  <taskbody>
    <context>
      <p>Context</p>
    </context>
    <steps>
      <step>
        <cmd>Command</cmd>
        <info>
          <p>Info.</p>
        </info>
      </step>
    </steps>
  </taskbody>
</task>
```

The other way to use specialization types is by defining a [schema] for the document.

## Sections

The following class values in [header attributes] have a special meaning on heading levels other than 1:

- `section`
- `example`

They are used to generate [`section`](https://docs.oasis-open.org/dita/v1.2/os/spec/langref/section.html) and [`example`](https://docs.oasis-open.org/dita/v1.2/os/spec/langref/example.html) elements:

```markdown
# Topic title

## Section title {.section}

## Example title {.example}
```

```xml
<topic id="topic_title">
  <title>Topic title</title>
  <body>
    <section>
      <title>Section title</title>
    </section>
    <example>
      <title>Example title</title>
    </example>
  </body>
</topic>
```

## Tables

Tables use the [MultiMarkdown] table extension format:

<!-- Prevent Prettier from “fixing” cell span -->
<!-- prettier-ignore-start -->
```markdown
| First Header | Second Header | Third Header |
| ------------ | :-----------: | -----------: |
| Content      |          _Long Cell_        ||
| Content      |   **Cell**    |         Cell |
```
<!-- prettier-ignore-end -->

Tables in Markdown DITA files are converted to the [OASIS exchange table model](https://www.oasis-open.org/specs/tm9901.html):

```xml
<table>
  <tgroup cols="3">
    <colspec colname="col1" colnum="1"/>
    <colspec colname="col2" colnum="2"/>
    <colspec colname="col3" colnum="3"/>
    <thead>
      <row>
        <entry colname="col1">First Header</entry>
        <entry align="center" colname="col2">Second Header</entry>
        <entry align="right" colname="col3">Third Header</entry>
      </row>
    </thead>
    <tbody>
      <row>
        <entry colname="col1">Content</entry>
        <entry align="center" namest="col2" nameend="col3" colname="col2"><i>Long Cell</i></entry>
      </row>
      <row>
        <entry colname="col1">Content</entry>
        <entry align="center" colname="col2"><b>Cell</b></entry>
        <entry align="right" colname="col3">Cell</entry>
      </row>
    </tbody>
  </tgroup>
</table>
```

Table cells may only contain inline content and column spans; block content and row spans are not supported in Markdown DITA.

## Notes

Notes can be written using the syntax defined in the Material for MkDocs [admonition extension](https://squidfunk.github.io/mkdocs-material/reference/admonitions/).

<!-- Since 5.0 -->

> **Note:** Requires DITA-OT 4.1 or newer.

```markdown
!!! note

    Note content.
```

```xml
<note>
  <p>Note Content.</p>
</note>
```

Different note types can be defined by changing the type qualifier keyword.

```markdown
!!! info

    Info content.
```

```xml
<note type="info">
  <p>Info Content.</p>
</note>
```

## Markdown DITA map syntax

DITA maps can be written in Markdown using standard Markdown syntax for links and lists.

<!-- Since 5.1 -->

> **Note:** Requires DITA-OT 4.1 or newer.

In Markdown DITA, maps use the [schema] key in the YAML front matter block to define the file as a map:

```markdown
---
$schema: urn:oasis:names:tc:dita:xsd:map.xsd
---

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

Unordered list items create `<topicref>` elements, and ordered list items create `<topicref>` elements with `collection-type="sequence"`.

## Key definitions

Keys can be defined using standard Markdown syntax for [link reference definitions].

```markdown
---
$schema: urn:oasis:names:tc:dita:xsd:map.xsd
---

[key-name]: topic.md
```

```xml
<map>
  <keydef href="topic.dita" navtitle="Topic title"/>
</map>
```

## Relationship tables

Relationship tables are tables with links inside cells.

```markdown
---
$schema: urn:oasis:names:tc:dita:xsd:map.xsd
---

| [Help](topic.md)  |                           |
| ----------------- | ------------------------- |
| [Topic](topic.md) | [Reference](reference.md) |
```

```xml
<map>
  <reltable>
    <relheader>
      <relcolspec>
        <topicref href="help.dita"/>
      </relcolspec>
      <relcolspec/>
    </relheader>
    <relrow>
      <relcell>
        <topicref href="topic.dita"/>
      </relcell>
      <relcell>
        <topicref href="reference.dita"/>
      </relcell>
    </relrow>
  </reltable>
</map>
```

[Markdown]: https://daringfireball.net/projects/markdown/
[CommonMark]: https://commonmark.org/ 'CommonMark'
[LwDITA]: https://docs.oasis-open.org/dita/LwDITA/v1.0/cn01/LwDITA-v1.0-cn01.html
[header attributes]: https://pandoc.org/MANUAL.html#extension-header_attributes
[special attributes]: https://michelf.ca/projects/php-markdown/extra/#spe-attr
[MultiMarkdown]: https://fletcherpenney.net/multimarkdown/ 'MultiMarkdown'
[link reference definitions]: https://spec.commonmark.org/0.30/#link-reference-definition
[schema]: Markdown-schemas.md
