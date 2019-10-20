# Use the latest official DITA-OT image as parent: ↓
FROM docker.pkg.github.com/dita-ot/dita-ot/dita-ot:3.3.4

# Install a custom plug-in from a remote location:
RUN dita --install https://example.com/plugin.zip

# Install from the registry at dita-ot.org/plugins:
RUN dita --install from-plugin-registry
