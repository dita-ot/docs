The `content` key in `header` or `footer` can be fixed text or can reference fields using curly braces. Supported fields are:

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

For separate header or footer definition for recto and verso pages, use `odd` and `even` keys.

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
