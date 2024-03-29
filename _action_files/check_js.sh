#!/bin/bash
# The purpose of this script is to check parity between official hosted  third party js libraries, and alternative CDNs used on this site.

function compare {
            printf "=================\ncomparing:\n$1 vs. $2\n"
            wget "$1" -O f1 &> /dev/null
            wget "$2" -O f2 &> /dev/null
            if ! cmp f1 f2; 
                then
                    printf "Files are NOT the same!\n"
                    exit 1;
                else
                    printf "Files are the same.\n"
            fi 
            }  

compare "https://unpkg.com/@primer/css/dist/primer.css" "https://cdn.jsdelivr.net/npm/@primer/css/dist/primer.css"
compare "https://hypothes.is/embed.js" "https://cdn.jsdelivr.net/npm/hypothesis/build/boot.js"
compare "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML" "https://cdn.jsdelivr.net/npm/mathjax@2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"
