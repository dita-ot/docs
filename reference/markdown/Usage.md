# Using Markdown and HTML files as input

Markdown DITA and HTML DITA topics can only be used by linking to them in map files. The LwDITA compatible documents should use `@format` value `mdita` and `hdita`.

```xml
<map>
  <topicref href="test.md" format="mdita"/>
  <topicref href="test.html" format="hdita"/>
</map>
```

A more lenient document parsing should use `@format` value `markdown` or `md`.

```xml
<map>
  <topicref href="test.md" format="markdown"/>
</map>
```

The `@format` attribute value must be set to `markdown` or `md` to recognize files as Markdown DITA. For LwDITA-compatible documents, set the `@format` attribute value to `mdita` to process files as MDITA, or `hdita` for HTML DITA.

See [Markdown DITA syntax](Markdown-DITA-syntax) for XML and Markdown DITA correspondence.

# Generating Markdown output

The DITA-OT Markdown plug-in extends the DITA Open Toolkit with additional output formats _(transformation types)_ that can be used to publish DITA content as Markdown.

- To publish Markdown DITA files, use the `markdown` transtype.

- To generate [GitHub Flavored Markdown] files, use the `markdown_github` transtype.

- To publish GitHub Flavored Markdown and generate a `SUMMARY.md` table of contents file for publication via [GitBook], use the `markdown_gitbook` transtype.

[GitHub Flavored Markdown]: https://help.github.com/categories/writing-on-github/
[GitBook]: https://www.gitbook.com
