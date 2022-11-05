A theme can extend another theme using the `extends` key. The value of `extends` is a relative path from the current theme file to the theme being extended.

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
