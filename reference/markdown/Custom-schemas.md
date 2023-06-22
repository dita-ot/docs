You can create a custom plug-in to set different configuration options for Markdown parsing and conversion to DITA. Custom Markdown schema configurations can be defined using the [`Java ServiceLoader`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ServiceLoader.html) class.

The service type interface [`com.elovirta.dita.markdown.SchemaProvider`](https://github.com/jelovirt/org.lwdita/blob/master/src/main/java/com/elovirta/dita/markdown/SchemaProvider.java) has two methods:

- `isSupportedSchema(URI)` — check whether schema URI is supported by this provider.
- `createMarkdownParser(URI)` — create [`MarkdownParser`](https://github.com/jelovirt/org.lwdita/blob/master/src/main/java/com/elovirta/dita/markdown/MarkdownParser.java) instance for given schema. We suggest returning a configured [`MarkdownParserImpl`](https://github.com/jelovirt/org.lwdita/blob/master/src/main/java/com/elovirta/dita/markdown/MarkdownParserImpl.java) instance.

## Example

Sample customization for `urn:acme:dita:custom` schema.

Create a `src/main/java/com/acme/AcmeSchemaProvider.java` class that extends `SchemaProvider` to define a scheme and what customization options it uses:

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
                // See https://github.com/jelovirt/org.lwdita/wiki/Custom-schemas
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

A sample project is available in the [org.lwdita-sample GitHub project](https://github.com/jelovirt/org.lwdita-sample) repository. It contains a Gradle build to compile the code and package it into a DITA-OT plug-in.

The following configuration options can be specified in custom schemas:

## Parsing

| Static Field                    | Default | Description                                                                             |
| ------------------------------- | ------- | --------------------------------------------------------------------------------------- |
| `DitaRenderer.FIX_ROOT_HEADING` | `false` | If root heading is missing, generate based on `title` key from YAML header or filename. |

## Conversion to DITA

| Static Field                            | Default | Description                                                                                      |
| --------------------------------------- | ------- | ------------------------------------------------------------------------------------------------ |
| `DitaRenderer.SHORTDESC_PARAGRAPH`      | `false` | Convert first paragraph to shortdesc.                                                            |
| `DitaRenderer.TIGHT_LIST`               | `true`  | Support tight lists.                                                                             |
| `DitaRenderer.ID_FROM_YAML`             | `false` | Use `id` key from YAML header for topic @id.                                                     |
| `DitaRenderer.LW_DITA`                  | `false` | Convert to XDITA instead of DITA. Deprecated, use `DitaRenderer.MDITA_EXTENDED_PROFILE` instead. |
| `DitaRenderer.SPECIALIZATION`           | `false` | Convert to concept/task/reference if root heading has matching class.                            |
| `DitaRenderer.SPECIALIZATION_CONCEPT`   | `false` | Convert to DITA concept.                                                                         |
| `DitaRenderer.SPECIALIZATION_TASK`      | `false` | Convert to DITA task.                                                                            |
| `DitaRenderer.SPECIALIZATION_REFERENCE` | `false` | Convert to DITA concept.                                                                         |
| `DitaRenderer.MDITA_CORE_PROFILE`       | `false` | Parse as MDITA core profile and convert to XDITA.                                                |
| `DitaRenderer.MDITA_EXTENDED_PROFILE`   | `false` | Parse as MDITA extended profile and convert to XDITA.                                            |
| `DitaRenderer.MAP`                      | `false` | Convert to DITA map.                                                                             |
