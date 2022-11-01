Theme keys can use variables in key values. Variable references are text values that start with a dollar sign. Variable declarations are normal keys where the name of the key is concatenated value of flattened key names separated with a hyphen.

```yaml
brand:
  primary-color: orange
  font:
    header: Helvetica
style:
  topic:
    color: $brand-primary-color
    font-family: $brand-font-header
```
