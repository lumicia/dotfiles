#let conf(doc) = {
  set text(size: 16pt, font: "LXGW WenKai GB")
  set page(
    paper: "a4",
    margin: (left: 2.5cm, right: 2cm, top: 3cm, bottom: 2.5cm),
    header: [
      #set align(right)
      #set text(8pt)
      #smallcaps([Chapter ])],
    footer: context [
      #set align(center)
      #set text(8pt)
      #counter(page).display("1 / 1", both: true)
    ],
  )
  set heading(numbering: (..nums) => {
    nums = nums.pos()
    if nums.len() == 1 {
      return numbering("I", ..nums)
    } else {
      numbering("1.", nums.last())
    }
  })
  let exercise-counter = counter("exercise")
  show heading.where(level: 2): it => {
    exercise-counter.update(0)
    it
  }

  doc
}

#let scr(it) = text(features: ("ss01",), box($cal(it)$))

#let sf = f => text(f, font: "New Computer Modern Sans Math")

#let rm = it => {
  text(style: "normal")[#it]
}

#let op = math.serif[$o p$]

#let section-counter = counter("section")

// 1. Define a function `exercise`, so I can use it like `#exercise[xxx]` to write exercises.
// 2. Adjust the styles of contents of exercises.
// 3. Show the number of exercises.
#let exercise-counter = counter("exercise")
#let exercise(it) = rect(width: 100%, radius: 5pt, inset: 10pt, stroke: none, fill: blue.lighten(85%))[
  #exercise-counter.step()
  #context {
    let heading-number = counter(heading).get()
    let current-number = exercise-counter.get()
    let numbers = (heading-number.last(), ..current-number)
    strong(numbering("1.1.", ..numbers))
  }
  #it
]

// TODO
// Add a custom configuration that whether the H1 title should be a Roma number or Arab number, the exercise number should be composed of H2 counter and exercise counter.
// If it's a Roma number, the H2 title should look like "1.", the exercise number should look like "1.1.".
// If it's Arab number, The H2 title should look like "1.1.", the exercise number should look like "1.1.1.".
