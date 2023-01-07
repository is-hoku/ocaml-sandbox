(lang dune 3.4)

(name sandbox)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name sandbox)
 (synopsis "Top-level package")
 (description "This is OCaml sandbox")
 (depends ocaml dune))

(package
 (name hello)
 (synopsis "Say hello")
 (description "Just say hello")
 (depends ocaml dune))

(package
 (name practice1)
 (synopsis "Practice 1")
 (description "Squaresum, Fibonacci, and Euclid's Algorithm")
 (depends ocaml dune))
; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
