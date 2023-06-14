Starting with version 5.0 of the _LwDITA_ plug-in, the `MarkdownReader` class supports a new `$schema` key in the YAML front matter block. This key can be used to define parsing options in topic files for more control over how Markdown content is converted to DITA.

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

The following schemas are built in to the `org.lwdita` plug-in.

## DITA topic

- `urn:oasis:names:tc:dita:xsd:topic.xsd`
- `urn:oasis:names:tc:dita:xsd:topic.rng`

## DITA concept

- `urn:oasis:names:tc:dita:xsd:concept.xsd`
- `urn:oasis:names:tc:dita:xsd:concept.rng`

## DITA task

- `urn:oasis:names:tc:dita:xsd:task.xsd`
- `urn:oasis:names:tc:dita:xsd:task.rng`

## DITA reference

- `urn:oasis:names:tc:dita:xsd:reference.xsd`
- `urn:oasis:names:tc:dita:xsd:reference.rng`

## DITA map

- `urn:oasis:names:tc:dita:xsd:map.xsd`
- `urn:oasis:names:tc:dita:xsd:map.rng`

## Lightweight DITA topic extended profile

- `urn:oasis:names:tc:mdita:xsd:topic.xsd`
- `urn:oasis:names:tc:mdita:rng:topic.rng`
- `urn:oasis:names:tc:mdita:extended:xsd:topic.xsd`
- `urn:oasis:names:tc:mdita:extended:rng:topic.rng`

## Lightweight DITA topic core profile

- `urn:oasis:names:tc:mdita:core:xsd:topic.xsd`
- `urn:oasis:names:tc:mdita:core:rng:topic.rng`
