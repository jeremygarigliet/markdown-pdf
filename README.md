# Markdown-pdf

Converts markdown files to PDF. EZ.

---

## Run

Must be executed inside the directory containing the markdown file.  
Otherwise, you can replace `$(pwd)` with the desired path

>`$ docker run --rm -v "$(pwd)":/workdir jeremygarigliet/markdown-pdf README.md`

## Comfy mode

```bash
cat >> ~/.bashrc <<EOF
function markpdf() {
  docker run --rm -v \$(pwd):/workdir jeremygarigliet/markdown-pdf \$1
}
EOF
source ~/.bashrc
```

>`$ markpdf README.md`

## Usage

```
Usage: markdown-pdf [options] <markdown-file-path>

Options:

  -h, --help                             output usage information
  -V, --version                          output the version number
  <markdown-file-path>                   Path of the markdown file to convert
  -c, --cwd [path]                       Current working directory
  -p, --phantom-path [path]              Path to phantom binary
  -h, --runnings-path [path]             Path to runnings (header, footer)
  -s, --css-path [path]                  Path to custom CSS file
  -z, --highlight-css-path [path]        Path to custom highlight-CSS file
  -m, --remarkable-options [json]        Options to pass to Remarkable
  -f, --paper-format [format]            'A3', 'A4', 'A5', 'Legal', 'Letter' or 'Tabloid'
  -r, --paper-orientation [orientation]  'portrait' or 'landscape'
  -b, --paper-border [measurement]       Supported dimension units are: 'mm', 'cm', 'in', 'px'
  -d, --render-delay [millis]            Delay before rendering the PDF
  -t, --load-timeout [millis]            Timeout before the page is rendered in case `page.onLoadFinished` isn't fired
  -o, --out [path]                       Path of where to save the PDF
```