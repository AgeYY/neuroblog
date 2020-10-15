(TeX-add-style-hook
 "biophysics"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "bbm"
    "geometry"
    "graphicx"
    "amsmath"
    "float"
    "listings"
    "indentfirst"
    "braket"
    "authblk"
    "hyperref")
   (LaTeX-add-labels
    "capt"
    "olm"
    "ifmodel"
    "ifstate"
    "ifmodelS"
    "fireateeq"
    "isyn"
    "spikeraw")
   (LaTeX-add-bibitems
    "mitcourse"))
 :latex)

