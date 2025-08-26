#import "@preview/theorion:0.4.0": *
// #import "@preview/theorion:0.4.0": make-frame, theorion-i18n, theorion-i18n-map
// #import cosmos.clouds: *

#let conf(doc) = {
  set text(font: "LXGW Neo ZhiSong Plus", size: 14pt, lang: "zh")
  // set text(font: "LXGW WenKai GB", size: 14pt, )
  set heading(numbering: "1.1.")
  show heading.where(level: 1): set block(below: 1.2em)

  doc
}


#let render-fn-zh(
  fill: silver,
  prefix: none,
  title: "",
  full-title: auto,
  ..args,
  body,
) = {
  // Main rendering
  let rendered = block(inset: 1em, fill: fill, radius: .4em, width: 100%, ..args)[
    #if full-title != "" {
      strong(full-title) + sym.space
    }
    // #body
    #text(font: "LXGW WenKai GB")[#body]
  ]
  if "html" in dictionary(std) {
    // HTML rendering
    context if target() == "html" {
      html.elem("div", attrs: (
        style: "background: "
          + fill.to-hex()
          + "; border-radius: .4em; padding: 1em; width: 100%; box-sizing: border-box; margin-bottom: .5em;",
      ))[
        #if full-title != "" {
          strong(full-title) + sym.space.nobreak + sym.space.nobreak
        }
        #body
      ]
    } else {
      rendered
    }
  } else {
    rendered
  }
}

#let (theorem-counter, theorem-box, theorem, show-theorem) = make-frame(
  "theorem",
  theorion-i18n-map.at("theorem"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: rgb("#ffebcd")),
)
#let (definition-counter, definition-box, definition, show-definition) = make-frame(
  "definition",
  theorion-i18n-map.at("definition"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: green.lighten(85%)),
)
#let (lemma-counter, lemma-box, lemma, show-lemma) = make-frame(
  "lemma",
  theorion-i18n-map.at("lemma"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  // render: render-fn-zh.with(fill: rgb("#ace5ee")),
  render: render-fn-zh.with(fill: rgb("#e6e6fa")),
  // render: render-fn-zh.with(fill: rgb("#4b0082").lighten(85%)),
)
#let (corollary-counter, corollary-box, corollary, show-corollary) = make-frame(
  "corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: red.lighten(85%)),
)
#let (axiom-counter, axiom-box, axiom, show-axiom) = make-frame(
  "axiom",
  theorion-i18n-map.at("axiom"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: rgb("#996515").lighten(85%)),
)
#let (postulate-counter, postulate-box, postulate, show-postulate) = make-frame(
  "postulate",
  theorion-i18n-map.at("postulate"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: silver.lighten(30%)),
)
#let (proposition-counter, proposition-box, proposition, show-proposition) = make-frame(
  "proposition",
  theorion-i18n-map.at("proposition"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: rgb("#6082b6").lighten(75%)),
)
#let (assumption-counter, assumption-box, assumption, show-assumption) = make-frame(
  "assumption",
  theorion-i18n-map.at("assumption"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: rgb("#fba0e3").lighten(55%)),
)
#let (property-counter, property-box, property, show-property) = make-frame(
  "property",
  theorion-i18n-map.at("property"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: rgb("#fffacd")),
)
#let (conjecture-counter, conjecture-box, conjecture, show-conjecture) = make-frame(
  "conjecture",
  theorion-i18n-map.at("conjecture"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: rgb("#a7fc00").lighten(65%)),
)
#let (example-counter, example-box, example, show-example) = make-frame(
  "example",
  theorion-i18n-map.at("example"),
  counter: theorem-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: render-fn-zh.with(fill: rgb("#89cff0").lighten(30%)),
)

#let show-env(body) = {
  show: show-theorem
  show: show-lemma
  show: show-corollary
  show: show-axiom
  show: show-postulate
  show: show-definition
  show: show-proposition
  show: show-assumption
  show: show-property
  show: show-conjecture
  show: show-example
  body
}
