#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 0.75cm, top: 0.60cm, bottom: 0.50cm),
  fill: rgb("#000000"), // Pure Black OLED
  header: none,
  footer: context {
    let page_num = counter(page).get().first()
    place(
      bottom + left,
      text(size: 6.8pt, fill: rgb("#3f3f46"), weight: "bold")[
        ROBOTICS EXAM PREP • RAPID CHEATSHEET
      ]
    )
    align(right + horizon)[
      #text(size: 7.0pt, fill: rgb("#52525b"), weight: "bold")[
        PAGE #page_num
      ]
    ]
  }
)

#set text(
  font: ("Ubuntu", "DejaVu Sans", "Liberation Sans", "Noto Sans"),
  size: 7.4pt,
  fill: rgb("#d4d4d8"), // Zinc 300 crisp text
  spacing: 106%,
)

#set par(justify: false, leading: 0.50em)
#set list(spacing: 3.5pt, marker: text(fill: rgb("#71717a"), size: 5.0pt)[•])
#set enum(spacing: 3.5pt)

// ==========================================
// REUSABLE DARK THEME COMPONENTS
// ==========================================

#let card(title: "", color: rgb("#6366f1"), body) = {
  block(
    width: 100%,
    stroke: 0.75pt + color.transparentize(50%),
    radius: 5.0pt,
    fill: rgb("#09090d"),
    clip: true,
    inset: 0pt,
    [
      // Card Header
      #block(
        width: 100%,
        fill: color.darken(80%),
        stroke: (bottom: 0.6pt + color.transparentize(60%)),
        inset: (x: 7.0pt, y: 3.8pt),
        [
          #grid(
            columns: (auto, 1fr),
            gutter: 5pt,
            align: (left + horizon, left + horizon),
            box(
              width: 4.2pt,
              height: 4.2pt,
              radius: 100pt,
              fill: color.lighten(30%),
            ),
            text(fill: color.lighten(45%), weight: "bold", size: 8.0pt)[#title]
          )
        ]
      )
      // Card Body
      #block(
        inset: (x: 7.5pt, top: 5.0pt, bottom: 5.0pt),
        body
      )
    ]
  )
  v(3.0pt)
}

#let badge(text-content, color: rgb("#6366f1")) = {
  box(
    fill: color.darken(75%),
    stroke: 0.6pt + color.transparentize(30%),
    radius: 3pt,
    inset: (x: 3.5pt, y: 1.2pt),
    outset: 0pt,
    text(fill: color.lighten(55%), weight: "bold", size: 6.4pt)[#text-content]
  )
}

#let num-bullet(n, color: rgb("#f59e0b")) = {
  box(
    fill: color.darken(70%),
    stroke: 0.6pt + color.transparentize(30%),
    radius: 100pt,
    inset: (x: 3.5pt, y: 1.0pt),
    text(fill: color.lighten(50%), weight: "black", size: 6.3pt)[#n]
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
  inset: 3.2pt,
  radius: 4.0pt,
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

#let flow-box(body, color: rgb("#6366f1")) = {
  box(
    fill: color.darken(80%),
    stroke: 0.6pt + color.transparentize(40%),
    radius: 3.5pt,
    inset: (x: 4.5pt, y: 2.2pt),
    text(size: 6.6pt, fill: color.lighten(50%), weight: "bold")[#body]
  )
}

#let tip-box(title: "HIGH-YIELD EXAM DISTINCTION", body) = {
  block(
    width: 100%,
    fill: rgb("#140f02"),
    stroke: 0.85pt + rgb("#f59e0b").transparentize(20%),
    radius: 5.0pt,
    inset: (x: 7.0pt, y: 4.5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        box(
          width: 4.2pt,
          height: 4.2pt,
          radius: 100pt,
          fill: rgb("#f59e0b"),
        ),
        [
          #text(size: 6.7pt, weight: "black", fill: rgb("#fbbf24"))[#title]\
          #v(1.2pt)
          #text(size: 7.0pt, fill: rgb("#fef08a"))[#body]
        ]
      )
    ]
  )
}

#let header-banner(lec-num, lec-title, tag) = {
  block(
    width: 100%,
    stroke: 0.7pt + rgb("#27272a"),
    radius: 5.0pt,
    fill: rgb("#09090e"),
    inset: (x: 9pt, y: 4.0pt),
    [
      #grid(
        columns: (auto, 1fr, auto),
        gutter: 8pt,
        align: (left + horizon, left + horizon, right + horizon),
        [
          #text(size: 11.0pt, weight: "black", fill: rgb("#818cf8"))[ROBOTICS]
          #h(3pt)
          #text(size: 11.0pt, weight: "black", fill: rgb("#ffffff"))[STUDY GUIDE]
        ],
        [
          #text(size: 8.0pt, weight: "bold", fill: rgb("#3f3f46"))[|]
          #h(5pt)
          #text(size: 8.8pt, weight: "bold", fill: rgb("#e4e4e7"))[Lecture #lec-num: #lec-title]
        ],
        [
          #badge(tag, color: rgb("#10b981"))
          #h(3pt)
          #badge("LEC " + lec-num, color: rgb("#818cf8"))
        ]
      )
    ]
  )
  v(2.5pt)
}

// =========================================================
// PAGE 1: LECTURE 01 — FOUNDATIONS & ARCHITECTURE
// =========================================================

#header-banner("01", "Foundations & Architecture", "CORE CONCEPTS")

#columns(3, gutter: 8.0pt)[

  // --- 1. WHAT IS A ROBOT? ---
  #card(title: "1. What is a Robot?", color: rgb("#6366f1"))[
    #highlight("Core Definition:", color: rgb("#a5b4fc")) An electromechanical system characterized by three essential traits:
    #v(2pt)
    - #badge("Reprogrammable", color: rgb("#6366f1")) Flexible software control
    - #badge("Multifunctional", color: rgb("#06b6d4")) Versatile multi-task capability
    - #badge("Sensible", color: rgb("#10b981")) Real-time environment awareness

    #v(4pt)
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
      inset: 3.8pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#082f49") } else { rgb("#070b12") },
      align: top + left,
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 7.2pt)[Fixed Automation]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 7.2pt)[Flexible Robots]],
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
      gutter: 5pt,
      row-gutter: 5pt,
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
      gutter: 6pt,
      row-gutter: 6pt,
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

    #v(4pt)
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
    #badge("ON-LINE METHODS", color: rgb("#3b82f6")) #text(size: 6.8pt, fill: rgb("#93c5fd"))[(At the Robot)]
    #v(2pt)
    - #highlight("Teach Pendant:", color: rgb("#ffffff")) Handheld button box. Jog arm to waypoints & save; controller calculates PTP paths.
    - #highlight("Lead-Through:", color: rgb("#ffffff")) Manually guide arm by hand. Records continuous stream (60--80 pts/sec; high memory).

    #v(4pt)
    #badge("OFF-LINE METHODS", color: rgb("#8b5cf6")) #text(size: 6.8pt, fill: rgb("#c4b5fd"))[(Remote / Code)]
    #v(2pt)
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

#columns(3, gutter: 8.0pt)[

  // --- 1. SENSING & TRANSDUCTION ---
  #card(title: "1. Sensing & Transduction", color: rgb("#6366f1"))[
    - #highlight("Sensing:", color: rgb("#ffffff")) Collecting information about the world.
    - #highlight("Sensor:", color: rgb("#ffffff")) Device mapping physical phenomena to quantitative signals.
    - #highlight("Transduction Principle:", color: rgb("#a5b4fc")) Converting one energy form into another.

    #v(2pt)
    #rounded-table(
      columns: (1.1fr, 1.3fr),
      inset: 3.0pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#1e1b4b") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#080811") },
      align: top + left,
      [#text(fill: rgb("#c7d2fe"), weight: "bold", size: 6.8pt)[Sensor Type]],
      [#text(fill: rgb("#c7d2fe"), weight: "bold", size: 6.8pt)[Transduction Mechanism]],
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

    #v(3pt)
    #highlight("Energy Interaction:", color: rgb("#38bdf8"))
    #v(1.5pt)
    - #highlight("Active:", color: rgb("#ffffff")) Emits energy & reads reflection (Sonar, Radar, Modulated IR, LiDAR).
    - #highlight("Passive:", color: rgb("#ffffff")) Receives ambient energy only (Cameras, Pyroelectric, LDR).

    #v(3pt)
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

    #v(3pt)
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
      inset: 3.0pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#064e3b") } else { rgb("#06120e") },
      align: top + left,
      [#text(fill: rgb("#6ee7b7"), weight: "bold", size: 7.0pt)[Capacitive (All Materials)]],
      [#text(fill: rgb("#6ee7b7"), weight: "bold", size: 7.0pt)[Inductive (Metals Only)]],
      [
        - Measures change in *dielectric*\
        - Detects #highlight("metals & non-metals", color: rgb("#ffffff")) (liquids, plastics, powders)\
        - Senses through glass/plastic\
        - Sensitive to dust & humidity\
        #v(1pt)
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
        #v(1pt)
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
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#3b0764") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#080811") },
      align: top + left,
      [#text(fill: rgb("#d8b4fe"), weight: "bold", size: 6.6pt)[Type]],
      [#text(fill: rgb("#d8b4fe"), weight: "bold", size: 6.6pt)[Principle & Trade-offs]],
      [#text(fill: rgb("#d8b4fe"), weight: "bold", size: 6.6pt)[Applications]],
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
        - Angle gives range\
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

#columns(3, gutter: 8.0pt)[

  // --- 1. AGENCY & MARR'S 3-LEVEL FRAMEWORK ---
  #card(title: "1. Agency & Marr's 3-Level Framework", color: rgb("#6366f1"))[
    #highlight("Agency:", color: rgb("#ffffff")) Capacity of an entity to act intentionally, make choices & exert control over outcomes.
    #v(2pt)

    // Flow Chart for Marr's Levels
    #block(
      width: 100%,
      fill: rgb("#060810"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4pt,
      inset: (x: 4pt, y: 3.5pt),
      [
        #grid(
          columns: (1fr, auto, 1fr, auto, 1.15fr),
          gutter: 3pt,
          align: center + horizon,
          flow-box("L1: Comp. (Theory)\nWhat & Why?", color: rgb("#38bdf8")),
          text(size: 7pt, fill: rgb("#71717a"))[$arrow.r$],
          flow-box("L2: Algo. (Rep.)\nHow processed?", color: rgb("#34d399")),
          text(size: 7pt, fill: rgb("#71717a"))[$arrow.r$],
          flow-box("L3: Impl. (Physical)\nHardware/Biology", color: rgb("#f59e0b"))
        )
      ]
    )
    #v(2.5pt)
    - #highlight("L1 Computational:", color: rgb("#ffffff")) Task goal, mathematical theory & operational constraints.
    - #highlight("L2 Algorithmic:", color: rgb("#ffffff")) Input/output representations, transformations & planning.
    - #highlight("L3 Implementational:", color: rgb("#ffffff")) Physical substrate (synapses/muscles vs. MCUs/circuits/motors).

    #v(2pt)
    #badge("KEY EXAM FACT", color: rgb("#f59e0b")) #text(size: 6.6pt, fill: rgb("#fef08a"))[L1 & L2 are universal; biology vs. robot differences exist #underline[*only at Level 3*].]
  ]

  // --- 2. MOSQUITO VS SEARCH & RESCUE ---
  #card(title: "2. Case Study: Mosquito vs. Robot", color: rgb("#06b6d4"))[
    #rounded-table(
      columns: (0.75fr, 1.1fr, 1.15fr),
      inset: 2.5pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#082f49") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#070b12") },
      align: top + left,
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.6pt)[Marr Level]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.6pt)[Mosquito (Bio)]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.6pt)[Search & Rescue (Robot)]],
      [*L1: Comp.*], [Locate warm host for blood meal], [Locate human survivors in disaster],
      [*L2: Algo.*], [Gradient ascent on heat & $text("CO")_2$], [Steer based on thermal & $text("CO")_2$ inputs],
      [*L3: Impl.*], [Olfactory pits, flight muscles], [Thermopile, $text("CO")_2$ sensor, MCUs, wheels]
    )
  ]

  // --- 3. BIO-INSPIRATION TO ROBOTIC TASKS ---
  #card(title: "3. Biological Inspiration Mappings", color: rgb("#059669"))[
    #rounded-table(
      columns: (0.85fr, 1fr, 1.15fr),
      inset: 2.5pt,
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

  // --- 4. ACTION-PERCEPTION & BEHAVIOR MATH ---
  #card(title: "4. Action-Perception Cycle & Math", color: rgb("#10b981"))[
    // Action Perception Loop Chart
    #block(
      width: 100%,
      fill: rgb("#060810"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4pt,
      inset: (x: 4pt, y: 3.5pt),
      [
        #grid(
          columns: (1fr, auto, 1fr, auto, 1fr),
          gutter: 3pt,
          align: center + horizon,
          flow-box("Environment\n(Affordances)", color: rgb("#64748b")),
          text(size: 7pt, fill: rgb("#38bdf8"))[$arrow.r$],
          flow-box("Perception\nS[Sensors]", color: rgb("#0284c7")),
          text(size: 7pt, fill: rgb("#10b981"))[$arrow.r$],
          flow-box("Action\nR[Percept]", color: rgb("#10b981"))
        )
      ]
    )
    #v(2.5pt)
    - #highlight("Behavior:", color: rgb("#ffffff")) Mathematical mapping of sensory input to motor actions to achieve a goal.
    - #highlight("Gibson's Ecological Theory:", color: rgb("#34d399")) Perception exists solely to support action. *"The world is its own best representation."*
    - #highlight("Affordances:", color: rgb("#ffffff")) Action possibilities directly perceivable in environment (e.g. *climbability*, *sitability*).

    #v(2.5pt)
    #highlight("Mathematical Formulations:", color: rgb("#34d399"))
    - #highlight("Stimulus-Response (S-R):", color: rgb("#ffffff")) $ {B : S arrow.r R} $
    - #highlight("Schema Function:", color: rgb("#ffffff")) $ B[S] = R $
      $ S["Sensor Data"] arrow.r "Percept" quad | quad R["Percept"] arrow.r "Action Vector" $
  ]

  // --- 5. BEHAVIOR TAXONOMIES ---
  #card(title: "5. Taxonomies of Behaviors", color: rgb("#f59e0b"))[
    #badge("1. REFLEXIVE (S-R)", color: rgb("#ef4444"))
    - Hardwired circuits for fastest possible execution.
    - #highlight("Fixed-Action Pattern (FAP):", color: rgb("#ffffff")) Response continues for *longer duration* than stimulus (web spinning, courtship dance, nut burying, imprinting).
    - #highlight("Taxis:", color: rgb("#ffffff")) Orienting reflex relative to stimulus (e.g. *phototaxis* towards light). _Can co-occur with FAP._

    #v(2.5pt)
    #badge("2. REACTIVE (LEARNED / MUSCLE MEMORY)", color: rgb("#f59e0b"))
    - Consolidated through repetition; automatic execution without conscious thought (e.g. riding bike). _Overthinking degrades performance._

    #v(2.5pt)
    #badge("3. CONSCIOUS (DELIBERATIVE)", color: rgb("#3b82f6"))
    - Goal-directed, high cognition, planning, reasoning, puzzle solving.
  ]

  #colbreak()

  // --- 6. SCHEMA THEORY & OOP ARCHITECTURE ---
  #card(title: "6. Schema Theory in Robotics (OOP)", color: rgb("#a855f7"))[
    // Schema OOP Diagram
    #block(
      width: 100%,
      fill: rgb("#060810"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4pt,
      inset: (x: 4pt, y: 3.5pt),
      [
        #grid(
          columns: (1fr, auto, 1fr),
          gutter: 3pt,
          align: center + horizon,
          flow-box("Perceptual Schema (P)\nS[Sensors] -> Percept", color: rgb("#0284c7")),
          text(size: 7pt, fill: rgb("#c084fc"))[$arrow.r$],
          flow-box("Motor Schema (M)\nR[Percept] -> Action", color: rgb("#059669"))
        )
      ]
    )
    #v(2.5pt)
    - #highlight("Schema:", color: rgb("#ffffff")) Maps biological behavior to Object-Oriented Programming (OOP) classes in the #highlight("Reactive Layer", color: rgb("#c084fc")).
    - #highlight("Anatomy of a Schema Class:", color: rgb("#ffffff"))
      + *Schema Data* $arrow.r$ Member Variables (models, local states).
      + *Procedural Knowledge* $arrow.r$ Member Methods (algorithms).
    - #highlight("Schema Instantiation (SI):", color: rgb("#ffffff")) Generic template parameterized with runtime values (e.g. seat height $arrow.r$ active SI object).
  ]

  // --- 7. VECTOR FIELDS & FROG TAXIS ---
  #card(title: "7. Vector Fields & Vector Summation", color: rgb("#3b82f6"))[
    // Vector Summation Flow
    #block(
      width: 100%,
      fill: rgb("#060810"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4pt,
      inset: (x: 4pt, y: 3.0pt),
      [
        #grid(
          columns: (1fr, auto, 1fr, auto, 1.15fr),
          gutter: 2.5pt,
          align: center + horizon,
          flow-box("Left Eye Vector\n(v_L)", color: rgb("#38bdf8")),
          text(size: 7pt, fill: rgb("#e2e8f0"))[$+$],
          flow-box("Right Eye Vector\n(v_R)", color: rgb("#38bdf8")),
          text(size: 7pt, fill: rgb("#e2e8f0"))[$arrow.r$],
          flow-box("Resultant (Sigma)\nV_res = v_L + v_R", color: rgb("#f59e0b"))
        )
      ]
    )
    #v(2.5pt)
    - *Frog Schemas:* Feed (small moving blob $arrow.r$ snap) vs. Flee (large moving blob $arrow.r$ jump away).
    - *Distance-Intensity Scaling:* Weaker stimulus (far away prey) generates a *harder snap vector*.
  ]

  // --- 8. INNATE RELEASING MECHANISMS (IRM) ---
  #card(title: "8. Innate Releasing Mechanisms (IRM)", color: rgb("#ec4899"))[
    // IRM Gating Flow
    #block(
      width: 100%,
      fill: rgb("#060810"),
      stroke: 0.5pt + rgb("#27272a"),
      radius: 4pt,
      inset: (x: 4pt, y: 3.0pt),
      [
        #grid(
          columns: (1.2fr, auto, 1.3fr, auto, 1.1fr),
          gutter: 2.5pt,
          align: center + horizon,
          flow-box("Sensory Input +\nMotivation State", color: rgb("#64748b")),
          text(size: 7pt, fill: rgb("#ec4899"))[$arrow.r$],
          flow-box("Releaser Latch\n(Boolean / Gated)", color: rgb("#ec4899")),
          text(size: 7pt, fill: rgb("#10b981"))[$arrow.r$],
          flow-box("Behavior Output\n(Motor Vector)", color: rgb("#10b981"))
        )
      ]
    )
    #v(2.5pt)
    - #highlight("Boolean Latches:", color: rgb("#ffffff")) `PRESENT` (true) enables behavior; `NOT_PRESENT` (false) gates completely (*no default output*).
    - #highlight("Compound Releasers:", color: rgb("#ffffff")) External Stimuli (food sensed) $+$ Internal Motivation (hunger / battery level).
    - #highlight("Implicit Chaining:", color: rgb("#ffffff")) Releaser states trigger sequential flows without a central planner.
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
    - #highlight("Objective:", color: rgb("#ffffff")) Move continuously; instantly back up and pivot when a physical impact occurs.
    
    #v(2pt)
    #highlight("Flowchart & Execution Logic:", color: rgb("#fbbf24"))
    ```
    [ START ] ──► [ Is Collision? (Touch == 1) ]
                        │                  │
                       YES                 NO
                        ▼                  ▼
               [ Reverse & Turn ]   [ Move Forward ]
    ```
    - #highlight("Collision == True:", color: rgb("#ffffff")) Motors B+C reverse at negative power ($-30$, 2 rotations) $arrow.r$ steer pivot ($-45 slash 30$, 2 rotations).
    - #highlight("Collision == False:", color: rgb("#ffffff")) Motors B+C cruise forward ($"Power" = 75$).
    - Direct hardware-to-motor S-R loop without state memory.
  ]

  // --- 4. STEP 2: LAYERED OBSTACLE AVOIDANCE ---
  #card(title: "4. Step 2: Collision + Obstacle Avoidance", color: rgb("#10b981"))[
    #badge("HIERARCHICAL PRIORITY ARBITRATION", color: rgb("#10b981"))
    - Combines contact (Touch) and non-contact (Proximity/Force) into a 2-tier reactive hierarchy:
    
    #v(2pt)
    #highlight("Two-Stage Decision Tree:", color: rgb("#34d399"))
    ```
    [ START ] ──► [ Collision? ] ──YES──► [ Reverse & Turn ]
                        │ (NO)
                        ▼
                [ Feel Force / Proximity < Dist? ]
                        │                  │
                       YES                 NO
                        ▼                  ▼
                     [ Turn ]       [ Move Forward ]
    ```
    - #highlight("Priority 1 (Touch):", color: rgb("#ffffff")) Emergency physical recovery (Reverse + Turn). Overrides all.
    - #highlight("Priority 2 (Proximity):", color: rgb("#ffffff")) Smooth steering turn away before contact occurs.
    - #highlight("Priority 3 (Default):", color: rgb("#ffffff")) Drive straight ahead.
  ]

  #colbreak()

  // --- 5. STEP 3A: 1-SENSOR LINE FOLLOWING ---
  #card(title: "5. Step 3a: 1-Sensor Line Following", color: rgb("#a855f7"))[
    #badge("BANG-BANG / EDGE TRACKING", color: rgb("#a855f7"))
    - Tracks the #highlight("boundary edge", color: rgb("#ffffff")) between light surface and dark line using 1 photo/color sensor.

    #v(2pt)
    #highlight("Threshold Decision Rule:", color: rgb("#c084fc"))
    ```
    [ START ] ──► [ Reflected Light < Threshold? ]
                        │                    │
                       YES                   NO
                     (On Dark)           (On Light)
                        ▼                    ▼
                   [ Turn Left ]       [ Turn Right ]
                   (Motor C ON)        (Motor B ON)
    ```
    - $text("Ref") < text("Th")$ (Over black line) $arrow.r$ Steer outside ($"Turn Left"$).
    - $text("Ref") >= text("Th")$ (Over white floor) $arrow.r$ Steer inside ($"Turn Right"$).
    - #highlight("Control Characteristic:", color: rgb("#ffffff")) 2-state discrete bang-bang controller; causes high-frequency zigzag oscillation along line edge.
  ]

  // --- 6. BEHAVIORAL PATTERNS SUMMARY ---
  #card(title: "6. Reactive Control Summary", color: rgb("#3b82f6"))[
    #rounded-table(
      columns: (1fr, 1fr, 1.1fr),
      inset: 2.8pt,
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
