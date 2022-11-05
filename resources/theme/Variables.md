Theme key values can use variables to reference settings in other keys. Any previously defined key can be referenced in the value of another key.

Variable references are text values that start with a dollar sign (`$`). Variable declarations are normal keys where the name of the key is a concatenated value of flattened key names separated with a hyphen.

The example below shows how to set a custom color value and header font, and point to those values in `style` keys.

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
