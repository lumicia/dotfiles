// Math font variants
#let scr(it) = text(features: ("ss01",), box($cal(it)$))
#let sf(it) = text(font: "New Computer Modern Sans Math")[#it]
#let rm(it) = text(style: "normal")[#it]
#let bf(it) = text(font: "LXGW WenKai GB", weight: "medium")[#it]

#let op = math.serif[$o p$]
