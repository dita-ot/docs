Page size and orientation can be set with `size` and `orientation` keys. Page margins are set with `top`, `outside`, `bottom`, and `inside` keys.

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

Mirror pages are set with `mirror-margins` key; mirror margins defaults to `false`.
