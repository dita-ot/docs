The `com.elovirta.pdf` plug-in for DITA-OT extends the built-in PDF2 plug-in by adding support for the `theme` property. The `theme` property takes a path to a theme file and changes the styling of the PDF2 output without needing to extend the transtype with XSLT.

To generate PDF output with a custom theme, pass the path to the theme file to the `dita` command with the `--theme` option:

```shell
dita --project=samples/project-files/pdf.xml \
     --theme=/path/to/custom-theme-file.yaml
```

## Theme file

A theme file can be written in either [JSON] or [YAML] format.

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

[json]: https://json.org
[yaml]: https://yaml.org
