[
  # The maximum line length to allow.
  line_length: 80,

  # The files to format by default
  inputs: "{config,lib,test}/**/*.{ex,exs}",

  # Which libraries should we import formatting rules from.
  # Note: At the time of writing, the released versions of some of these do not
  # expose formatting rules.
  import_deps: [],

  # Which local function calls (that is, calls without a module name) should not
  # be parenthesised.
  locals_without_parens: [property: 3, property: 4, defmodel: 4, defmodellist: 4]
]

