# pdf_monitor.bash - Real Time PDF Monitoring

Recursively finds the newest plots/figures (pdfs, first page only) and
assembles them chronologically into an n-page pdf.  Tries to ignore duplicate
files with different names (and meta-data).

Easy way to quickly review/summarize recent research.

Requires pdfjam, zathura, inotify, od, awk

# pdf_search.bash - Recursive grep for pdfs.

Recursively searches all pdfs for string.  Requires nothing special.  Not sensitive to case by default.

~~~
. ~/bin/my_bash_tools/pdf_search.bash
cd /home/equant/directory/structure/full/of/directories/and/pdf/files
pdf J04381486
~~~

# report_ip.bash - Poor man's DynDNS

Cron job that copies my home IP to my work machine so I can easily ssh past my
cable provider's dynamic IP assignment.
