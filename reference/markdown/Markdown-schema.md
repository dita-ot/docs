As of version 5.0, the _LwDITA_ plug-in provides the `MarkdownReader` class that supports a new `$schema` key in the YAML front matter block. This key can be used to define parsing options in topic files for more control over how Markdown content is converted to DITA.

> **Note:** Requires DITA-OT 4.1 or newer.

```markdown
---
$schema: urn:oasis:names:tc:dita:xsd:concept.xsd
---

# Concept title

Shortdesc content.

Body content.
```

The `$schema` value is a URI that is mapped to a parser configuration. This defines how the document should be parsed, i.e. which Markdown flavor it uses. The Markdown schema definition is similar to an XML document type declaration or `<?xml-model?>` processing instruction where the document defines how it should be optionally validated.

> **Note:**
> The schema URI resembles a reference to an XML Schema Definition or RELAX NG schema, but no validation is currently performed.

The `$schema` key must be the first key in the YAML header.

## Built-in schemas

### DITA topic

- `urn:oasis:names:tc:dita:xsd:topic.xsd`
- `urn:oasis:names:tc:dita:xsd:topic.rng`

### DITA concept

- `urn:oasis:names:tc:dita:xsd:concept.xsd`
- `urn:oasis:names:tc:dita:xsd:concept.rng`

### DITA task

- `urn:oasis:names:tc:dita:xsd:task.xsd`
- `urn:oasis:names:tc:dita:xsd:task.rng`

### DITA reference

- `urn:oasis:names:tc:dita:xsd:reference.xsd`
- `urn:oasis:names:tc:dita:xsd:reference.rng`

### DITA map

- `urn:oasis:names:tc:dita:xsd:map.xsd`
- `urn:oasis:names:tc:dita:xsd:map.rng`

### Lightweight DITA topic extended profile

- `urn:oasis:names:tc:mdita:xsd:topic.xsd`
- `urn:oasis:names:tc:mdita:rng:topic.rng`
- `urn:oasis:names:tc:mdita:extended:xsd:topic.xsd`
- `urn:oasis:names:tc:mdita:extended:rng:topic.rng`

### Lightweight DITA topic core profile

- `urn:oasis:names:tc:mdita:core:xsd:topic.xsd`
- `urn:oasis:names:tc:mdita:core:rng:topic.rng`

## Custom schema configuration

Custom schema configurations are defined using [`Java ServiceLoader`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ServiceLoader.html). Service type interface [`com.elovirta.dita.markdown.SchemaProvider`](https://github.com/jelovirt/org.lwdita/blob/master/src/main/java/com/elovirta/dita/markdown/SchemaProvider.java) has two methods:

- `isSupportedSchema(URI)` — check whether schema URI is supported by this provider.
- `createMarkdownParser(URI)` — create [`MarkdownParser`](https://github.com/jelovirt/org.lwdita/blob/master/src/main/java/com/elovirta/dita/markdown/MarkdownParser.java) instance for given schema. We suggest returning a configured [`MarkdownParserImpl`](https://github.com/jelovirt/org.lwdita/blob/master/src/main/java/com/elovirta/dita/markdown/MarkdownParserImpl.java) instance.

### Example

Example customization for `urn:acme:dita:custom` schema.

Create `src/main/java/com/acme/AcmeSchemaProvider.java` that is a class that extends `SchemaProvider` to define which scheme is defined and what customization options is uses:

```java
package com.acme;

import com.elovirta.dita.markdown.DitaRenderer;
import com.elovirta.dita.markdown.MarkdownParser;
import com.elovirta.dita.markdown.MarkdownParserImpl;
import com.elovirta.dita.markdown.SchemaProvider;
import com.vladsch.flexmark.ext.abbreviation.AbbreviationExtension;
import com.vladsch.flexmark.ext.anchorlink.AnchorLinkExtension;
import com.vladsch.flexmark.ext.attributes.AttributesExtension;
import com.vladsch.flexmark.ext.autolink.AutolinkExtension;
import com.vladsch.flexmark.ext.definition.DefinitionExtension;
import com.vladsch.flexmark.ext.footnotes.FootnoteExtension;
import com.vladsch.flexmark.ext.gfm.strikethrough.StrikethroughSubscriptExtension;
import com.vladsch.flexmark.ext.ins.InsExtension;
import com.vladsch.flexmark.ext.jekyll.tag.JekyllTagExtension;
import com.vladsch.flexmark.ext.superscript.SuperscriptExtension;
import com.vladsch.flexmark.ext.tables.TablesExtension;
import com.vladsch.flexmark.ext.yaml.front.matter.YamlFrontMatterExtension;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.data.MutableDataSet;

import java.net.URI;

import static java.util.Arrays.asList;

public class AcmeSchemaProvider implements SchemaProvider {
    private static final URI SCHEMA = URI.create("urn:acme:dita:custom.xsd");

    @Override
    public boolean isSupportedSchema(URI schema) {
        return SCHEMA.equals(schema);
    }

    @Override
    public MarkdownParser createMarkdownParser(URI schema) {
        return new MarkdownParserImpl(new MutableDataSet()
                // See https://github.com/vsch/flexmark-java/wiki/Extensions
                .set(Parser.EXTENSIONS, asList(
                        AbbreviationExtension.create(),
                        AnchorLinkExtension.create(),
                        AttributesExtension.create(),
                        FootnoteExtension.create(),
                        InsExtension.create(),
                        JekyllTagExtension.create(),
                        SuperscriptExtension.create(),
                        TablesExtension.create(),
                        AutolinkExtension.create(),
                        YamlFrontMatterExtension.create(),
                        DefinitionExtension.create(),
                        StrikethroughSubscriptExtension.create()))
                .set(DefinitionExtension.TILDE_MARKER, false)
                .set(TablesExtension.COLUMN_SPANS, true)
                .set(TablesExtension.APPEND_MISSING_COLUMNS, false)
                .set(TablesExtension.DISCARD_EXTRA_COLUMNS, true)
                .set(TablesExtension.HEADER_SEPARATOR_COLUMN_MATCH, true)
                // See https://github.com/jelovirt/org.lwdita/wiki/Configuration-options
                .set(DitaRenderer.FIX_ROOT_HEADING, false)
                .set(DitaRenderer.SHORTDESC_PARAGRAPH, false)
                .set(DitaRenderer.ID_FROM_YAML, false)
                .set(DitaRenderer.LW_DITA, false)
                .set(DitaRenderer.SPECIALIZATION, false)
                .set(DitaRenderer.SPECIALIZATION_CONCEPT, false)
                .set(DitaRenderer.SPECIALIZATION_TASK, false)
                .set(DitaRenderer.SPECIALIZATION_REFERENCE, false)
                .toImmutable());
    }
}
```

To make `AcmeSchemaProvider` discoverable, create a provider configuration file `src/test/resources/META-INF/services/com.elovirta.dita.markdown.SchemaProvider`:

```
com.acme.AcmeSchemaProvider
```

Project for this example can be found from [org.lwdita-sample GitHub project](https://github.com/jelovirt/org.lwdita-sample). It contains a Gradle build to compile the code and package it into a DITA-OT plug-in.
