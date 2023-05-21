You can create a custom plug-in to set different configuration options for Markdown parsing and conversion to DITA.

## Parsing

| Static Field                    | Default Value | Description                                                                             |
| ------------------------------- | ------------- | --------------------------------------------------------------------------------------- |
| `DitaRenderer.FIX_ROOT_HEADING` | `false`       | If root heading is missing, generate based on `title` key from YAML header or filename. |

## Conversion to DITA

| Static Field                            | Default Value | Description                                                                                      |
| --------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------ |
| `DitaRenderer.SHORTDESC_PARAGRAPH`      | `false`       | Convert first paragraph to shortdesc.                                                            |
| `DitaRenderer.ID_FROM_YAML`             | `false`       | Use `id` key from YAML header for topic @id.                                                     |
| `DitaRenderer.LW_DITA`                  | `false`       | Convert to XDITA instead of DITA. Deprecated, use `DitaRenderer.MDITA_EXTENDED_PROFILE` instead. |
| `DitaRenderer.SPECIALIZATION`           | `false`       | Convert to concept/task/reference if root heading has matching class.                            |
| `DitaRenderer.SPECIALIZATION_CONCEPT`   | `false`       | Convert to DITA concept.                                                                         |
| `DitaRenderer.SPECIALIZATION_TASK`      | `false`       | Convert to DITA task.                                                                            |
| `DitaRenderer.SPECIALIZATION_REFERENCE` | `false`       | Convert to DITA concept.                                                                         |
| `DitaRenderer.MDITA_CORE_PROFILE`       | `false`       | Parse as MDITA core profile and convert to XDITA.                                                |
| `DitaRenderer.MDITA_EXTENDED_PROFILE`   | `false`       | Parse as MDITA extended profile and convert to XDITA.                                            |
| `DitaRenderer.MAP`                      | `false`       | Convert to DITA map.                                                                             |
