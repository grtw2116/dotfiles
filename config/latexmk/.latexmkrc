#!/usr/bin/perl
# commands for latex,bibtex,dvipdf. %S : source file, %B : base name, %D : pdf file, %O : option
$latex         = 'uplatex %O -shell-escape -interaction=nonstopmode -synctex=1 -kanji=utf8 %S';
$bibtex        = 'upbibtex %O %B -kanji=utf8';
$dvipdf        = 'dvipdfmx %O -o %D %S';

# スタイルファイルは sty/ に置く
ensure_path('TEXINPUTS', 'sty/');
ensure_path('BSTINPUTS', 'sty/');

# method to make pdf - 0:not making, 1:pdflatex, 2:ps2pdf, 3:dvipdf
$pdf_mode      = 3;

# 最大コンパイル回数
$max_repeat = 5;
