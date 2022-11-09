Theme files can use [syntactic sugar](https://en.wikipedia.org/wiki/Syntactic_sugar) to make them easier to read and write. When theme files are read, any shorthand keys are “desugared” to their more verbose equivalents before they are passed to the stylesheet generator.

## Content

The authoring format of the `content` key is a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) that supports field and variable references mixed with text.

You can reference DITA-OT variables by name by prefixing them with the number sign `#` and wrapping them in braces `{` `}.` For example:

```yaml
content: '{#copyright} {year} ACME Corporation'
```

desugars to

```yaml
content:
  - kind: variable
    value: copyright
  - kind: text
    value: ' '
  - kind: field
    value: year
  - kind: text
    value: ' ACME Corporation'
```

which would result in a line like this:

> © 2022 ACME Corporation

## Page dimensions

When page dimensions are defined using the `size` and `orientation` keys, they are desugared to `width` and `height` keys using a mapping table for known page sizes.

```yaml
page:
  size: A4
```

desugars to

```yaml
page:
  width: 210mm
  height: 297mm
```

## Header and footer

Style keys for `header` and `footer` are collected under the `odd` and `even` keys.

```yaml
header:
  color: silver
  odd:
    font-weight: bold
```

desugars to

```yaml
header:
  odd:
    font-weight: bold
    color: silver
  even:
    color: silver
```

## Topic titles

Style keys `h1`, `h2`, `h3`, and `h4` are desugared to `topic`, `topic-topic`, `topic-topic-topic`, and `topic-topic-topic-topic`, respectively.

```yaml
style:
  h2:
    font-weight: bold
```

desugars to

```yaml
header:
  topic-topic:
    font-weight: bold
```
