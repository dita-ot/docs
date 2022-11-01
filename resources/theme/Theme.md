The `com.elovirta.pdf` plug-in for DITA-OT extends the built-in PDF2 plug-in by adding support for the `theme` property. The `theme` property takes a path to a theme file and changes the styling of the PDF2 output without needing to extend the transtype with XSLT.

## Theme file

A theme is either JSON or YAML file.

```yaml
page:
  size: A4
header:
  content: '{title}'
  border-after: solid 1pt black
footer:
  content: '{folio}'
  text-align: center
style:
  body:
    font-family: Times New Roman
  topic:
    font-family: Arial
    font-size: 26pt
    font-weight: bold
    color: gray
```
