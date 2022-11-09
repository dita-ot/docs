# DITA-OT PDF Plug-in Generator

The DITA-OT PDF plug-in generator is a TypeScript program that generates DITA-OT plug-ins that extend the default PDF2 plug-in. For development details, see <https://github.com/jelovirt/pdf-generator>.

The Gradle build file generates the `com.elovirta.pdf` plug-in for DITA-OT.

This plug-in extends the built-in PDF2 plug-in by adding support for the `theme` property. Custom theme files can be used to change the styling of the PDF2 output without needing to extend the transtype with XSLT.

The following topics provide details on the theme file formats and supported configuration options.

- [Theme](Theme)
  - [Page settings](Page-settings)
  - [Header and footer](Header-and-footer)
  - [Styles](Styles)
  - [Variables](Variables)
  - [Extending themes](Extending-themes)
  - [Syntactic sugar](Syntactic-sugar)
