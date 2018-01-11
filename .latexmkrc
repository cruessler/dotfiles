# use LuaLaTeX instead of the default PDFLaTeX
$pdflatex = "lualatex %O %S";
$pdf_mode = 1; $postscript_mode = $dvi_mode = 0;
$clean_ext = "run.xml";
# setting $bibtex_use to a value other than 0 or 1 makes latexmk count .bbl
# files as regeneratable and delete them when cleaning up
# see https://tex.stackexchange.com/a/83384
$bibtex_use = 2;
