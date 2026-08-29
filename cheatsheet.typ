#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 0.80cm, top: 0.65cm, bottom: 0.55cm),
  fill: rgb("#ffffff"), // Pure Flat White Light Mode
  header: none,
  footer: context {
    let page_num = counter(page).get().first()
    place(
      bottom + left,
      text(size: 7.0pt, fill: rgb("#94a3b8"), weight: "bold")[
        ROBOTICS EXAM PREP • RAPID CHEATSHEET
      ]
    )
    align(right + horizon)[
      #text(size: 7.2pt, fill: rgb("#64748b"), weight: "bold")[
        PAGE #page_num
      ]
    ]
  }
)

#set text(
  font: ("Ubuntu", "DejaVu Sans", "Liberation Sans", "Noto Sans"),
  size: 7.6pt,
  fill: rgb("#1e293b"), // Slate 800 crisp text
  spacing: 108%,
)

#set par(justify: false, leading: 0.54em)
#set list(spacing: 3.8pt, marker: text(fill: rgb("#94a3b8"), size: 5.5pt)[•])
#set enum(spacing: 3.8pt)

// ==========================================
// REUSABLE FLAT LIGHT THEME COMPONENTS (NO OUTLINES)
// ==========================================

#let card(title: "", color: rgb("#4f46e5"), body) = {
  block(
    width: 100%,
    stroke: none,
    radius: 5.5pt,
    fill: color.lighten(95%),
    clip: true,
    inset: 0pt,
    [
      // Card Header (Flat)
      #block(
        width: 100%,
        fill: color.lighten(88%),
        stroke: none,
        inset: (x: 7.5pt, y: 4.0pt),
        [
          #grid(
            columns: (auto, 1fr),
            gutter: 5pt,
            align: (left + horizon, left + horizon),
            box(
              width: 5pt,
              height: 5pt,
              radius: 100pt,
              fill: color,
            ),
            text(fill: color.darken(35%), weight: "bold", size: 8.3pt)[#title]
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

#let badge(text-content, color: rgb("#4f46e5")) = {
  box(
    fill: color.lighten(88%),
    stroke: none,
    radius: 3.5pt,
    inset: (x: 4.0pt, y: 1.4pt),
    outset: 0pt,
    text(fill: color.darken(40%), weight: "bold", size: 6.6pt)[#text-content]
  )
}

#let num-bullet(n, color: rgb("#d97706")) = {
  box(
    fill: color.lighten(85%),
    stroke: none,
    radius: 100pt,
    inset: (x: 4.0pt, y: 1.4pt),
    text(fill: color.darken(35%), weight: "black", size: 6.5pt)[#n]
  )
}

#let highlight(txt, color: rgb("#1d4ed8")) = {
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
    fill: rgb("#fef3c7"), // Soft Amber Flat
    stroke: none,
    radius: 5.5pt,
    inset: (x: 7.5pt, y: 5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        box(
          width: 5pt,
          height: 5pt,
          radius: 100pt,
          fill: rgb("#d97706"),
        ),
        [
          #text(size: 6.9pt, weight: "black", fill: rgb("#92400e"))[#title]\
          #v(1.5pt)
          #text(size: 7.2pt, fill: rgb("#78350f"))[#body]
        ]
      )
    ]
  )
}

#let header-banner(lec-num, lec-title, tag) = {
  block(
    width: 100%,
    stroke: none,
    radius: 5.5pt,
    fill: rgb("#f1f5f9"),
    inset: (x: 10pt, y: 4.5pt),
    [
      #grid(
        columns: (auto, 1fr, auto),
        gutter: 8pt,
        align: (left + horizon, left + horizon, right + horizon),
        [
          #text(size: 11.5pt, weight: "black", fill: rgb("#4338ca"))[ROBOTICS]
          #h(3pt)
          #text(size: 11.5pt, weight: "black", fill: rgb("#0f172a"))[STUDY GUIDE]
        ],
        [
          #text(size: 8.5pt, weight: "bold", fill: rgb("#cbd5e1"))[|]
          #h(5pt)
          #text(size: 9.2pt, weight: "bold", fill: rgb("#1e293b"))[Lecture #lec-num: #lec-title]
        ],
        [
          #badge(tag, color: rgb("#059669"))
          #h(3pt)
          #badge("LEC " + lec-num, color: rgb("#4f46e5"))
        ]
      )
    ]
  )
  v(3pt)
}

// Flat Flowchart Visual Helpers (No outlines)
#let flow-node(txt, sub: "", color: rgb("#0284c7"), w: 100%) = block(
  width: w,
  fill: color.lighten(90%),
  stroke: none,
  radius: 3.5pt,
  inset: (x: 4pt, y: 2.5pt),
  align(center)[
    #text(fill: color.darken(40%), weight: "bold", size: 6.6pt)[#txt]
    #if sub != "" [\ #text(fill: rgb("#475569"), size: 5.5pt)[#sub]]
  ]
)

#let flow-decision(txt, color: rgb("#d97706"), w: 100%) = block(
  width: w,
  fill: rgb("#fef3c7"),
  stroke: none,
  radius: 3.5pt,
  inset: (x: 4pt, y: 2.8pt),
  align(center)[
    #text(fill: rgb("#92400e"), weight: "bold", size: 6.6pt)[#txt]
  ]
)

#let flow-start(txt: "START") = box(
  fill: rgb("#e2e8f0"),
  stroke: none,
  radius: 100pt,
  inset: (x: 5pt, y: 1.2pt),
  text(fill: rgb("#334155"), weight: "bold", size: 5.8pt)[#txt]
)

// =========================================================
// PAGE 1: LECTURE 01 — FOUNDATIONS & ARCHITECTURE
// =========================================================

#header-banner("01", "Foundations & Architecture", "CORE CONCEPTS")

#columns(3, gutter: 8.5pt)[

  // --- 1. WHAT IS A ROBOT? ---
  #card(title: "1. What is a Robot?", color: rgb("#4f46e5"))[
    #highlight("Core Definition:", color: rgb("#4338ca")) An electromechanical system characterized by three essential traits:
    #v(2.5pt)
    - #badge("Reprogrammable", color: rgb("#4f46e5")) Flexible software control
    - #badge("Multifunctional", color: rgb("#0284c7")) Versatile multi-task capability
    - #badge("Sensible", color: rgb("#059669")) Real-time environment awareness

    #v(4.5pt)
    #highlight("Key Terminology:", color: rgb("#4338ca"))
    #v(1.5pt)
    - #highlight("Robot:", color: rgb("#0f172a")) Physical mechanism performing human tasks autonomously or via teleoperation.
    - #highlight("Robotics:", color: rgb("#0f172a")) Science of mechanical design, kinematics, control & software.
    - #highlight("Telerobotics:", color: rgb("#0f172a")) Remote-controlled operation in extreme/hazardous environments.
  ]

  // --- 2. AUTOMATION VS ROBOTS ---
  #card(title: "2. Automation vs. Robots", color: rgb("#0284c7"))[
    #rounded-table(
      columns: (1fr, 1fr),
      inset: 4.0pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else { rgb("#f8fafc") },
      align: top + left,
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 7.4pt)[Fixed Automation]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 7.4pt)[Flexible Robots]],
      [
        - #highlight("Single dedicated task", color: rgb("#0f172a"))\
        #v(1pt)
        - Maximum speed & efficiency\
        #v(1pt)
        - Rigid; high retooling cost\
        #v(1pt)
        - _Ex:_ Bottling line, dishwasher
      ],
      [
        - #highlight("Diverse multiple tasks", color: rgb("#0f172a"))\
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
  #card(title: "3. Asimov's 3 Laws of Robotics", color: rgb("#d97706"))[
    #grid(
      columns: (auto, 1fr),
      gutter: 5.5pt,
      row-gutter: 5.5pt,
      align: (left + top, left + top),
      num-bullet("1", color: rgb("#dc2626")),
      [#highlight("Safety First:", color: rgb("#0f172a")) May not injure a human or, through inaction, allow harm.],
      num-bullet("2", color: rgb("#d97706")),
      [#highlight("Obedience:", color: rgb("#0f172a")) Must obey human orders, #highlight("except", color: rgb("#b45309")) when conflicting with Law 1.],
      num-bullet("3", color: rgb("#059669")),
      [#highlight("Self-Defense:", color: rgb("#0f172a")) Must protect own existence, unless conflicting with Laws 1 or 2.]
    )
  ]

  #colbreak()

  // --- 4. CORE HARDWARE COMPONENTS ---
  #card(title: "4. Core Hardware Architecture", color: rgb("#059669"))[
    #grid(
      columns: (auto, 1fr),
      gutter: 6.5pt,
      row-gutter: 6.5pt,
      align: (left + top, left + top),
      [#highlight("Sensors", color: rgb("#047857"))],
      [
        *Data Input:* Internal state (encoders, resolvers) & external world (cameras, LIDAR, tactile/touch).
      ],
      [#highlight("Controller", color: rgb("#047857"))],
      [
        *The 'Brain':* Executes trajectories, computes kinematics & closes real-time feedback loops.
      ],
      [#highlight("Actuators", color: rgb("#047857"))],
      [
        *The 'Muscles':* Convert electrical/fluid energy into physical movement (servos, steppers, pneumatics).
      ]
    )
  ]

  // --- 5. TYPES & APPLICATIONS ---
  #card(title: "5. Robot Types & Applications", color: rgb("#7c3aed"))[
    #highlight("Mechanical Architectures:", color: rgb("#6d28d9"))
    #v(1.5pt)
    - #highlight("Manipulators:", color: rgb("#0f172a")) Serial arms (Articulated, SCARA, Cartesian).
    - #highlight("Mobile & Wheeled:", color: rgb("#0f172a")) Differential drive, Omni, AGVs.
    - #highlight("Legged:", color: rgb("#0f172a")) Bipedal, quadrupeds, hexapods.
    - #highlight("Autonomous Vehicles:", color: rgb("#0f172a")) AUVs (Underwater), UAVs (Aerial drones).

    #v(4.5pt)
    #highlight("Primary Drivers (3 D's / U's):", color: rgb("#6d28d9"))
    #v(2.5pt)
    #grid(
      columns: 1fr,
      row-gutter: 3pt,
      [#badge("Dangerous", color: rgb("#dc2626")) #h(3pt) Nuclear cleanup, bomb disposal.],
      [#badge("Dull / Repetitive", color: rgb("#d97706")) #h(3pt) High-speed assembly, spot welding.],
      [#badge("Dirty / Unwanted", color: rgb("#0284c7")) #h(3pt) Sewer inspection, toilet cleaning.]
    )
  ]

  #colbreak()

  // --- 6. PROGRAMMING METHODS ---
  #card(title: "6. Robot Programming Methods", color: rgb("#2563eb"))[
    #badge("ON-LINE METHODS", color: rgb("#2563eb")) #text(size: 7.0pt, fill: rgb("#1d4ed8"))[(At the Robot)]
    #v(2.5pt)
    - #highlight("Teach Pendant:", color: rgb("#0f172a")) Handheld button box. Jog arm to waypoints & save; controller calculates PTP paths.
    - #highlight("Lead-Through:", color: rgb("#0f172a")) Manually guide arm by hand. Records continuous stream (60--80 pts/sec; high memory).

    #v(4.5pt)
    #badge("OFF-LINE METHODS", color: rgb("#7c3aed")) #text(size: 7.0pt, fill: rgb("#6d28d9"))[(Remote / Code)]
    #v(2.5pt)
    - #highlight("Programming Languages:", color: rgb("#0f172a")) Text code (AML, VAL, RobotStudio) without halting factory line.
    - #highlight("Task-Level:", color: rgb("#0f172a")) High-level goals ("pick item A") auto-compiled into trajectory commands.
  ]

  // --- 7. PERFORMANCE METRICS ---
  #card(title: "7. Performance Metrics", color: rgb("#db2777"))[
    - #highlight("Working Volume:", color: rgb("#0f172a")) 3D envelope reachable by end-effector.
    - #highlight("Speed & Accel:", color: rgb("#0f172a")) Motion rate; trade-off with precision & payload.
    - #highlight("Resolution:", color: rgb("#0f172a")) Smallest commandable incremental step.
    - #highlight("Accuracy:", color: rgb("#0f172a")) Closeness between *commanded target* and *actual reached position* ($|x_text("target") - x_text("actual")|$).
    - #highlight("Repeatability:", color: rgb("#0f172a")) Ability to return to the *exact same point* over repeated cycles ($sigma$).
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
  #card(title: "1. Sensing & Transduction", color: rgb("#4f46e5"))[
    - #highlight("Sensing:", color: rgb("#0f172a")) Collecting information about the world.
    - #highlight("Sensor:", color: rgb("#0f172a")) Device mapping physical/chemical phenomena to quantitative signals.
    - #highlight("Transduction Principle:", color: rgb("#4338ca")) Converting one energy form into another.

    #v(2.5pt)
    #rounded-table(
      columns: (1.1fr, 1.3fr),
      inset: 3.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0e7ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 7.0pt)[Sensor Type]],
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 7.0pt)[Transduction Mechanism]],
      [*Thermistor*], [Temp $arrow.r$ Resistance ($R$)],
      [*Photodiode*], [Light $arrow.r$ Current ($I$)],
      [*Pyroelectric*], [Thermal rad. $arrow.r$ Voltage ($V$)],
      [*Humidity*], [Moisture $arrow.r$ Capacitance ($C$)],
      [*LVDT*], [Position $arrow.r$ Inductance ($L$)],
      [*Microphone*], [Sound press. $arrow.r$ Elect. signal]
    )
  ]

  // --- 2. SENSOR CLASSIFICATIONS ---
  #card(title: "2. Sensor Classifications", color: rgb("#0284c7"))[
    #highlight("State Focus:", color: rgb("#0369a1"))
    #v(1.5pt)
    - #badge("Proprioceptive", color: rgb("#0284c7")) (Internal): Measures internal parameters (joint angle, wheel position, battery, tachometers/encoders/accelerometers).
    - #badge("Exteroceptive", color: rgb("#059669")) (External): Environment & objects (proximity, vision, range).

    #v(3.5pt)
    #highlight("Energy Interaction:", color: rgb("#0369a1"))
    #v(1.5pt)
    - #highlight("Active:", color: rgb("#0f172a")) Emits energy & reads reflection (Sonar, Radar, Modulated IR, LiDAR).
    - #highlight("Passive:", color: rgb("#0f172a")) Receives ambient energy only (Cameras, Pyroelectric, LDR).

    #v(3.5pt)
    #highlight("Contact & Modality:", color: rgb("#0369a1"))
    #v(1.5pt)
    - #highlight("Contact / Non-contact:", color: rgb("#0f172a")) Touch (bumpers) vs. remote (optical, ultrasonic).
    - #highlight("Visual / Non-visual:", color: rgb("#0f172a")) Vision cameras vs. non-optical sensors.
  ]

  #colbreak()

  // --- 3. CONTACT & RESISTIVE SENSORS ---
  #card(title: "3. Contact & Resistive Sensors", color: rgb("#d97706"))[
    #badge("A. FEELERS (TACTILE/CONTACT)", color: rgb("#d97706"))
    #v(1.5pt)
    - #highlight("Whiskers:", color: rgb("#0f172a")) Piano wire in metal hoop; deflection closes circuit; binary ($0"/"1$) output.
    - #highlight("Bumpers & Guards:", color: rgb("#0f172a")) Frame on microswitches; collision triggers switch; binary ($0"/"1$) output.

    #v(3.5pt)
    #badge("B. RESISTIVE (VARIABLE R)", color: rgb("#b45309"))
    #v(1.5pt)
    - #highlight("Bend Sensors:", color: rgb("#0f172a")) Flexible strips where $R$ increases as bent ($10 "k"Omega - 35 "k"Omega$). _Uses:_ Joint angles, wall-following, loads.
    - #highlight("Potentiometers:", color: rgb("#0f172a")) Linear/rotational variable resistors tracking sliding parts or rotating joint shafts.
    - #highlight("Photocells (CdS / LDR):", color: rgb("#0f172a")) Resistance shifts with light; highly non-linear, ideal for light tracking.
  ]

  // --- 4. CAPACITIVE VS. INDUCTIVE ---
  #card(title: "4. Capacitive vs. Inductive Sensors", color: rgb("#059669"))[
    #rounded-table(
      columns: (1fr, 1fr),
      inset: 3.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#d1fae5") } else { rgb("#f8fafc") },
      align: top + left,
      [#text(fill: rgb("#065f46"), weight: "bold", size: 7.2pt)[Capacitive (All Materials)]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 7.2pt)[Inductive (Metals Only)]],
      [
        - Measures change in *dielectric*\
        - Detects #highlight("metals & non-metals", color: rgb("#0f172a")) (liquids, plastics, powders)\
        - Senses through glass/plastic\
        - Sensitive to dust & humidity\
        #v(1.5pt)
        #badge("APPLICATIONS", color: rgb("#059669"))\
        - *Level Detection:* Liquid/grains\
        - *Proximity:* Assembly lines\
        - *Touch Sensing:* Touchscreens
      ],
      [
        - Emits AC magnetic field; senses *eddy currents*\
        - Detects #highlight("metals ONLY", color: rgb("#0f172a"))\
        - Max on *ferrous* (iron/steel)\
        - Immune to oil, dust & water\
        #v(1.5pt)
        #badge("APPLICATIONS", color: rgb("#047857"))\
        - *Position:* Metal part automation\
        - *Speed:* Rotating gears/shafts\
        - *Metal Detection:* Safety
      ]
    )
  ]

  #colbreak()

  // --- 5. INFRARED (IR) SENSORS ---
  #card(title: "5. Infrared (IR) Sensor Types", color: rgb("#7c3aed"))[
    #rounded-table(
      columns: (0.95fr, 1.15fr, 0.95fr),
      inset: 2.8pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#f3e8ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#6b21a8"), weight: "bold", size: 6.7pt)[Type]],
      [#text(fill: rgb("#6b21a8"), weight: "bold", size: 6.7pt)[Principle & Trade-offs]],
      [#text(fill: rgb("#6b21a8"), weight: "bold", size: 6.7pt)[Applications]],
      [
        #highlight("Intensity-Based", color: rgb("#0f172a"))\
        _Reflective_
      ],
      [
        - Measures reflected light\
        - #badge("Pro", color: rgb("#059669")) Cheap, simple\
        - #badge("Con", color: rgb("#dc2626")) Ambient & color sensitive
      ],
      [
        - Line-following\
        - Wall-tracking\
        - Break-beams
      ],
      [
        #highlight("Modulated IR", color: rgb("#0f172a"))\
        _Proximity_
      ],
      [
        - Flashes at $32 - 45 "kHz"$\
        - Receiver demodulates signal\
        - #badge("Pro", color: rgb("#059669")) Immune to ambient light
      ],
      [
        - Proximity sensing\
        - Remote controls\
        - Obstacle avoidance
      ],
      [
        #highlight("IR Triangulation", color: rgb("#0f172a"))\
        _PSD Ranger_
      ],
      [
        - Emitter + lens + *PSD*\
        - Angle of return gives range\
        - #badge("Pro", color: rgb("#059669")) Color & light immune
      ],
      [
        - Sharp GP2D02\
          ($10 - 80 "cm"$)\
        - Distance map
      ]
    )
  ]

  // --- 6. ULTRASONIC SENSORS & NOISE ---
  #card(title: "6. Ultrasonic Sensors & Noise", color: rgb("#2563eb"))[
    - #highlight("Principle:", color: rgb("#0f172a")) Ultrasound burst ($approx 50 "kHz"$). Time-of-Flight ($t$):
      $ D = v dot t quad ==> quad d = (v dot t) / 2 quad (v approx 340 "m/s in air") $
    - #highlight("Limitations:", color: rgb("#0f172a"))
      - *Bearing Uncertainty:* Wide beam spread (opening arc $approx 30^circle$).
      - *Speed Latency:* Sound is slow (e.g. $30 "m"$ round-trip takes $approx 200 "ms"$).
    - #highlight("Noise Issues:", color: rgb("#0f172a")) Acoustic noise & sensor crosstalk.
  ]

  // --- 7. LASER RANGE FINDERS (LiDAR) & EXAM TIP ---
  #card(title: "7. Laser Range Finders (LiDAR)", color: rgb("#db2777"))[
    - #highlight("Performance:", color: rgb("#0f172a")) Long range ($2 "m" - 500 "m"$), high resolution ($10 "mm"$), fast scans ($13 - 40 "ms"$).
    - #highlight("Robustness:", color: rgb("#0f172a")) Narrow beam; immune to ambient light & specular reflections.
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
  #card(title: "1. Agency & Marr's 3-Level Theory", color: rgb("#4f46e5"))[
    - #highlight("Agency:", color: rgb("#0f172a")) Capacity of an entity (human or robot) to act intentionally, make choices, & exert control over actions and outcomes.
    - #highlight("David Marr's Framework:", color: rgb("#4338ca")) Analyzes information systems across 3 empirical levels:

    #v(2pt)
    #rounded-table(
      columns: (0.7fr, 0.9fr, 1.4fr),
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0e7ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.5pt)[Level]],
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.5pt)[Question / Focus]],
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.5pt)[Search & Rescue Robot Example]],
      [*L1: Comp.*], [What goal / problem is solved?], [Locate trapped survivors in low-visibility],
      [*L2: Algo.*], [What processes / IO represent it?], [Steer toward heat & $text("CO")_2$ gradients],
      [*L3: Impl.*], [How physically realized in hardware?], [Angle vectors to heat centroids; wheel motors]
    )

    #v(2.5pt)
    #badge("KEY EXAM CONCEPT", color: rgb("#d97706")) #text(size: 6.7pt, fill: rgb("#92400e"))[L1 & L2 are abstract & identical across biology/robots. Distinction appears #underline[*only at Level 3*].]
  ]

  // --- 2. BIO-INSPIRED ROBOTIC MAPPINGS ---
  #card(title: "2. Bio-Inspired Robotic Mappings", color: rgb("#0284c7"))[
    #rounded-table(
      columns: (0.9fr, 1.1fr, 1fr),
      inset: 2.5pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.5pt)[Biological Model]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.5pt)[Robotic Mapping]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.5pt)[Mechanism]],
      [*Bat Echolocation*], [Obstacle Avoidance], [Echo delay detection (ultrasonic)],
      [*Ant Foraging*], [Swarm Pathfinding], [Ant Colony Optim. (ACO), digital pheromones],
      [*Bird Flocking*], [Coordinated Drone Swarm], [Reynolds Boids: alignment, cohesion, separation],
      [*Frog Tongue*], [Fast Grasping Arm], [High-speed camera + snatch reflex],
      [*Cuttlefish*], [Adaptive Camouflage], [Pattern mapping onto E-skin]
    )
  ]

  #colbreak()

  // --- 3. CLASSIFICATIONS OF BEHAVIOR ---
  #card(title: "3. Classifications of Behavior", color: rgb("#d97706"))[
    - #highlight("Behavior Definition:", color: rgb("#0f172a")) Direct mapping of sensory inputs to motor actions to accomplish a task.

    #v(2.5pt)
    #badge("1. REFLEXIVE (STIMULUS-RESPONSE / S-R)", color: rgb("#dc2626"))
    - Hardwired neural/electronic circuits for fastest execution:
      - #highlight("Reflexes:", color: rgb("#0f172a")) Response lasts *only as long as stimulus* & is proportional to intensity (e.g. knee-jerk, pupillary light reflex).
      - #highlight("Taxes (Taxis):", color: rgb("#0f172a")) Directional orientation / movement relative to stimulus:
        - _Tropotaxis:_ Sea turtles navigating toward moonlit ocean.
        - _Negative Phototaxis:_ Earthworms crawling away from light.
        - _Positive Rheotaxis:_ Salmon swimming upstream against flow.
      - #highlight("Fixed-Action Patterns (FAP):", color: rgb("#0f172a")) Response *persists longer* than triggering stimulus (e.g. spider web weaving, squirrels caching nuts, duckling imprinting).

    #v(3pt)
    #badge("2. REACTIVE BEHAVIORS", color: rgb("#d97706"))
    - Learned skills executed automatically without conscious processing (e.g. riding a bicycle).

    #v(3pt)
    #badge("3. CONSCIOUS BEHAVIORS", color: rgb("#2563eb"))
    - Deliberate, planned actions coordinating multiple sub-behaviors.
  ]

  #colbreak()

  // --- 4. SCHEMA THEORY & OOP ---
  #card(title: "4. Schema Theory & OOP Robotics", color: rgb("#7c3aed"))[
    - #highlight("Schema:", color: rgb("#0f172a")) Foundational OOP template used for the *Reactive Layer* of autonomous robots.
    - #highlight("Components of a Behavior Schema:", color: rgb("#6d28d9"))
      - #badge("Perceptual Schema", color: rgb("#0284c7")) Sensory feature extraction, threshold filtering & stimulus delays.
      - #badge("Motor Schema", color: rgb("#059669")) Computational procedure to produce physical action/movement vector.
    - #highlight("Schema Instantiation (SI):", color: rgb("#0f172a")) Creating a concrete runtime instance from a generic parameterized class template (e.g. applying specific handlebar height & seat position to a bike-riding schema).
  ]

  // --- 5. VECTOR-BASED ACTION & S-R NOTATION ---
  #card(title: "5. Vector Action & S-R Notation", color: rgb("#2563eb"))[
    #highlight("Mathematical Formulations:", color: rgb("#1d4ed8"))
    $ {B : S arrow.r R} quad "or" quad B[S] = R $
    - $S$: Perceptual function converting raw sensor feeds to *percept*.
    - $R$: Motor function converting percept into physical *action*.
    - $B$: Overarching behavioral system.

    #v(2.5pt)
    #highlight("Vector Field Combination:", color: rgb("#1d4ed8"))
    - Directional stimuli (e.g. left & right eyes) are converted to vectors and combined via #highlight("Vector Summation", color: rgb("#0f172a")) ($Sigma$) to determine the resultant motor command:
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
  #card(title: "1. LEGO Mindstorms EV3 Architecture", color: rgb("#4f46e5"))[
    - #highlight("Processing Unit:", color: rgb("#0f172a")) ARM9 @ $300 "MHz"$, $16 "MB"$ Flash, $64 "MB"$ RAM.
    - #highlight("Operating System:", color: rgb("#0f172a")) Embedded Linux-based OS.
    - #highlight("Sensor Ports (1-4):", color: rgb("#4338ca")) $4$ Input ports supporting Analog & high-speed Digital UART up to $460.8 "kbit/s"$.
    - #highlight("Motor Ports (A-D):", color: rgb("#4338ca")) $4$ Output ports with built-in optical rotation encoders for position/speed feedback.
    - #highlight("I/O & Expansion:", color: rgb("#0f172a"))
      - High-speed USB ($480 "Mbit/s"$) + Host daisy-chaining (up to 3 levels), WiFi dongle, & USB storage.
      - Micro SD-card slot (supports up to $32 "GB"$).
    - #highlight("Display & UI:", color: rgb("#0f172a")) $178 times 128$ monochrome LCD matrix, 6 backlit navigation/debugging buttons.
    - #highlight("Wireless Comms:", color: rgb("#0f172a")) Bluetooth v2.1 + EDR, Apple/Android smart device protocol.
  ]

  // --- 2. EVOLUTION OF LEGO ROBOTICS ---
  #card(title: "2. Platform Generations & Modules", color: rgb("#0284c7"))[
    #rounded-table(
      columns: (0.8fr, 0.9fr, 1.3fr),
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.6pt)[Platform]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.6pt)[CPU / OS]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.6pt)[Key Ports & Features]],
      [*RCX (1998)*], [Hitachi H8], [3 In / 3 Out; Optical IR tower comms],
      [*NXT (2006)*], [ARM7 + AVR], [4 In / 3 Out; Bluetooth, $100 times 64$ LCD],
      [*EV3 (2013)*], [ARM9 Linux], [4 In / 4 Out; Daisy-chain, USB Host, SD]
    )
    #v(2pt)
    #highlight("Sensor & Actuator Modules:", color: rgb("#0369a1"))
    - #highlight("Motors:", color: rgb("#0f172a")) Large (high torque) & Medium (high RPM) with integrated tacho-encoders.
    - #highlight("Sensors:", color: rgb("#0f172a")) Touch (binary limit), Color (ambient/reflected/RGB), IR Seeker/Beacon, Ultrasonic.
  ]

  #colbreak()

  // --- 3. STEP 1: AVOID COLLISION ---
  #card(title: "3. Step 1: Avoid Collision (Reflex)", color: rgb("#d97706"))[
    #badge("PURE REFLEXIVE BEHAVIOR", color: rgb("#dc2626"))
    #v(1.5pt)
    - #highlight("Objective:", color: rgb("#0f172a")) Move continuously; instantly back up and pivot when a physical impact occurs.
    
    #v(2pt)
    // Flat Visual Flowchart 1 (No Outlines)
    #block(
      fill: rgb("#f8fafc"),
      stroke: none,
      radius: 5pt,
      inset: 4pt,
      [
        #align(center)[
          #flow-start(txt: "START") #h(3pt) #text(fill: rgb("#94a3b8"), size: 6.5pt)[$arrow.r$] #h(3pt) #flow-decision("Is Collision? (Touch == 1)")
        ]
        #v(2pt)
        #grid(
          columns: (1fr, 1fr),
          gutter: 4pt,
          align: center,
          [
            #text(fill: rgb("#dc2626"), weight: "black", size: 6.0pt)[YES $arrow.b$] \
            #flow-node("Reverse & Turn", sub: "Motors B+C: -30, then steer", color: rgb("#dc2626"))
          ],
          [
            #text(fill: rgb("#059669"), weight: "black", size: 6.0pt)[NO $arrow.b$] \
            #flow-node("Move Forward", sub: "Motors B+C: Power = 75", color: rgb("#059669"))
          ]
        )
      ]
    )
    #v(2pt)
    - #highlight("Collision == True:", color: rgb("#0f172a")) Reverse ($-30$, 2 rot) $arrow.r$ steer turn ($-45 slash 30$, 2 rot).
    - Direct hardware-to-motor S-R loop without state memory.
  ]

  // --- 4. STEP 2: LAYERED OBSTACLE AVOIDANCE ---
  #card(title: "4. Step 2: Collision + Obstacle Avoidance", color: rgb("#059669"))[
    #badge("HIERARCHICAL PRIORITY ARBITRATION", color: rgb("#059669"))
    #v(1.5pt)
    - Combines contact (Touch) and non-contact (Proximity/Force) into a 2-tier reactive hierarchy:
    
    #v(2pt)
    // Flat Visual Flowchart 2 (No Outlines)
    #block(
      fill: rgb("#f8fafc"),
      stroke: none,
      radius: 5pt,
      inset: 4pt,
      [
        #grid(
          columns: (1.1fr, 1.4fr),
          gutter: 4pt,
          align: top + center,
          [
            #flow-decision("1. Collision? (Touch)")
            #v(1.5pt)
            #text(fill: rgb("#dc2626"), weight: "black", size: 5.8pt)[YES $arrow.b$]
            #flow-node("Reverse & Turn", sub: "P1: Emergency Reflex", color: rgb("#dc2626"))
          ],
          [
            #flow-decision("2. Distance < 40cm?")
            #v(1.5pt)
            #grid(
              columns: (1fr, 1fr),
              gutter: 3pt,
              [
                #text(fill: rgb("#d97706"), weight: "black", size: 5.8pt)[YES $arrow.b$]\
                #flow-node("Turn Away", sub: "P2: Proximity", color: rgb("#d97706"))
              ],
              [
                #text(fill: rgb("#059669"), weight: "black", size: 5.8pt)[NO $arrow.b$]\
                #flow-node("Forward", sub: "P3: Cruise", color: rgb("#059669"))
              ]
            )
          ]
        )
      ]
    )
    #v(2pt)
    - #highlight("P1 (Touch):", color: rgb("#0f172a")) Emergency physical recovery (overrides all).
    - #highlight("P2 (Proximity):", color: rgb("#0f172a")) Smooth steering turn away before contact.
    - #highlight("P3 (Default):", color: rgb("#0f172a")) Drive straight ahead.
  ]

  #colbreak()

  // --- 5. STEP 3A: 1-SENSOR LINE FOLLOWING ---
  #card(title: "5. Step 3a: 1-Sensor Line Following", color: rgb("#7c3aed"))[
    #badge("BANG-BANG / EDGE TRACKING", color: rgb("#7c3aed"))
    #v(1.5pt)
    - Tracks the #highlight("boundary edge", color: rgb("#0f172a")) between light and dark surfaces using 1 photo/color sensor.

    #v(2pt)
    // Flat Visual Flowchart 3 (No Outlines)
    #block(
      fill: rgb("#f8fafc"),
      stroke: none,
      radius: 5pt,
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
            #text(fill: rgb("#7c3aed"), weight: "black", size: 6.0pt)[YES (On Dark) $arrow.b$] \
            #flow-node("Turn Left", sub: "Motor C ON / B OFF", color: rgb("#7c3aed"))
          ],
          [
            #text(fill: rgb("#0284c7"), weight: "black", size: 6.0pt)[NO (On Light) $arrow.b$] \
            #flow-node("Turn Right", sub: "Motor B ON / C OFF", color: rgb("#0284c7"))
          ]
        )
      ]
    )
    #v(2pt)
    - $text("Ref") < text("Th")$ (On black) $arrow.r$ Steer outside ($"Turn Left"$).
    - $text("Ref") >= text("Th")$ (On white) $arrow.r$ Steer inside ($"Turn Right"$).
    - #highlight("Control Characteristic:", color: rgb("#0f172a")) 2-state discrete bang-bang controller; causes high-frequency zigzag oscillation along line edge.
  ]

  // --- 6. BEHAVIORAL PATTERNS SUMMARY ---
  #card(title: "6. Reactive Control Summary", color: rgb("#2563eb"))[
    #rounded-table(
      columns: (0.9fr, 1fr, 1.2fr),
      inset: 2.6pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0e7ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.6pt)[Stage]],
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.6pt)[Sensor Used]],
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.6pt)[Behavior Pattern]],
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
