// Math font variants
#let scr(it) = text(features: ("ss01",), box($cal(it)$))
// The default font of caligraphy is not the same with LaTeX, uset the cmsy10 font from matplotlib instead.
#let cal(s) = text(s, font: "cmsy10")
// #let sf(it) = text(font: "New Computer Modern Sans Math")[#it]
#let bft(it) = text(font: "LXGW WenKai GB", weight: "medium")[#it]

// #let rm(it) = text(style: "normal")[#it]
#let rm(it) = math.serif(math.upright(it))
#let bf(it) = math.bold(math.upright(it))

// Custom notation
#let Obj = math.serif(math.upright("Obj"))
#let Hom = math.serif(math.upright("Hom"))
#let Aut = math.serif(math.upright("Aut"))
#let End = math.serif(math.upright("End"))
#let Inn = math.serif(math.upright("Inn"))
// Category
#let Set = math.sans("Set")
#let Grp = math.sans("Grp")
#let Ring = math.sans("Ring")
#let Mod = math.sans("Mod")
#let Ab = math.sans("Ab")

#let ker = math.serif(math.upright("ker"))
#let im = math.serif(math.upright("im"))

#let quotientset(it) = {
  [#it]
  math.slash
  h(0em)
  math.tilde
}
#let quotientgroup(l, r) = {
  [#l]
  math.slash
  h(0em)
  [#r]
}

// Let the emptyset symbol looks the same as diameter
#let emptyset = text(features: ("cv01",), box($emptyset$))

#let leftcoset(l, r) = {
  [#l]
  h(0em)
  math.slash
  h(0em)
  [#r]
}
#let rightcoset(l, r) = {
  [#l]
  h(0em)
  math.backslash
  h(0em)
  [#r]
}
