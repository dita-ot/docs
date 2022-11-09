# Why doesn't the generated plug-in use variable strings for different page headers and footers?

The default page header (and footer) generation in PDF2 uses variable strings with a fixed set of available fields. While in some cases headers will require language specific processing, in most cases the output will be the same in all languages. Also, the PDF2 header implementation contains a lot of code duplication that makes it difficult to change the layout of the headers.

That's why the generated plug-in overrides the header templates and single-sources the static content generation from the body header template. This makes it easier to change the contents and layout of the header. If language-specific processing is required, use the same approach as the PDF2 base templates.
