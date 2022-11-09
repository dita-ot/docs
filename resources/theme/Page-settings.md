Page size and orientation can be set with the `size` and `orientation` keys. Page margins are set with the `top`, `outside`, `bottom`, and `inside` keys.

```yaml
page:
  size: A4
  orientation: portrait
  top: 20mm
  outside: 20mm
  bottom: 20mm
  inside: 30mm
  mirror-margins: true
```

The `size` key supports the following values:

- `A3`
- `A4`
- `A5`
- `Executive`
- `JIS B5`
- `Tabloid`
- `Legal`
- `Letter`
- `PA4`

If a required page size is not supported, `height` and `width` keys can be used to define the page size.

Use the `mirror-margins` key to set up facing pages for double-sided documents.

When this key is set to `true`, the margins of the left page are a mirror image of those on the right page. The `inside` margins of left and right pages are the same, and the `outside` margins of left and right pages are identical.

The mirror margins setting defaults to `false`.
