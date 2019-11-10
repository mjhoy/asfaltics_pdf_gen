# asfaltics pdf gen

## instructions

### getting set up

Install the tool `wkhtmltopdf`: https://wkhtmltopdf.org/downloads.html
(Get the macOS Cocoa 64-bit package). You will need to allow MacOS to
install something from an unverified developer. Depending on your
settings, if you _right-click_ the package installer, and choose
"Open" (instead of just double-clicking), you should get an option to
open the file.

Open your terminal. Clone this git repository, and `cd` into it:

```
git clone https://github.com/mjhoy/asfaltics_pdf_gen.git
cd asfaltics_pdf_gen
```

### generating the pdfs

By default, it is set up to build all 1998 pages. You can change this
by editing the `start` and `end` values in the `Makefile`.
   
To download all the html pages, and generate pdfs, run:

```
make -j 8
```

(The `-j 8` says, run 8 processes in parallel to do this more quickly.)

### making adjustments

The `overrides.css` has PDF-specific css overrides. You can edit this
file, and then run the `make -j 8` command again to update the pdfs.

Note that if you've already downloaded the html files, you won't need
to download again.
