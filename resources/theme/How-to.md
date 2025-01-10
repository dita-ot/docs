# Styling

Examples of how to configure styling in theme files.

## Images

To display to theme defined image, use `background-image` property.

```yaml
style:
  note-other:
    background-image: legal.svg
    background-repeat: no-repeat
    # image width plus padding
    padding-start: 60pt + 1em
    # image width plus parent indentation
    start-indent: 60pt + from-parent(start-indent)
```
