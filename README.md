# pdf_monitor.bash - Real Time PDF Monitoring

Recursively finds the newest plots/figures (pdfs, first page only) and
assembles them chronologically into an n-page pdf.  Tries to ignore duplicate
files with different names (and meta-data).

Easy way to quickly review/summarize recent research.

Requires pdfjam, zathura, inotify, od, awk

# pdf_search.bash - Recursive grep for pdfs.

Recursively searches all pdfs for string.  Requires nothing special.

# report_ip.bash - Poor man's DynDNS

Cron job that copies my home IP to my work machine so I can easily ssh past my
cable provider's dynamic IP assignment.
