# Configuring DocFX

Here's a rolling account of how to setup DocFX for yourself.

## Git adjustments
- Add _site to .gitignore plus all the other items your site should not have

## Favicons configuration
- Add all the favicons to the root folder.  It's advisable to generate all the favicons using a generator.
- Add all the favicon images to the resource list in the docfx.json

## UI customizations
- Add customizations using a new template (i.e. logo and its size)
- Get the source for modern template and edit the _master.tmpl to make sure your favicon stays on iOS devices' bookmarks
