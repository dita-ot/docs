A theme can extend another theme using the `extends` key.

If the value is `default`, it resolves to the built-in default theme. Otherwise the value of `extends` is a relative path from the current theme file to the theme being extended. If a theme doesn't have an `extends` key, default PDF2 plug-in styles are used.

`base.yaml`

```yaml
brand:
  primary-color: orange
page:
  size: A4
```

`product/theme.yaml`

```yaml
extends: ../base.yaml
page:
  size: Letter
style:
  topic:
    color: $brand-primary-color
```
