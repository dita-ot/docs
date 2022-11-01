A theme can extend another theme using `extends` key. The value of `extends` is a URL to the theme being extended.

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
