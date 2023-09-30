Although the original [Markdown DITA](./Markdown-DITA-syntax.md) format and the [MDITA](./MDITA-syntax.md) format for _LwDITA_ share some common syntax, there are several differences to consider when choosing which format to use.

<!-- Re-use short descriptions from syntax topics -->

- In 2015, the original _DITA-OT Markdown_ plug-in introduced a series of conventions to convert [Markdown] content to DITA, and vice-versa. This Markdown flavor was called _“Markdown DITA”_. The `markdown` format adds several complementary constructs to represent DITA content in Markdown, beyond those proposed for the [MDITA](./MDITA-syntax.md) format in the [Lightweight DITA][LwDITA] specification drafts.

- In 2017, the Markdown plug-in was superseded by the _LwDITA_ plug-in, which was bundled with DITA-OT 3.0, and added new formats for [Lightweight DITA][LwDITA]. The `mdita` format implements the subset of Markdown features proposed in the latest specification drafts, but differs in some ways from the original [Markdown DITA](./Markdown-DITA-syntax.md) format.

The following table provides an overview of differences between the `markdown` and `mdita` formats.

| Features                     | Markdown DITA                        | MDITA (LwDITA)              |
| ---------------------------- | ------------------------------------ | --------------------------- |
| DITA map `@format` attribute | `markdown` or `md`                   | `mdita`                     |
| LwDITA                       | –                                    | ✔                          |
| First ¶                      | Body ¶                               | Short description           |
| Subheadings                  | Nested topics                        | Sections                    |
| Topic IDs                    | Special attributes or title          | Generated from title        |
| Output class                 | Special attributes block             | –                           |
| Profiling atts               | Special attributes block             | –                           |
| Topic types                  | Special attributes block             | –                           |
| Schemas                      | YAML frontmatter                     | –                           |
| Tables                       | OASIS exchange table model ^ 1^ [^1] | DITA `<simpletable>`        |
| Cell alignment               | ✔                                   | –                           |
| Sections                     | Defined via attributes               | –                           |
| Examples                     | Defined via attributes               | –                           |
| Notes                        | MkDocs Material admonitions          | –                           |
| Markdown maps                | Map schema                           | `.mditamap` extension       |
| Maps: topic sequences        | OL in Markdown map                   | –                           |
| Maps: key definitions        | Link reference definition            | –                           |
| Maps: reltables              | MultiMarkdown tables with links      | –                           |
| Key references in topics     | ✔ Shortcut reference links          | ✔ Shortcut reference links |
| List spacing                 | [loose] or [tight] (no blank lines)  | [loose] only (¶ per item)   |

[Markdown]: https://daringfireball.net/projects/markdown/
[LwDITA]: https://docs.oasis-open.org/dita/LwDITA/v1.0/cn01/
[loose]: https://spec.commonmark.org/0.30/#loose
[tight]: https://spec.commonmark.org/0.30/#tight

[^1]: <https://www.oasis-open.org/specs/tm9901.html>
