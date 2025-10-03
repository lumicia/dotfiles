// Math font variants
#let scr(it) = text(features: ("ss01",), box($cal(it)$))
// The default font of caligraphy is not the same with LaTeX, uset the cmsy10 font from matplotlib instead.
#let cal(s) = text(s, font: "cmsy10")
// #let sf(it) = text(font: "New Computer Modern Sans Math")[#it]
#let bft(it) = text(font: "LXGW WenKai GB", weight: "medium")[#it]

// #let rm(it) = text(style: "normal")[#it]
#let rm(it) = math.serif(math.upright(it))
#let bf(it) = math.bold(math.upright(it))


// Category
#let Obj = math.serif(math.upright("Obj"))
#let Hom = math.serif(math.upright("Hom"))
#let Aut = math.serif(math.upright("Aut"))
#let End = math.serif(math.upright("End"))
#let Ext = math.serif(math.upright("Ext"))
#let Ann = math.serif(math.upright("Ann"))
#let Ass = math.serif(math.upright("Ass"))
#let Inn = math.serif(math.upright("Inn"))
#let Rees = math.serif(math.upright("Rees"))
#let Gr = math.serif(math.upright("Gr"))
#let Tor = math.serif(math.upright("Tor"))
#let Spec = math.serif(math.upright("Spec"))
#let rk = math.serif(math.upright("rk"))
#let adj = math.serif(math.upright("adj"))
#let char = math.serif(math.upright("char"))
#let sep = math.serif(math.upright("sep"))
#let pd = math.serif(math.upright("pd"))


#let cat(it) = math.sans(math.upright(it))
#let Set = math.sans("Set")
#let Grp = math.sans("Grp")
#let Ring = math.sans("Ring")
#let Rng = math.sans("Rng")
#let Mod = math.sans("Mod")
#let Fld = math.sans("Fld")
#let Ab = math.sans("Ab")
#let Alg = math.sans("Alg")
#let Aff = math.sans("Aff")
#let Vect = math.sans("Vect")
#let Seq = math.sans("Seq")

#let ker = math.serif(math.upright("ker"))
#let coker = math.serif(math.upright("coker"))
#let im = math.serif(math.upright("im"))
#let coim = math.serif(math.upright("coim"))


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

// Let the emptyset symbol looks as the same as diameter
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

#let chain = math.stretch(math.arrow.r, size: 40pt)
#let lchain = math.stretch(math.arrow.l, size: 40pt)

#let placeholder = line(start: (0em, .5em), end: (.5em, .5em), stroke: .6pt)

// Make the degree symbol a little bigger
#let degree = math.circle.stroked.small

// Exterior power symbol for _Algebra Chapter 0_
#let epw = scale(y: -100%)[$VV$]

#let MCyl = math.italic("MCyl")
