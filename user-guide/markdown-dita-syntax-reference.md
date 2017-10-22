Markdown DITA syntax reference
==============================

Markdown DITA uses [CommonMark] as the underlying markup language.

Markdown DITA files must be UTF-8 encoded.

## Titles and document structure

Each header level will generate a topic and associated title:

~~~~ {.markdown}
# Topic title

## Nested topic title
~~~~

~~~~ {.xml}
<topic id="topic_title">
  <title>Topic title</title>
  <topic id="nested_topic_title">
    <title>Nested topic title</title>
  </topic>
</topic>
~~~~

Pandoc [header_attributes] can be used to define `id` or `outputclass` attributes:

~~~~ {.markdown}
# Topic title {#carrot .juice}
~~~~

~~~~ {.xml}
<topic id="carrot" outputclass="juice">
  <title>Topic title</title>
~~~~

If topic ID is not defined using header_attributes, the ID is generated from title contents.

Pandoc [pandoc_title_block] extension can be used to group multiple level 1 headers under a common
title:

~~~~ {.markdown}
% Common title

# Topic title

# Second title
~~~~

~~~~ {.xml}
<topic id="common_title">
  <title>Common title</title>
  <topic id="topic_title">
    <title>Topic title</title>
  </topic>
  <topic id="second_title">
    <title>Second title</title>
  </topic>
</topic>
~~~~

## Topic content

In LwDITA compatible documents (MDITA) the first paragraph is treated as a `shortdesc` element. In generic Markdown documents all paragraphs appear inside the `body` element.

## Specialization types

The following class values in [header_attributes] have a special meaning on level 1 headers:

-   `concept`
-   `task`
-   `reference`

They can be used to change the Markdown DITA topic type to one of the built-in structural specialization types.

~~~~ {.markdown}
# Task {.task}

Context

1.  Command

    Info.
~~~~

~~~~ {.xml}
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
~~~~

## Sections

The following class values in [header_attributes] have a special meaning on header levels other than 1:

-   `section`
-   `example`

They are used to generate [`section`](http://docs.oasis-open.org/dita/v1.2/os/spec/langref/section.html)
and [`example`](http://docs.oasis-open.org/dita/v1.2/os/spec/langref/example.html) elements:

~~~~ {.markdown}
# Topic title

## Section title {.section}

## Example title {.example}
~~~~

~~~~ {.xml}
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
~~~~

## Links

The format of local link targets is detected based on file extension.
The following extensions are treated as DITA files:

|extension  |format    |
|-----------|----------|
|`.dita`    |`dita`    |
|`.xml`     |`dita`    |
|`.md`      |`markdown`|
|`.markdown`|`markdown`|

All other link targets use `format` from file extension and are treated
as non-DITA files. Absolute links targets are treated as external scope links:

~~~~ {.markdown}
[Markdown](test.md)
[DITA](test.dita)
[HTML](test.html)
[External](http://www.example.com/test.html)
~~~~

~~~~ {.xml}
<xref href="test.md">Markdown</xref>
<xref href="test.dita">DITA</xref>
<xref href="test.html" format="html">HTML</xref>
<xref href="http://www.example.com/test.html" format="html" scope="external">External</xref>
~~~~

## Images

Images used in inline content will result in inline placement. If a block level image contains a title, it will be treated as an image wrapped in figure:

~~~~ {.markdown}
An inline ![Alt](test.jpg).

![Alt](test.jpg)

![Alt](test.jpg "Title")
~~~~

~~~~ {.xml}
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
~~~~

## Key references

Key reference can be used with [shortcut reference links](http://spec.commonmark.org/0.18/#shortcut-reference-link):

~~~~ {.markdown}
[key]
![image-key]
~~~~

~~~~ {.xml}
<xref keyref="key"/>
<image keyref="image-key"/>
~~~~

## Inline

The following inline elements are supported:

~~~~ {.markdown}
**bold**
*italic*
`code`
~~strikethrough~~
~~~~

~~~~ {.xml}
<b>bold</b>
<i>italic</i>
<codeph>code</codeph>
<ph status="deleted">strikethrough</ph>
~~~~

## Lists

Unordered can be marked up with either hyphen or ampersand:

~~~~ {.markdown}
*   one
*   two
    -   three
    -   four
~~~~

~~~~ {.xml}
<ul>
  <li>one</li>
  <li>two
    <ul>
      <li>three</li>
      <li>four</li>
    </ul>
  </li>
</ul>
~~~~

Ordered can be marked up with either number or number sign, followed by
a period:

~~~~ {.markdown}
1.  one
2.  two
    #.  three
    #.  four
~~~~

~~~~ {.xml}
<ol>
  <li>one</li>
  <li>two
    <ol>
      <li>three</li>
      <li>four</li>
    </ul>
  </li>
</ul>
~~~~

Definition lists use the [PHP Markdown Extra](http://michelf.com/projects/php-markdown/extra/#def-list) format:

~~~~ {.markdown}
Term
:   Definition.
~~~~

~~~~ {.xml}
<dl>
  <delentry>
    <dt>Term</dt>
    <dd>Defintion.</dd>
  </delentry>
</dl>
~~~~

Each definition entry must have only one term and contain only inline content.

## Tables

Tables use [MultiMarkdown] table extension format:

~~~~ {.markdown}
| First Header | Second Header | Third Header |
| ------------ | :-----------: | -----------: |
| Content      | *Long Cell*                 ||
| Content      | **Cell**      | Cell         |
~~~~

~~~~ {.xml}
<table>
  <tgroup cols="3">
    <colspec colname="col1"/>
    <colspec colname="col2" align="center"/>
    <colspec colname="col3" align="right"/>
    <thead>
      <row>
        <entry>First Header </entry>
        <entry>Second Header </entry>
        <entry>Third Header </entry>
      </row>
    </thead>
    <tbody>
      <row>
        <entry>Content </entry>
        <entry namest="col2" nameend="col3"><i>Long Cell</i></entry>
      </row>
      <row>
        <entry>Content </entry>
        <entry><b>Cell</b></entry>
        <entry>Cell </entry>
      </row>
    </tbody>
  </tgroup>
</table>
~~~~

Table cells may only contain inline content and column spans; block content and row spans are not supported by Markdown DITA.

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

~~~~ {.markdown}
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
~~~~

~~~~ {.xml}
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
~~~~


[CommonMark]: http://commonmark.org/ "CommonMark"
[header_attributes]: http://pandoc.org/MANUAL.html#extension-header_attributes "header_attributes"
[pandoc_title_block]: http://pandoc.org/MANUAL.html#extension-pandoc_title_block "pandoc_title_block"
[pandoc_metadata_block]: http://pandoc.org/MANUAL.html#extension-yaml_metadata_block "pandoc_metadata_block"
[MultiMarkdown]: http://fletcherpenney.net/multimarkdown/ "MultiMarkdown"
[YAML]: http://www.yaml.org/ "YAML"
