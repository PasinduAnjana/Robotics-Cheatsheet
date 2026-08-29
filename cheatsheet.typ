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
// PAGE 3: LECTURE 03 — BEHAVIORS & COMPUTATIONAL THEORY
// =========================================================

#header-banner("03", "Agency, Behaviors & Schema Theory", "AGENCY & BEHAVIORS")

#columns(3, gutter: 8.5pt)[

  // --- 1. AGENCY & MARR'S 3-LEVEL COMPUTATIONAL THEORY ---
  #card(title: "1. Agency & Marr's 3-Level Theory", color: rgb("#6366f1"))[
    - #highlight("Agency:", color: rgb("#ffffff")) Capacity of an entity (human or robot) to act intentionally, make choices, & exert control over actions and outcomes.
    - #highlight("David Marr's Framework:", color: rgb("#a5b4fc")) Analyzes information systems across 3 empirical levels:

    #v(2pt)
    #rounded-table(
      columns: (0.7fr, 0.9fr, 1.4fr),
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#1e1b4b") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#080811") },
      align: top + left,
      [#text(fill: rgb("#c7d2fe"), weight: "bold", size: 6.5pt)[Level]],
      [#text(fill: rgb("#c7d2fe"), weight: "bold", size: 6.5pt)[Question / Focus]],
      [#text(fill: rgb("#c7d2fe"), weight: "bold", size: 6.5pt)[Search & Rescue Robot Example]],
      [*L1: Comp.*], [What goal / problem is solved?], [Locate trapped survivors in low-visibility],
      [*L2: Algo.*], [What processes / IO represent it?], [Steer toward heat & $text("CO")_2$ gradients],
      [*L3: Impl.*], [How physically realized in hardware?], [Angle vectors to heat centroids; wheel motors]
    )

    #v(2.5pt)
    #badge("KEY EXAM CONCEPT", color: rgb("#f59e0b")) #text(size: 6.7pt, fill: rgb("#fef08a"))[L1 & L2 are abstract & identical across biology/robots. Distinction appears #underline[*only at Level 3*].]
  ]

  // --- 2. BIO-INSPIRED ROBOTIC MAPPINGS ---
  #card(title: "2. Bio-Inspired Robotic Mappings", color: rgb("#06b6d4"))[
    #rounded-table(
      columns: (0.9fr, 1.1fr, 1fr),
      inset: 2.5pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#082f49") } else if calc.even(row) { rgb("#0d0d18") } else { rgb("#070b12") },
      align: top + left,
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.5pt)[Biological Model]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.5pt)[Robotic Mapping]],
      [#text(fill: rgb("#38bdf8"), weight: "bold", size: 6.5pt)[Mechanism]],
      [*Bat Echolocation*], [Obstacle Avoidance], [Echo delay detection (ultrasonic)],
      [*Ant Foraging*], [Swarm Pathfinding], [Ant Colony Optim. (ACO), digital pheromones],
      [*Bird Flocking*], [Coordinated Drone Swarm], [Reynolds Boids: alignment, cohesion, separation],
      [*Frog Tongue*], [Fast Grasping Arm], [High-speed camera + snatch reflex],
      [*Cuttlefish*], [Adaptive Camouflage], [Pattern mapping onto E-skin]
    )
  ]

  #colbreak()

  // --- 3. CLASSIFICATIONS OF BEHAVIOR ---
  #card(title: "3. Classifications of Behavior", color: rgb("#f59e0b"))[
    - #highlight("Behavior Definition:", color: rgb("#ffffff")) Direct mapping of sensory inputs to motor actions to accomplish a task.

    #v(2.5pt)
    #badge("1. REFLEXIVE (STIMULUS-RESPONSE / S-R)", color: rgb("#ef4444"))
    - Hardwired neural/electronic circuits for fastest execution:
      - #highlight("Reflexes:", color: rgb("#ffffff")) Response lasts *only as long as stimulus* & is proportional to intensity (e.g. knee-jerk, pupillary light reflex).
      - #highlight("Taxes (Taxis):", color: rgb("#ffffff")) Directional orientation / movement relative to stimulus:
        - _Tropotaxis:_ Sea turtles navigating toward moonlit ocean.
        - _Negative Phototaxis:_ Earthworms crawling away from light.
        - _Positive Rheotaxis:_ Salmon swimming upstream against flow.
      - #highlight("Fixed-Action Patterns (FAP):", color: rgb("#ffffff")) Response *persists longer* than triggering stimulus (e.g. spider web weaving, squirrels caching nuts, duckling imprinting).

    #v(3pt)
    #badge("2. REACTIVE BEHAVIORS", color: rgb("#f59e0b"))
    - Learned skills executed automatically without conscious processing (e.g. riding a bicycle).

    #v(3pt)
    #badge("3. CONSCIOUS BEHAVIORS", color: rgb("#3b82f6"))
    - Deliberate, planned actions coordinating multiple sub-behaviors.
  ]

  #colbreak()

  // --- 4. SCHEMA THEORY & OOP ---
  #card(title: "4. Schema Theory & OOP Robotics", color: rgb("#a855f7"))[
    - #highlight("Schema:", color: rgb("#ffffff")) Foundational OOP template used for the *Reactive Layer* of autonomous robots.
    - #highlight("Components of a Behavior Schema:", color: rgb("#c084fc"))
      - #badge("Perceptual Schema", color: rgb("#0284c7")) Sensory feature extraction, threshold filtering & stimulus delays.
      - #badge("Motor Schema", color: rgb("#059669")) Computational procedure to produce physical action/movement vector.
    - #highlight("Schema Instantiation (SI):", color: rgb("#ffffff")) Creating a concrete runtime instance from a generic parameterized class template (e.g. applying specific handlebar height & seat position to a bike-riding schema).
  ]

  // --- 5. VECTOR-BASED ACTION & S-R NOTATION ---
  #card(title: "5. Vector Action & S-R Notation", color: rgb("#3b82f6"))[
    #highlight("Mathematical Formulations:", color: rgb("#60a5fa"))
    $ {B : S arrow.r R} quad "or" quad B[S] = R $
    - $S$: Perceptual function converting raw sensor feeds to *percept*.
    - $R$: Motor function converting percept into physical *action*.
    - $B$: Overarching behavioral system.

    #v(2.5pt)
    #highlight("Vector Field Combination:", color: rgb("#60a5fa"))
    - Directional stimuli (e.g. left & right eyes) are converted to vectors and combined via #highlight("Vector Summation", color: rgb("#ffffff")) ($Sigma$) to determine the resultant motor command:
      $ V_("resultant") = v_("left") + v_("right") $
  ]

  #tip-box(title: "EXAM HIGHLIGHTS: LECTURE 03")[
    *Reflex vs. FAP Duration:* Reflex stops as soon as stimulus stops; FAP continues for longer duration. \
    *Taxis Examples:* Positive Rheotaxis (salmon upstream), Tropotaxis (sea turtles to moonlight), Negative Phototaxis (earthworms). \
    *Marr's Level 3:* L1 & L2 are identical in biology & robotics; differences emerge *only at Level 3*.
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
