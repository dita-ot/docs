The `content` key in `header` or `footer` can be used to add text to running header or footer content. Content can include static text, or reference variables using curly braces.

The following variable fields are currently supported:

- `title`: Map title
- `chapter`: Map chapter title
- `folio`: current page number
- `folio-with-total`: current page number with total number of pages
- `page-number`: current page number
- `page-count`: total number of pages
- `year`: current year

```yaml
header:
  content: '{title} — {chapter}'
  border-after: solid 1pt black
```

To define separate headers or footers for recto (right) and verso (left) pages, use the `odd` and `even` keys.

```yaml
header:
  border-after: solid 1pt black
  odd:
    content: '{title}'
    text-align: end
  even:
    content: '{chapter}'
    text-align: start
```
