#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 0.80cm, top: 0.65cm, bottom: 0.55cm),
  fill: rgb("#000000"), // Pure Black OLED
  header: none,
  footer: context {
    let page_num = counter(page).get().first()
    place(
      bottom + left,
      text(size: 7.0pt, fill: rgb("#3f3f46"), weight: "bold")[
        ROBOTICS EXAM PREP • RAPID CHEATSHEET
      ]
    )
    align(right + horizon)[
      #text(size: 7.2pt, fill: rgb("#52525b"), weight: "bold")[
        PAGE #page_num
      ]
    ]
  }
)

#set text(
  font: ("Ubuntu", "DejaVu Sans", "Liberation Sans", "Noto Sans"),
  size: 7.6pt,
  fill: rgb("#d4d4d8"), // Zinc 300 crisp text
  spacing: 108%,
)

#set par(justify: false, leading: 0.54em)
#set list(spacing: 3.8pt, marker: text(fill: rgb("#71717a"), size: 5.5pt)[•])
#set enum(spacing: 3.8pt)

// ==========================================
// REUSABLE DARK THEME COMPONENTS
// ==========================================

#let card(title: "", color: rgb("#6366f1"), body) = {
  block(
    width: 100%,
    stroke: 0.75pt + color.transparentize(50%),
    radius: 5.5pt,
    fill: rgb("#09090d"),
    clip: true,
    inset: 0pt,
    [
      // Card Header
      #block(
        width: 100%,
        fill: color.darken(80%),
        stroke: (bottom: 0.6pt + color.transparentize(60%)),
        inset: (x: 7.5pt, y: 4.0pt),
        [
          #grid(
            columns: (auto, 1fr),
            gutter: 5pt,
            align: (left + horizon, left + horizon),
            box(
              width: 4.5pt,
              height: 4.5pt,
              radius: 100pt,
              fill: color.lighten(30%),
            ),
            text(fill: color.lighten(45%), weight: "bold", size: 8.3pt)[#title]
          )
        ]
      )
      // Card Body
      #block(
        inset: (x: 8.0pt, top: 5.5pt, bottom: 5.5pt),
        body
      )
    ]
  )
  v(3.5pt)
}

#let badge(text-content, color: rgb("#6366f1")) = {
  box(
    fill: color.darken(75%),
    stroke: 0.6pt + color.transparentize(30%),
    radius: 3pt,
    inset: (x: 3.6pt, y: 1.2pt),
    outset: 0pt,
    text(fill: color.lighten(55%), weight: "bold", size: 6.6pt)[#text-content]
  )
}

#let num-bullet(n, color: rgb("#f59e0b")) = {
  box(
    fill: color.darken(70%),
    stroke: 0.6pt + color.transparentize(30%),
    radius: 100pt,
    inset: (x: 3.6pt, y: 1.2pt),
    text(fill: color.lighten(50%), weight: "black", size: 6.5pt)[#n]
  )
}

#let highlight(txt, color: rgb("#60a5fa")) = {
  text(fill: color, weight: "bold")[#txt]
}

#let rounded-table(
  columns: (1fr, 1fr),
  stroke: none,
  fill: (_, _) => none,
  align: top + left,
  inset: 3.5pt,
  radius: 4.5pt,
  ..children
) = {
  block(
    width: 100%,
    radius: radius,
    clip: true,
    stroke: none,
    table(
      columns: columns,
      stroke: none,
      fill: fill,
      align: align,
      inset: inset,
      ..children
    )
  )
}

#let tip-box(title: "HIGH-YIELD EXAM DISTINCTION", body) = {
  block(
    width: 100%,
    fill: rgb("#140f02"),
    stroke: 0.85pt + rgb("#f59e0b").transparentize(20%),
    radius: 5.5pt,
    inset: (x: 7.5pt, y: 5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        box(
          width: 4.5pt,
          height: 4.5pt,
          radius: 100pt,
          fill: rgb("#f59e0b"),
        ),
        [
          #text(size: 6.9pt, weight: "black", fill: rgb("#fbbf24"))[#title]\
          #v(1.5pt)
          #text(size: 7.2pt, fill: rgb("#fef08a"))[#body]
        ]
      )
    ]
  )
}

#let header-banner(lec-num, lec-title, tag) = {
  block(
    width: 100%,
    stroke: 0.7pt + rgb("#27272a"),
    radius: 5.5pt,
    fill: rgb("#09090e"),
    inset: (x: 10pt, y: 4.5pt),
    [
      #grid(
        columns: (auto, 1fr, auto),
        gutter: 8pt,
        align: (left + horizon, left + horizon, right + horizon),
        [
          #text(size: 11.5pt, weight: "black", fill: rgb("#818cf8"))[ROBOTICS]
          #h(3pt)
          #text(size: 11.5pt, weight: "black", fill: rgb("#ffffff"))[STUDY GUIDE]
        ],
        [
          #text(size: 8.5pt, weight: "bold", fill: rgb("#3f3f46"))[|]
          #h(5pt)
          #text(size: 9.2pt, weight: "bold", fill: rgb("#e4e4e7"))[Lecture #lec-num: #lec-title]
        ],
        [
          #badge(tag, color: rgb("#10b981"))
          #h(3pt)
          #badge("LEC " + lec-num, color: rgb("#818cf8"))
        ]
      )
    ]
  )
  v(3pt)
}

// Flowchart visual helpers
#let flow-node(txt, sub: "", color: rgb("#38bdf8"), w: 100%) = block(
  width: w,
  fill: rgb("#0b1320"),
  stroke: 0.55pt + color.transparentize(30%),
  radius: 3.5pt,
  inset: (x: 4pt, y: 2.5pt),
  align(center)[
    #text(fill: color.lighten(40%), weight: "bold", size: 6.6pt)[#txt]
    #if sub != "" [\ #text(fill: rgb("#94a3b8"), size: 5.5pt)[#sub]]
  ]
)

#let flow-decision(txt, color: rgb("#f59e0b"), w: 100%) = block(
  width: w,
  fill: rgb("#181002"),
  stroke: 0.65pt + color,
  radius: 3.5pt,
  inset: (x: 4pt, y: 2.8pt),
  align(center)[
    #text(fill: rgb("#fde047"), weight: "bold", size: 6.6pt)[#txt]
  ]
)

#let flow-start(txt: "START") = box(
  fill: rgb("#27272a"),
  stroke: 0.5pt + rgb("#71717a"),
  radius: 100pt,
  inset: (x: 5pt, y: 1.2pt),
  text(fill: rgb("#fafafa"), weight: "bold", size: 5.8pt)[#txt]
)

// =========================================================
// PAGE 1: LECTURE 01 — FOUNDATIONS & ARCHITECTURE
// =========================================================

#header-banner("01", "Foundations & Architecture", "CORE CONCEPTS")

#columns(3, gutter: 8.5pt)[

  // --- 1. WHAT IS A ROBOT? ---
  #card(title: "1. What is a Robot?", color: rgb("#6366f1"))[
    #highlight("Core Definition:", color: rgb("#a5b4fc")) An electromechanical system characterized by three essential traits:
    #v(2.5pt)
    - #badge("Reprogrammable", color: rgb("#6366f1")) Flexible software control
    - #badge("Multifunctional", color: rgb("#06b6d4")) Versatile multi-task capability
    - #badge("Sensible", color: rgb("#10b981")) Real-time environment awareness

    #v(4.5pt)
    #highlight("Key Terminology:", color: rgb("#a5b4fc"))
    #v(1.5pt)
    - #highlight("Robot:", color: rgb("#ffffff")) Physical mechanism performing human tasks autonomously or via teleoperation.
    - #highlight("Robotics:", color: rgb("#ffffff")) Science of mechanical design, kinematics, control & software.
    - #highlight("Telerobotics:", color: rgb("#ffffff")) Remote-controlled operation in extreme/hazardous environments.
  ]

  // --- 2. AUTOMATION VS ROBOTS ---
  #card(title: "2. Automation vs. Robots", color: rgb("#06b6d4"))[
    #rounded-table(
      columns: (1fr, 1fr),
      inset: 4.0pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#082f49") } else { rgb("#070b12") },
      align: top + left,
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 7.4pt)[Fixed Automation]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 7.4pt)[Flexible Robots]],
      [
        - #highlight("Single dedicated task", color: rgb("#ffffff"))\
        #v(1pt)
        - Maximum speed & efficiency\
        #v(1pt)
        - Rigid; high retooling cost\
        #v(1pt)
        - _Ex:_ Bottling line, dishwasher
      ],
      [
        - #highlight("Diverse multiple tasks", color: rgb("#ffffff"))\
        #v(1pt)
        - Reprogrammable motions\
        #v(1pt)
        - High mechanical flexibility\
        #v(1pt)
        - _Ex:_ 6-DOF arms, AGVs, CNCs
      ]
    )
  ]

  // --- 3. 3 LAWS OF ROBOTICS ---
  #card(title: "3. Asimov's 3 Laws of Robotics", color: rgb("#f59e0b"))[
    #grid(
      columns: (auto, 1fr),
      gutter: 5.5pt,
      row-gutter: 5.5pt,
      align: (left + top, left + top),
      num-bullet("1", color: rgb("#ef4444")),
      [#highlight("Safety First:", color: rgb("#ffffff")) May not injure a human or, through inaction, allow harm.],
      num-bullet("2", color: rgb("#f59e0b")),
      [#highlight("Obedience:", color: rgb("#ffffff")) Must obey human orders, #highlight("except", color: rgb("#fbbf24")) when conflicting with Law 1.],
      num-bullet("3", color: rgb("#10b981")),
      [#highlight("Self-Defense:", color: rgb("#ffffff")) Must protect own existence, unless conflicting with Laws 1 or 2.]
    )
  ]

  #colbreak()

  // --- 4. CORE HARDWARE COMPONENTS ---
  #card(title: "4. Core Hardware Architecture", color: rgb("#10b981"))[
    #grid(
      columns: (auto, 1fr),
      gutter: 6.5pt,
      row-gutter: 6.5pt,
      align: (left + top, left + top),
      [#highlight("Sensors", color: rgb("#34d399"))],
      [
        *Data Input:* Internal state (encoders, resolvers) & external world (cameras, LIDAR, tactile/touch).
      ],
      [#highlight("Controller", color: rgb("#34d399"))],
      [
        *The 'Brain':* Executes trajectories, computes kinematics & closes real-time feedback loops.
      ],
      [#highlight("Actuators", color: rgb("#34d399"))],
      [
        *The 'Muscles':* Convert electrical/fluid energy into physical movement (servos, steppers, pneumatics).
      ]
    )
  ]

  // --- 5. TYPES & APPLICATIONS ---
  #card(title: "5. Robot Types & Applications", color: rgb("#a855f7"))[
    #highlight("Mechanical Architectures:", color: rgb("#c084fc"))
    #v(1.5pt)
    - #highlight("Manipulators:", color: rgb("#ffffff")) Serial arms (Articulated, SCARA, Cartesian).
    - #highlight("Mobile & Wheeled:", color: rgb("#ffffff")) Differential drive, Omni, AGVs.
    - #highlight("Legged:", color: rgb("#ffffff")) Bipedal, quadrupeds, hexapods.
    - #highlight("Autonomous Vehicles:", color: rgb("#ffffff")) AUVs (Underwater), UAVs (Aerial drones).

    #v(4.5pt)
    #highlight("Primary Drivers (3 D's / U's):", color: rgb("#c084fc"))
    #v(2.5pt)
    #grid(
      columns: 1fr,
      row-gutter: 3pt,
      [#badge("Dangerous", color: rgb("#ef4444")) #h(3pt) Nuclear cleanup, bomb disposal.],
      [#badge("Dull / Repetitive", color: rgb("#f59e0b")) #h(3pt) High-speed assembly, spot welding.],
      [#badge("Dirty / Unwanted", color: rgb("#3b82f6")) #h(3pt) Sewer inspection, toilet cleaning.]
    )
  ]

  #colbreak()

  // --- 6. PROGRAMMING METHODS ---
  #card(title: "6. Robot Programming Methods", color: rgb("#3b82f6"))[
    #badge("ON-LINE METHODS", color: rgb("#3b82f6")) #text(size: 7.0pt, fill: rgb("#93c5fd"))[(At the Robot)]
    #v(2.5pt)
    - #highlight("Teach Pendant:", color: rgb("#ffffff")) Handheld button box. Jog arm to waypoints & save; controller calculates PTP paths.
    - #highlight("Lead-Through:", color: rgb("#ffffff")) Manually guide arm by hand. Records continuous stream (60--80 pts/sec; high memory).

    #v(4.5pt)
    #badge("OFF-LINE METHODS", color: rgb("#8b5cf6")) #text(size: 7.0pt, fill: rgb("#c4b5fd"))[(Remote / Code)]
    #v(2.5pt)
    - #highlight("Programming Languages:", color: rgb("#ffffff")) Text code (AML, VAL, RobotStudio) without halting factory line.
    - #highlight("Task-Level:", color: rgb("#ffffff")) High-level goals ("pick item A") auto-compiled into trajectory commands.
  ]

  // --- 7. PERFORMANCE METRICS ---
  #card(title: "7. Performance Metrics", color: rgb("#ec4899"))[
    - #highlight("Working Volume:", color: rgb("#ffffff")) 3D envelope reachable by end-effector.
    - #highlight("Speed & Accel:", color: rgb("#ffffff")) Motion rate; trade-off with precision & payload.
    - #highlight("Resolution:", color: rgb("#ffffff")) Smallest commandable incremental step.
    - #highlight("Accuracy:", color: rgb("#ffffff")) Closeness between *commanded target* and *actual reached position* ($|x_text("target") - x_text("actual")|$).
    - #highlight("Repeatability:", color: rgb("#ffffff")) Ability to return to the *exact same point* over repeated cycles ($sigma$).
  ]

  // --- EXAM TIP BOX ---
  #tip-box[
    *Accuracy vs. Repeatability:* A robot can have *High Repeatability* (hits the identical spot 100 times in a row) but *Low Accuracy* (that spot is systematically 2 cm off target)!
  ]
]

#pagebreak()

// =========================================================
// PAGE 2: LECTURE 02 — SENSORS & TRANSDUCTION
// =========================================================

#header-banner("02", "Sensors, Transduction & Perception", "PERCEPTION")

#columns(3, gutter: 8.5pt)[

  // --- 1. SENSING & TRANSDUCTION ---
  #card(title: "1. Sensing & Transduction", color: rgb("#6366f1"))[
    - #highlight("Sensing:", color: rgb("#ffffff")) Collecting information about the world.
    - #highlight("Sensor:", color: rgb("#ffffff")) Device mapping physical/chemical phenomena to quantitative signals.
    - #highlight("Transduction Principle:", color: rgb("#a5b4fc")) Converting one energy form into another.

    #v(2.5pt)
    #rounded-table(
      columns: (1.1fr, 1.3fr),
      inset: 3.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#1e1b4b") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#080811") },
      align: top + left,
      [#text(fill: rgb("#c7d2fe"), weight: "bold", size: 7.0pt)[Sensor Type]],
      [#text(fill: rgb("#c7d2fe"), weight: "bold", size: 7.0pt)[Transduction Mechanism]],
      [*Thermistor*], [Temp $arrow.r$ Resistance ($R$)],
      [*Photodiode*], [Light $arrow.r$ Current ($I$)],
      [*Pyroelectric*], [Thermal rad. $arrow.r$ Voltage ($V$)],
      [*Humidity*], [Moisture $arrow.r$ Capacitance ($C$)],
      [*LVDT*], [Position $arrow.r$ Inductance ($L$)],
      [*Microphone*], [Sound press. $arrow.r$ Elect. signal]
    )
  ]

  // --- 2. SENSOR CLASSIFICATIONS ---
  #card(title: "2. Sensor Classifications", color: rgb("#06b6d4"))[
    #highlight("State Focus:", color: rgb("#38bdf8"))
    #v(1.5pt)
    - #badge("Proprioceptive", color: rgb("#0284c7")) (Internal): Measures internal parameters (joint angle, wheel position, battery, tachometers/encoders/accelerometers).
    - #badge("Exteroceptive", color: rgb("#059669")) (External): Environment & objects (proximity, vision, range).

    #v(3.5pt)
    #highlight("Energy Interaction:", color: rgb("#38bdf8"))
    #v(1.5pt)
    - #highlight("Active:", color: rgb("#ffffff")) Emits energy & reads reflection (Sonar, Radar, Modulated IR, LiDAR).
    - #highlight("Passive:", color: rgb("#ffffff")) Receives ambient energy only (Cameras, Pyroelectric, LDR).

    #v(3.5pt)
    #highlight("Contact & Modality:", color: rgb("#38bdf8"))
    #v(1.5pt)
    - #highlight("Contact / Non-contact:", color: rgb("#ffffff")) Touch (bumpers) vs. remote (optical, ultrasonic).
    - #highlight("Visual / Non-visual:", color: rgb("#ffffff")) Vision cameras vs. non-optical sensors.
  ]

  #colbreak()

  // --- 3. CONTACT & RESISTIVE SENSORS ---
  #card(title: "3. Contact & Resistive Sensors", color: rgb("#f59e0b"))[
    #badge("A. FEELERS (TACTILE/CONTACT)", color: rgb("#f59e0b"))
    #v(1.5pt)
    - #highlight("Whiskers:", color: rgb("#ffffff")) Piano wire in metal hoop; deflection closes circuit; binary ($0"/"1$) output.
    - #highlight("Bumpers & Guards:", color: rgb("#ffffff")) Frame on microswitches; collision triggers switch; binary ($0"/"1$) output.

    #v(3.5pt)
    #badge("B. RESISTIVE (VARIABLE R)", color: rgb("#d97706"))
    #v(1.5pt)
    - #highlight("Bend Sensors:", color: rgb("#ffffff")) Flexible strips where $R$ increases as bent ($10 "k"Omega - 35 "k"Omega$). _Uses:_ Joint angles, wall-following, loads.
    - #highlight("Potentiometers:", color: rgb("#ffffff")) Linear/rotational variable resistors tracking sliding parts or rotating joint shafts.
    - #highlight("Photocells (CdS / LDR):", color: rgb("#ffffff")) Resistance shifts with light; highly non-linear, ideal for light tracking.
  ]

  // --- 4. CAPACITIVE VS. INDUCTIVE ---
  #card(title: "4. Capacitive vs. Inductive Sensors", color: rgb("#10b981"))[
    #rounded-table(
      columns: (1fr, 1fr),
      inset: 3.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#064e3b") } else { rgb("#06120e") },
      align: top + left,
      [#text(fill: rgb("#6ee7b7"), weight: "bold", size: 7.2pt)[Capacitive (All Materials)]],
      [#text(fill: rgb("#6ee7b7"), weight: "bold", size: 7.2pt)[Inductive (Metals Only)]],
      [
        - Measures change in *dielectric*\
        - Detects #highlight("metals & non-metals", color: rgb("#ffffff")) (liquids, plastics, powders)\
        - Senses through glass/plastic\
        - Sensitive to dust & humidity\
        #v(1.5pt)
        #badge("APPLICATIONS", color: rgb("#10b981"))\
        - *Level Detection:* Liquid/grains\
        - *Proximity:* Assembly lines\
        - *Touch Sensing:* Touchscreens
      ],
      [
        - Emits AC magnetic field; senses *eddy currents*\
        - Detects #highlight("metals ONLY", color: rgb("#ffffff"))\
        - Max on *ferrous* (iron/steel)\
        - Immune to oil, dust & water\
        #v(1.5pt)
        #badge("APPLICATIONS", color: rgb("#059669"))\
        - *Position:* Metal part automation\
        - *Speed:* Rotating gears/shafts\
        - *Metal Detection:* Safety
      ]
    )
  ]

  #colbreak()

  // --- 5. INFRARED (IR) SENSORS ---
  #card(title: "5. Infrared (IR) Sensor Types", color: rgb("#a855f7"))[
    #rounded-table(
      columns: (0.95fr, 1.15fr, 0.95fr),
      inset: 2.8pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#3b0764") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#080811") },
      align: top + left,
      [#text(fill: rgb("#d8b4fe"), weight: "bold", size: 6.7pt)[Type]],
      [#text(fill: rgb("#d8b4fe"), weight: "bold", size: 6.7pt)[Principle & Trade-offs]],
      [#text(fill: rgb("#d8b4fe"), weight: "bold", size: 6.7pt)[Applications]],
      [
        #highlight("Intensity-Based", color: rgb("#ffffff"))\
        _Reflective_
      ],
      [
        - Measures reflected light\
        - #badge("Pro", color: rgb("#10b981")) Cheap, simple\
        - #badge("Con", color: rgb("#ef4444")) Ambient & color sensitive
      ],
      [
        - Line-following\
        - Wall-tracking\
        - Break-beams
      ],
      [
        #highlight("Modulated IR", color: rgb("#ffffff"))\
        _Proximity_
      ],
      [
        - Flashes at $32 - 45 "kHz"$\
        - Receiver demodulates signal\
        - #badge("Pro", color: rgb("#10b981")) Immune to ambient light
      ],
      [
        - Proximity sensing\
        - Remote controls\
        - Obstacle avoidance
      ],
      [
        #highlight("IR Triangulation", color: rgb("#ffffff"))\
        _PSD Ranger_
      ],
      [
        - Emitter + lens + *PSD*\
        - Angle of return gives range\
        - #badge("Pro", color: rgb("#10b981")) Color & light immune
      ],
      [
        - Sharp GP2D02\
          ($10 - 80 "cm"$)\
        - Distance map
      ]
    )
  ]

  // --- 6. ULTRASONIC SENSORS & NOISE ---
  #card(title: "6. Ultrasonic Sensors & Noise", color: rgb("#3b82f6"))[
    - #highlight("Principle:", color: rgb("#ffffff")) Ultrasound burst ($approx 50 "kHz"$). Time-of-Flight ($t$):
      $ D = v dot t quad ==> quad d = (v dot t) / 2 quad (v approx 340 "m/s in air") $
    - #highlight("Limitations:", color: rgb("#ffffff"))
      - *Bearing Uncertainty:* Wide beam spread (opening arc $approx 30^circle$).
      - *Speed Latency:* Sound is slow (e.g. $30 "m"$ round-trip takes $approx 200 "ms"$).
    - #highlight("Noise Issues:", color: rgb("#ffffff")) Acoustic noise & sensor crosstalk.
  ]

  // --- 7. LASER RANGE FINDERS (LiDAR) & EXAM TIP ---
  #card(title: "7. Laser Range Finders (LiDAR)", color: rgb("#ec4899"))[
    - #highlight("Performance:", color: rgb("#ffffff")) Long range ($2 "m" - 500 "m"$), high resolution ($10 "mm"$), fast scans ($13 - 40 "ms"$).
    - #highlight("Robustness:", color: rgb("#ffffff")) Narrow beam; immune to ambient light & specular reflections.
  ]

  #tip-box(title: "HIGH-YIELD EXAM COMPARISON")[
    *Inductive vs. Capacitive:* Inductive senses *metals only*; Capacitive senses *all materials* (dielectric shift). \
    *Ultrasonic vs. LiDAR:* Sonar has wide *bearing uncertainty* ($approx 30^circle$) & latency; LiDAR provides millimeter angular precision.
  ]
]

#pagebreak()

// =========================================================
// PAGE 3: LECTURE 03 — AGENCY, BEHAVIORS & SCHEMA THEORY
// =========================================================

#header-banner("03", "Agency, Behaviors & Schema Theory", "AGENCY & CONTROL")

#columns(3, gutter: 8.5pt)[

  // --- 1. AGENCY & MARR'S 3-LEVEL FRAMEWORK ---
  #card(title: "1. Agency & Marr's 3-Level Framework", color: rgb("#6366f1"))[
    - #highlight("Agency:", color: rgb("#ffffff")) Capacity of an entity to act intentionally, make choices, and exert control over actions and outcomes.
    - #highlight("David Marr's Framework:", color: rgb("#a5b4fc")) Decomposes information-processing systems into 3 empirical layers:
    #v(2pt)
    + #highlight("Level 1: Computational (Theory):", color: rgb("#ffffff")) *What* is the agent doing & *Why*? Ultimate goal, mathematical theory & constraints.
    + #highlight("Level 2: Algorithmic (Representation):", color: rgb("#ffffff")) *How* is the task processed? Input/output representations, transformations & planning.
    + #highlight("Level 3: Implementational (Physical):", color: rgb("#ffffff")) *How* is it physically realized? Hardware/substrate (synapses/muscles vs. MCUs/actuators).
    #v(2.5pt)
    #badge("CRUCIAL EXAM FACT", color: rgb("#f59e0b")) #text(size: 6.8pt, fill: rgb("#fef08a"))[L1 & L2 are universal to all agents; differences between biology & robots exist #underline[*only at Level 3*].]
  ]

  // --- 2. MOSQUITO VS SEARCH & RESCUE ---
  #card(title: "2. Case Study: Mosquito vs. Robot", color: rgb("#06b6d4"))[
    #rounded-table(
      columns: (0.75fr, 1.1fr, 1.15fr),
      inset: 2.8pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#082f49") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#070b12") },
      align: top + left,
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.7pt)[Marr Level]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.7pt)[Mosquito (Bio)]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.7pt)[Search & Rescue (Robot)]],
      [*L1: Comp.*], [Locate warm host for blood meal], [Locate human survivors in disaster],
      [*L2: Algo.*], [Gradient ascent on heat & $text("CO")_2$], [Steer based on thermal & $text("CO")_2$ inputs],
      [*L3: Impl.*], [Olfactory pits, flight muscles], [Thermopile, $text("CO")_2$ sensor, MCUs, wheels]
    )
  ]

  // --- 3. BIO-INSPIRATION TO ROBOTIC TASKS ---
  #card(title: "3. Biological Inspiration Mappings", color: rgb("#059669"))[
    #rounded-table(
      columns: (0.85fr, 1fr, 1.15fr),
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#064e3b") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#06120e") },
      align: top + left,
      [#text(fill: rgb("#6ee7b7"), weight: "bold", size: 6.6pt)[Animal / Task]],
      [#text(fill: rgb("#6ee7b7"), weight: "bold", size: 6.6pt)[L2: Algorithm]],
      [#text(fill: rgb("#6ee7b7"), weight: "bold", size: 6.6pt)[L3: Implementation]],
      [*Bat* (Avoidance)], [Echo delay ranging], [Ultrasonic sensors & CPU],
      [*Ant* (Pathfind)], [Ant Colony Optim. (ACO)], [Digital pheromones/maps],
      [*Bird* (Flocking)], [Reynolds Boids (Cohesion, Alignment, Separation)], [UAV drones + local wireless communication],
      [*Frog* (Grasp)], [Motion track + reflex], [High-speed camera + arm],
      [*Cuttlefish*], [Spatial pattern mapping], [E-Skin & vision cameras]
    )
  ]

  #colbreak()

  // --- 4. DEFINITION OF ROBOTIC BEHAVIOR ---
  #card(title: "4. Definition of Robotic Behavior", color: rgb("#10b981"))[
    - #highlight("Behavior:", color: rgb("#ffffff")) Mathematical mapping of sensory inputs to motor action patterns to achieve a task.
    - #highlight("Action-Perception Cycle:", color: rgb("#34d399")) Continuous loop where perception drives action, action alters environment, and environment feeds perception.
    - #highlight("Gibson's Ecological Approach:", color: rgb("#34d399")) Perception exists solely to support action. *"The world is its own best representation."*
    - #highlight("Affordances:", color: rgb("#ffffff")) Directly perceivable action possibilities (e.g. *climbability*, *sitability*) without complex mental reconstruction.

    #v(3pt)
    #highlight("Mathematical Formulations:", color: rgb("#34d399"))
    - #highlight("Stimulus-Response (S-R):", color: rgb("#ffffff")) $ {B : S arrow.r R} $
    - #highlight("Schema Notation:", color: rgb("#ffffff")) $ B[S] = R $
      - $S["Sensor Data"] arrow.r "Percept"$ (filters raw noise into percept).
      - $R["Percept"] arrow.r "Action"$ (maps percept to motor command).
  ]

  // --- 5. BEHAVIOR TAXONOMIES ---
  #card(title: "5. Taxonomies of Behaviors", color: rgb("#f59e0b"))[
    #badge("1. REFLEXIVE (S-R)", color: rgb("#ef4444"))
    - Hardwired, direct neural/electronic connection for fastest execution.
    - #highlight("Fixed-Action Pattern (FAP):", color: rgb("#ffffff")) Response continues for *longer duration* than the stimulus (e.g. web spinning, courtship dance, nut burying, duckling imprinting).
    - #highlight("Taxis:", color: rgb("#ffffff")) Orienting reflex relative to stimulus (e.g. *phototaxis* turning towards light). _Can co-occur with FAP._

    #v(3.5pt)
    #badge("2. REACTIVE (LEARNED / MUSCLE MEMORY)", color: rgb("#f59e0b"))
    - Learned through repetition and consolidated into automatic execution without conscious thought (e.g. riding bike, skiing).
    - _Conscious overthinking degrades reactive performance._

    #v(3.5pt)
    #badge("3. CONSCIOUS (DELIBERATIVE)", color: rgb("#3b82f6"))
    - Goal-directed, high cognition, planning, reasoning, puzzle solving.
  ]

  #colbreak()

  // --- 6. SCHEMA THEORY & OOP ---
  #card(title: "6. Schema Theory in Robotics (OOP)", color: rgb("#a855f7"))[
    - #highlight("Schema Theory:", color: rgb("#ffffff")) Translates animal behavior into reusable *Object-Oriented Programming (OOP)* classes.
    - Foundation of the #highlight("Reactive Layer", color: rgb("#c084fc")) in hybrid architectures.
    - #highlight("Anatomy of a Schema Class:", color: rgb("#ffffff"))
      + *Schema-Specific Data* $arrow.r$ Member Variables (models, states).
      + *Procedural Knowledge* $arrow.r$ Methods (computational algorithms).
    - #highlight("Schema Instantiation (SI):", color: rgb("#ffffff")) Generic template class parameterized with runtime values (e.g. bike seat height $arrow.r$ active SI object).
    - Primitive behavior = #badge("1 Perceptual Schema", color: rgb("#0284c7")) + #badge("1 Motor Schema", color: rgb("#059669")).
  ]

  // --- 7. VECTOR FIELDS & FROG TAXIS ---
  #card(title: "7. Vector Fields & Frog Snapping", color: rgb("#3b82f6"))[
    - #highlight("Frog Algorithmic Schemas:", color: rgb("#ffffff"))
      - *Feed Schema:* Small moving blob $arrow.r$ Snap tongue.
      - *Flee Schema:* Large moving blob $arrow.r$ Runaway jump.
    - #highlight("Level 3 Vector Fields:", color: rgb("#ffffff"))
      - Stimulus mapped as vector $(m, theta)$.
      - *Distance-Intensity Scaling:* Weaker stimulus (far away fly) generates a *harder snap vector*.
      - *Vector Summation ($Sigma$):* Left eye vector ($v_L$) + Right eye vector ($v_R$) $==> V_("resultant") = v_L + v_R$ for optimal tongue trajectory.
  ]

  // --- 8. INNATE RELEASING MECHANISMS (IRM) ---
  #card(title: "8. Innate Releasing Mechanisms (IRM)", color: rgb("#ec4899"))[
    - #highlight("Releasers as Boolean Latches:", color: rgb("#ffffff"))
      - `PRESENT` (true) $arrow.r$ Behavior executes.
      - `NOT_PRESENT` (false) $arrow.r$ Gated entirely (no default output).
    - #highlight("Compound Releasers:", color: rgb("#ffffff")) Condition combines *External Stimuli* (food sensed) $+$ *Internal State / Motivation* (hunger level / battery).
    - #highlight("Implicit Chaining:", color: rgb("#ffffff")) Linking schemas via releaser states allows complex sequences to emerge without a centralized planner.
  ]

  #tip-box(title: "EXAM HIGHLIGHTS: LECTURE 03")[
    *Marr's Level 3:* Only hardware/biology separates humans & robots; L1/L2 are universal. \
    *FAP vs. Taxis:* FAP action outlasts the stimulus duration; Taxis is directional steering. \
    *IRM Gating:* When releaser is false, behavior is shut off with *no default output*.
  ]
]

#pagebreak()

// =========================================================
// PAGE 4: LECTURE 04 — HARDWARE PLATFORMS & BEHAVIOR LOGIC
// =========================================================

#header-banner("04", "LEGO EV3 Architecture & Reactive Control Logic", "PLATFORMS & LOGIC")

#columns(3, gutter: 8.5pt)[

  // --- 1. EV3 HARDWARE ARCHITECTURE ---
  #card(title: "1. LEGO Mindstorms EV3 Architecture", color: rgb("#6366f1"))[
    - #highlight("Processing Unit:", color: rgb("#ffffff")) ARM9 @ $300 "MHz"$, $16 "MB"$ Flash, $64 "MB"$ RAM.
    - #highlight("Operating System:", color: rgb("#ffffff")) Embedded Linux-based OS.
    - #highlight("Sensor Ports (1-4):", color: rgb("#a5b4fc")) $4$ Input ports supporting Analog & high-speed Digital UART up to $460.8 "kbit/s"$.
    - #highlight("Motor Ports (A-D):", color: rgb("#a5b4fc")) $4$ Output ports with built-in optical rotation encoders for position/speed feedback.
    - #highlight("I/O & Expansion:", color: rgb("#ffffff"))
      - High-speed USB ($480 "Mbit/s"$) + Host daisy-chaining (up to 3 levels), WiFi dongle, & USB storage.
      - Micro SD-card slot (supports up to $32 "GB"$).
    - #highlight("Display & UI:", color: rgb("#ffffff")) $178 times 128$ monochrome LCD matrix, 6 backlit navigation/debugging buttons.
    - #highlight("Wireless Comms:", color: rgb("#ffffff")) Bluetooth v2.1 + EDR, Apple/Android smart device protocol.
  ]

  // --- 2. EVOLUTION OF LEGO ROBOTICS ---
  #card(title: "2. Platform Generations & Modules", color: rgb("#06b6d4"))[
    #rounded-table(
      columns: (0.8fr, 0.9fr, 1.3fr),
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#082f49") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#070b12") },
      align: top + left,
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.6pt)[Platform]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.6pt)[CPU / OS]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.6pt)[Key Ports & Features]],
      [*RCX (1998)*], [Hitachi H8], [3 In / 3 Out; Optical IR tower comms],
      [*NXT (2006)*], [ARM7 + AVR], [4 In / 3 Out; Bluetooth, $100 times 64$ LCD],
      [*EV3 (2013)*], [ARM9 Linux], [4 In / 4 Out; Daisy-chain, USB Host, SD]
    )
    #v(2pt)
    #highlight("Sensor & Actuator Modules:", color: rgb("#38bdf8"))
    - #highlight("Motors:", color: rgb("#ffffff")) Large (high torque) & Medium (high RPM) with integrated tacho-encoders.
    - #highlight("Sensors:", color: rgb("#ffffff")) Touch (binary limit), Color (ambient/reflected/RGB), IR Seeker/Beacon, Ultrasonic.
  ]

  #colbreak()

  // --- 3. STEP 1: AVOID COLLISION ---
  #card(title: "3. Step 1: Avoid Collision (Reflex)", color: rgb("#f59e0b"))[
    #badge("PURE REFLEXIVE BEHAVIOR", color: rgb("#ef4444"))
    #v(1.5pt)
    - #highlight("Objective:", color: rgb("#ffffff")) Move continuously; instantly back up and pivot when a physical impact occurs.
    
    #v(2pt)
    // Real Visual Flowchart 1
    #block(
      fill: rgb("#06060a"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4.5pt,
      inset: 4pt,
      [
        #align(center)[
          #flow-start(txt: "START") #h(3pt) #text(fill: rgb("#71717a"), size: 6.5pt)[$arrow.r$] #h(3pt) #flow-decision("Is Collision? (Touch == 1)")
        ]
        #v(2pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 4pt,
          align: center,
          [
            #text(fill: rgb("#ef4444"), weight: "black", size: 6.0pt)[YES $arrow.b$] \
            #flow-node("Reverse & Turn", sub: "Motors B+C: -30, then steer", color: rgb("#ef4444"))
          ],
          [
            #text(fill: rgb("#10b981"), weight: "black", size: 6.0pt)[NO $arrow.b$] \
            #flow-node("Move Forward", sub: "Motors B+C: Power = 75", color: rgb("#10b981"))
          ]
        )
      ]
    )
    #v(2pt)
    - #highlight("Collision == True:", color: rgb("#ffffff")) Reverse ($-30$, 2 rot) $arrow.r$ steer turn ($-45 slash 30$, 2 rot).
    - Direct hardware-to-motor S-R loop without state memory.
  ]

  // --- 4. STEP 2: LAYERED OBSTACLE AVOIDANCE ---
  #card(title: "4. Step 2: Collision + Obstacle Avoidance", color: rgb("#10b981"))[
    #badge("HIERARCHICAL PRIORITY ARBITRATION", color: rgb("#10b981"))
    #v(1.5pt)
    - Combines contact (Touch) and non-contact (Proximity/Force) into a 2-tier reactive hierarchy:
    
    #v(2pt)
    // Real Visual Flowchart 2
    #block(
      fill: rgb("#06060a"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4.5pt,
      inset: 4pt,
      [
        #grid(
          columns: (1.1fr, 1.4fr),
          gutter: 4pt,
          align: top + center,
          [
            #flow-decision("1. Collision? (Touch)")
            #v(1.5pt)
            #text(fill: rgb("#ef4444"), weight: "black", size: 5.8pt)[YES $arrow.b$]
            #flow-node("Reverse & Turn", sub: "P1: Emergency Reflex", color: rgb("#ef4444"))
          ],
          [
            #flow-decision("2. Distance < 40cm?")
            #v(1.5pt)
            #grid(
              columns: (1fr, 1fr),
              gutter: 3pt,
              [
                #text(fill: rgb("#f59e0b"), weight: "black", size: 5.8pt)[YES $arrow.b$]\
                #flow-node("Turn Away", sub: "P2: Proximity", color: rgb("#f59e0b"))
              ],
              [
                #text(fill: rgb("#10b981"), weight: "black", size: 5.8pt)[NO $arrow.b$]\
                #flow-node("Forward", sub: "P3: Cruise", color: rgb("#10b981"))
              ]
            )
          ]
        )
      ]
    )
    #v(2pt)
    - #highlight("P1 (Touch):", color: rgb("#ffffff")) Emergency physical recovery (overrides all).
    - #highlight("P2 (Proximity):", color: rgb("#ffffff")) Smooth steering turn away before contact.
    - #highlight("P3 (Default):", color: rgb("#ffffff")) Drive straight ahead.
  ]

  #colbreak()

  // --- 5. STEP 3A: 1-SENSOR LINE FOLLOWING ---
  #card(title: "5. Step 3a: 1-Sensor Line Following", color: rgb("#a855f7"))[
    #badge("BANG-BANG / EDGE TRACKING", color: rgb("#a855f7"))
    #v(1.5pt)
    - Tracks the #highlight("boundary edge", color: rgb("#ffffff")) between light and dark surfaces using 1 photo/color sensor.

    #v(2pt)
    // Real Visual Flowchart 3
    #block(
      fill: rgb("#06060a"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4.5pt,
      inset: 4pt,
      [
        #align(center)[
          #flow-decision("Reflected Light < Threshold?")
        ]
        #v(2pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 4pt,
          align: center,
          [
            #text(fill: rgb("#a855f7"), weight: "black", size: 6.0pt)[YES (On Dark) $arrow.b$] \
            #flow-node("Turn Left", sub: "Motor C ON / B OFF", color: rgb("#a855f7"))
          ],
          [
            #text(fill: rgb("#38bdf8"), weight: "black", size: 6.0pt)[NO (On Light) $arrow.b$] \
            #flow-node("Turn Right", sub: "Motor B ON / C OFF", color: rgb("#38bdf8"))
          ]
        )
      ]
    )
    #v(2pt)
    - $text("Ref") < text("Th")$ (On black) $arrow.r$ Steer outside ($"Turn Left"$).
    - $text("Ref") >= text("Th")$ (On white) $arrow.r$ Steer inside ($"Turn Right"$).
    - #highlight("Control Characteristic:", color: rgb("#ffffff")) 2-state discrete bang-bang controller; causes high-frequency zigzag oscillation along line edge.
  ]

  // --- 6. BEHAVIORAL PATTERNS SUMMARY ---
  #card(title: "6. Reactive Control Summary", color: rgb("#3b82f6"))[
    #rounded-table(
      columns: (0.9fr, 1fr, 1.2fr),
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#1e3a8a") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#080811") },
      align: top + left,
      [#text(fill: rgb("#93c5fd"), weight: "bold", size: 6.6pt)[Stage]],
      [#text(fill: rgb("#93c5fd"), weight: "bold", size: 6.6pt)[Sensor Used]],
      [#text(fill: rgb("#93c5fd"), weight: "bold", size: 6.6pt)[Behavior Pattern]],
      [*Step 1*], [Touch Switch], [Emergency reflex backoff],
      [*Step 2*], [Touch + IR/Dist], [Layered priority avoidance],
      [*Step 3a*], [Color/Light], [1-Sensor edge tracking]
    )
  ]

  #tip-box(title: "EXAM HIGHLIGHTS: LECTURE 04")[
    *EV3 vs NXT/RCX:* EV3 introduced Linux OS, ARM9 @ 300MHz, daisy-chaining, USB host, & 4th motor port. \
    *1-Sensor Line Following:* Always tracks an *edge* (boundary transition), never the centerline itself. \
    *Priority Arbitration:* Safety/impact reflexes always take precedence over non-contact navigation.
  ]
]
