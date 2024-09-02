# Configuring DocFX

Here's a rolling account of how to setup DocFX for yourself.

## Git adjustments
- Add ``_site`` folder to ``.gitignore`` in addition to any other items your DocFX git repository should avoid having.

## Favicons configuration
- Add all the favicons to the root folder.  It's advisable to generate all the favicons using a generator.
- Add all the favicon images to the resource list in the ``docfx.json``.

## UI customizations
- Add customizations using your own new template (i.e. logo and its size).
    - Add a new template folder in the root of your repo - name it repo-name-template, as an example.
    - Add ``main.css to`` the repo-name-template\public\ subfolder.
    - Use the ``main.css`` to specify customizations.
- Add the source folder for the modern template to the root of your DocFX repo and add it to the list of templates in the ``docfx.json``.
- Edit the modern template's ``_master.tmpl`` and add all the ``<link>`` references for all the icon sizes and the Apple touch icon.
