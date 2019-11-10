# asfaltics pdf gen

### how this works

The basic idea is to download all `.htm` files into an `html/`
directory, and then to run the files through the tool `wkhtmltopdf` to
produce pdfs in a `pdfs/` directory.

The `Makefile` here describes the recipes for doing these things.

`wkhtmltopdf` has lots of options. You can read more about them here:
https://wkhtmltopdf.org/usage/wkhtmltopdf.txt I've included one
option, `--user-style-sheet`, to add stylesheet overrides, using the
file `overrides.css`.

If you want to change the options given to `wkhtmltopdf`, you could
edit the part of the `Makefile` where it's referenced.

### getting set up

Install the tool `wkhtmltopdf`: https://wkhtmltopdf.org/downloads.html
(Get the macOS Cocoa 64-bit package). You will need to allow MacOS to
install something from an unverified developer. Depending on your
settings, if you _right-click_ the package installer, and choose
"Open" (instead of just double-clicking), you should get an option to
open the file.

Open your terminal. Clone this git repository, and `cd` into it:

```
# if you want to install into ~/Documents, for example:
cd ~/Documents
git clone https://github.com/mjhoy/asfaltics_pdf_gen.git
cd asfaltics_pdf_gen
```

### generating the pdfs

By default, it is set up to build all 1998 pages. 

First, make sure this is working by testing one page:

```
make pdfs/0001.pdf
```
   
If that runs succesfully, you should now have a `pdfs` directory
within `asfaltics_pdf_gen`, and it should have `0001.pdf` inside.

To download all the html pages and generate pdfs, run:

```
make -j 8
```

The `-j 8` says, run 8 processes in parallel to do this more
quickly. It takes several minutes to download the html files and
generate all pdfs.

### making adjustments

The `overrides.css` has PDF-specific css overrides. You can edit this
file, and then run the `make -j 8` command again to update the
pdfs. Or, run e.g. `make pdfs/0010.pdf` to see the changes applied to
only one pdf.

Note that if you've already downloaded the html files, you won't need
to download again.

If you're making small adjustments and testing them on certain pages,
you can edit the `start` and `end` values in the `Makefile`, so that
you are building a smaller set of pages.
