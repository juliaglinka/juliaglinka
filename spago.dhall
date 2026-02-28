{ name = "halogen-project"
, dependencies =
  [ "aff"
  , "arrays"
  , "console"
  , "datetime"
  , "effect"
  , "foldable-traversable"
  , "halogen"
  , "integers"
  , "maybe"
  , "node-buffer"
  , "node-fs"
  , "nullable"
  , "prelude"
  , "random"
  , "tailrec"
  , "web-dom"
  , "web-html"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
