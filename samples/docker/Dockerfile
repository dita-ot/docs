# Use the latest official DITA-OT image as parent:   ↓
FROM docker.pkg.github.com/dita-ot/dita-ot/dita-ot:3.6

# Install a custom plug-in from a remote location:
RUN dita --install https://github.com/infotexture/dita-bootstrap/archive/3.4.1.zip

# Install from the registry at dita-ot.org/plugins:
RUN dita --install org.dita-community.pdf-page-break
