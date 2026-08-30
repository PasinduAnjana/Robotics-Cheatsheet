#import "@preview/lucide:0.1.0": *

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
// LUCIDE ICON HELPER (TYPST UNIVERSE PACKAGE)
// ==========================================

#let icon(name, color: rgb("#4f46e5"), size: 8.5pt) = box(
  baseline: 12%,
  lucide-icon(name, fill: color, size: size)
)

// ==========================================
// REUSABLE FLAT LIGHT THEME COMPONENTS
// ==========================================

#let card(title: "", color: rgb("#4f46e5"), icon-name: none, body) = {
  block(
    width: 100%,
    stroke: none,
    radius: 5.5pt,
    fill: color.lighten(95%),
    clip: true,
    inset: 0pt,
    [
      // Card Header
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
            if icon-name != none { icon(icon-name, color: color, size: 8.5pt) } else {
              box(
                width: 5pt,
                height: 5pt,
                radius: 100pt,
                fill: color,
              )
            },
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

#let mini-block(title: "", badge-txt: "", color: rgb("#dc2626"), body) = block(
  width: 100%,
  fill: color.lighten(94%),
  radius: 4.0pt,
  inset: (x: 5.5pt, y: 3.8pt),
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      text(fill: color.darken(35%), weight: "bold", size: 7.2pt)[#title],
      if badge-txt != "" {
        box(
          fill: color.lighten(84%),
          stroke: none,
          radius: 3pt,
          inset: (x: 3.5pt, y: 1.2pt),
          text(fill: color.darken(40%), weight: "bold", size: 6.2pt)[#badge-txt]
        )
      }
    )
    #v(2.0pt)
    #body
  ]
)

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
        align: (left + horizon, left + top),
        icon("lightbulb", color: rgb("#d97706"), size: 9.0pt),
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
          #icon("bot", color: rgb("#4338ca"), size: 12.5pt)
          #h(3pt)
          #text(size: 11.5pt, weight: "black", fill: rgb("#4338ca"))[ROBOTICS]
          #h(2pt)
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
  #card(title: "1. What is a Robot?", color: rgb("#4f46e5"), icon-name: "bot")[
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
  #card(title: "2. Automation vs. Robots", color: rgb("#0284c7"), icon-name: "layers")[
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
  #card(title: "3. Asimov's 3 Laws of Robotics", color: rgb("#d97706"), icon-name: "shield")[
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
  #card(title: "4. Core Hardware Architecture", color: rgb("#059669"), icon-name: "cpu")[
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
  #card(title: "5. Robot Types & Applications", color: rgb("#7c3aed"), icon-name: "compass")[
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
  #card(title: "6. Robot Programming Methods", color: rgb("#2563eb"), icon-name: "code")[
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
  #card(title: "7. Performance Metrics", color: rgb("#db2777"), icon-name: "gauge")[
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
  #card(title: "1. Sensing & Transduction", color: rgb("#4f46e5"), icon-name: "zap")[
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
  #card(title: "2. Sensor Classifications", color: rgb("#0284c7"), icon-name: "eye")[
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
  #card(title: "3. Contact & Resistive Sensors", color: rgb("#d97706"), icon-name: "activity")[
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
  #card(title: "4. Capacitive vs. Inductive Sensors", color: rgb("#059669"), icon-name: "zap")[
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
  #card(title: "5. Infrared (IR) Sensor Types", color: rgb("#7c3aed"), icon-name: "radio")[
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
  #card(title: "6. Ultrasonic Sensors & Noise", color: rgb("#2563eb"), icon-name: "activity")[
    - #highlight("Principle:", color: rgb("#0f172a")) Ultrasound burst ($approx 50 "kHz"$). Time-of-Flight ($t$):
      $ D = v dot t quad ==> quad d = (v dot t) / 2 quad (v approx 340 "m/s in air") $
    - #highlight("Limitations:", color: rgb("#0f172a"))
      - *Bearing Uncertainty:* Wide beam spread (opening arc $approx 30^circle$).
      - *Speed Latency:* Sound is slow (e.g. $30 "m"$ round-trip takes $approx 200 "ms"$).
    - #highlight("Noise Issues:", color: rgb("#0f172a")) Acoustic noise & sensor crosstalk.
  ]

  // --- 7. LASER RANGE FINDERS (LiDAR) & EXAM TIP ---
  #card(title: "7. Laser Range Finders (LiDAR)", color: rgb("#db2777"), icon-name: "compass")[
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
  #card(title: "1. Agency & Marr's 3-Level Theory", color: rgb("#4f46e5"), icon-name: "bot")[
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
  #card(title: "2. Bio-Inspired Robotic Mappings", color: rgb("#0284c7"), icon-name: "compass")[
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
  #card(title: "3. Classifications of Behavior", color: rgb("#d97706"), icon-name: "zap")[
    #block(
      width: 100%,
      fill: rgb("#fef3c7"),
      radius: 4.0pt,
      inset: (x: 5.5pt, y: 3.5pt),
      [
        #grid(
          columns: (auto, 1fr),
          gutter: 4.5pt,
          align: (left + horizon, left + horizon),
          icon("zap", color: rgb("#d97706"), size: 8.5pt),
          [
            #text(weight: "black", size: 6.8pt, fill: rgb("#92400e"))[BEHAVIOR DEFINITION:]
            #h(2pt)
            #text(size: 7.1pt, fill: rgb("#78350f"))[Direct mathematical mapping of *sensory inputs* to *motor actions* to achieve a task.]
          ]
        )
      ]
    )

    #v(2.5pt)
    #mini-block(title: "1. Reflexive (Stimulus-Response)", badge-txt: "Hardwired / Fastest", color: rgb("#dc2626"))[
      #grid(
        columns: (auto, 1fr),
        gutter: 4.5pt,
        row-gutter: 3.0pt,
        align: (left + top, left + top),
        badge("Reflex", color: rgb("#dc2626")),
        [Lasts *only during stimulus* (knee-jerk, pupil reflex).],
        badge("Taxis", color: rgb("#d97706")),
        [
          *Directional steering* relative to stimulus: \
          #text(size: 6.8pt, fill: rgb("#475569"))[
            • _Tropotaxis:_ Turtles to moonlight | _- Phototaxis:_ Worms away from light | _+ Rheotaxis:_ Salmon upstream
          ]
        ],
        badge("FAP", color: rgb("#7c3aed")),
        [Response *persists longer* than stimulus (spider web, nut caching, duckling imprinting).]
      )
    ]

    #v(2.5pt)
    #mini-block(title: "2. Reactive Behaviors", badge-txt: "Muscle Memory", color: rgb("#d97706"))[
      Learned skills consolidated to execute automatically without conscious thought (e.g. riding a bicycle).
    ]

    #v(2.5pt)
    #mini-block(title: "3. Conscious Behaviors", badge-txt: "Deliberative", color: rgb("#2563eb"))[
      Deliberate, goal-directed planning coordinating multiple sub-behaviors (e.g. puzzle solving, kit assembly).
    ]
  ]

  // --- 4. BEHAVIORAL SCHEMA ARCHITECTURE DIAGRAM ---
  #card(title: "4. Behavioral Schema Architecture", color: rgb("#7c3aed"), icon-name: "layers")[
    #block(
      width: 100%,
      fill: rgb("#f5f3ff"),
      radius: 4.5pt,
      inset: (x: 5.5pt, y: 4.0pt),
      [
        #align(center)[
          #text(weight: "bold", size: 7.0pt, fill: rgb("#6d28d9"))[Behavioral Schema: ]
          #badge("feed", color: rgb("#7c3aed"))
        ]
        #v(2.5pt)
        #grid(
          columns: (auto, 1fr, auto, 1fr, auto),
          gutter: 3.0pt,
          align: horizon + center,
          [
            #text(size: 6.0pt, weight: "bold", fill: rgb("#475569"))[eyes] \
            #text(size: 7.5pt, fill: rgb("#64748b"))[$arrow.r.double$]
          ],
          [
            #block(
              width: 100%,
              fill: rgb("#ede9fe"),
              radius: 3.5pt,
              inset: (x: 3pt, y: 3.5pt),
              align(center)[
                #badge("Perceptual Schema", color: rgb("#0284c7")) \
                #v(1.5pt)
                #text(weight: "black", size: 6.8pt, fill: rgb("#1e1b4b"))["small, moving"] \
                #text(size: 5.5pt, fill: rgb("#64748b"))[(feature filter)]
              ]
            )
          ],
          [
            #text(size: 5.5pt, weight: "bold", fill: rgb("#7c3aed"))[location,\ intensity] \
            #text(size: 7.5pt, fill: rgb("#7c3aed"))[$arrow.r.double$]
          ],
          [
            #block(
              width: 100%,
              fill: rgb("#ede9fe"),
              radius: 3.5pt,
              inset: (x: 3pt, y: 3.5pt),
              align(center)[
                #badge("Motor Schema", color: rgb("#059669")) \
                #v(1.5pt)
                #text(weight: "black", size: 6.8pt, fill: rgb("#1e1b4b"))["snap"] \
                #text(size: 5.5pt, fill: rgb("#64748b"))[(action calc)]
              ]
            )
          ],
          [
            #text(size: 6.0pt, weight: "bold", fill: rgb("#475569"))[vector] \
            #text(size: 7.5pt, fill: rgb("#64748b"))[$arrow.r.double$]
          ]
        )
      ]
    )
    #v(2pt)
    - #highlight("Frog Case Study:", color: rgb("#6d28d9")) Raw visual stimulus ($"eyes"$) is filtered into a clean percept ($"small, moving"$), passing coordinate $(x, y)$ and intensity to the motor schema to generate a tongue *snap vector*.
  ]

  #colbreak()

  // --- 5. SCHEMA THEORY & OOP ROBOTICS ---
  #card(title: "5. Schema Theory & OOP Robotics", color: rgb("#7c3aed"), icon-name: "layers")[
    - #highlight("Schema:", color: rgb("#0f172a")) Foundational OOP template used for the *Reactive Layer* of autonomous robots.
    - #highlight("Components of a Behavior Schema:", color: rgb("#6d28d9"))
      - #badge("Perceptual Schema", color: rgb("#0284c7")) Sensory feature extraction, threshold filtering & stimulus delays.
      - #badge("Motor Schema", color: rgb("#059669")) Computational procedure to produce physical action/movement vector.
    - #highlight("Schema Instantiation (SI):", color: rgb("#0f172a")) Creating a concrete runtime instance from a generic parameterized class template (e.g. applying specific handlebar height & seat position to a bike-riding schema).
  ]

  // --- 6. VECTOR-BASED ACTION & S-R NOTATION ---
  #card(title: "6. Vector Action & S-R Notation", color: rgb("#2563eb"), icon-name: "compass")[
    #highlight("Mathematical Formulations:", color: rgb("#1d4ed8"))
    #v(2pt)
    #block(
      width: 100%,
      fill: rgb("#e0e7ff"),
      radius: 3.5pt,
      inset: (x: 4pt, y: 2.8pt),
      align(center)[#text(fill: rgb("#312e81"), weight: "bold", size: 8.2pt)[$ {B : S arrow.r R} quad "or" quad B[S] = R $]]
    )
    #v(2pt)
    - $S$: Perceptual function converting raw sensor feeds to *percept*.
    - $R$: Motor function converting percept into physical *action*.
    - $B$: Overarching behavioral system.

    #v(3pt)
    #highlight("Vector Field Combination:", color: rgb("#1d4ed8"))
    #v(1.5pt)
    - Directional stimuli (e.g. left & right eyes) combine via #highlight("Vector Summation", color: rgb("#0f172a")) ($Sigma$):
    #v(1.5pt)
    #block(
      width: 100%,
      fill: rgb("#e0e7ff"),
      radius: 3.5pt,
      inset: (x: 4pt, y: 2.8pt),
      align(center)[#text(fill: rgb("#312e81"), weight: "bold", size: 8.2pt)[$ V_("resultant") = v_("left") + v_("right") $]]
    )
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
  #card(title: "1. LEGO Mindstorms EV3 Architecture", color: rgb("#4f46e5"), icon-name: "cpu")[
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
  #card(title: "2. Platform Generations & Modules", color: rgb("#0284c7"), icon-name: "layers")[
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
  #card(title: "3. Step 1: Avoid Collision (Reflex)", color: rgb("#d97706"), icon-name: "zap")[
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
  #card(title: "4. Step 2: Collision + Obstacle Avoidance", color: rgb("#059669"), icon-name: "shield")[
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
  #card(title: "5. Step 3a: 1-Sensor Line Following", color: rgb("#7c3aed"), icon-name: "activity")[
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
  #card(title: "6. Reactive Control Summary", color: rgb("#2563eb"), icon-name: "code")[
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

#pagebreak()

// =========================================================
// PAGE 5: LECTURE 05 — ROBOT CONTROL ARCHITECTURES & STRIPS
// =========================================================

#header-banner("05", "Robot Control Architectures & STRIPS Planning", "CONTROL ARCHITECTURES")

#columns(3, gutter: 8.5pt)[

  // --- 1. CONTROL ARCHITECTURES TAXONOMY ---
  #card(title: "1. Control Paradigm Taxonomy", color: rgb("#4f46e5"), icon-name: "cpu")[
    - #highlight("Core Philosophy:", color: rgb("#4338ca")) How sensing, decision-making, and execution interact.
    
    #v(2pt)
    #rounded-table(
      columns: (1fr, 1.3fr),
      inset: 2.8pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0e7ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.6pt)[Paradigm]],
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.6pt)[Information Flow & Focus]],
      [*Hierarchical / Deliberative*], [$"Sense" arrow.r "Plan" arrow.r "Act"$\ Global world model, top-down plan],
      [*Reactive / Behavior-Based*], [$"Sense" arrow.r "Act"$\ Fast direct S-R loops, no world model],
      [*Hybrid*], [$"Plan" arrow.r ["Sense" arrow.r "Act"]$\ Deliberative mission + reactive reflex]
    )

    #v(2.5pt)
    #highlight("Hierarchical (Sense-Plan-Act):", color: rgb("#4338ca"))
    #v(1.5pt)
    // Visual SPA Flowchart
    #block(
      width: 100%,
      fill: rgb("#f5f3ff"),
      radius: 3.5pt,
      inset: 3.5pt,
      align(center)[
        #grid(
          columns: (1fr, auto, 1fr, auto, 1fr),
          gutter: 3pt,
          align: horizon + center,
          flow-node("Sense", sub: "Observe", color: rgb("#0284c7")),
          text(fill: rgb("#94a3b8"), size: 7.5pt)[$arrow.r$],
          flow-node("Plan", sub: "World Model", color: rgb("#d97706")),
          text(fill: rgb("#94a3b8"), size: 7.5pt)[$arrow.r$],
          flow-node("Act", sub: "Execute", color: rgb("#059669"))
        )
      ]
    )
    #v(2pt)
    - #highlight("'Eyes Closed' Execution:", color: rgb("#0f172a")) Robot senses once, computes entire plan, then executes directives without re-evaluating until loop restarts.
  ]

  // --- 2. MONOLITHIC SENSING & AUTONOMOUS PIPELINE ---
  #card(title: "2. Monolithic Sensing & Architecture", color: rgb("#0284c7"), icon-name: "layers")[
    - #highlight("Monolithic Sensing:", color: rgb("#0369a1")) All sensor observations fuse into *one global data structure* (World Model) accessed by planner:
      - #badge("A Priori", color: rgb("#0284c7")) Pre-loaded maps/building layout.
      - #badge("Sensing Info", color: rgb("#059669")) Current state & localization ("in NW hallway").
      - #badge("Cognitive", color: rgb("#7c3aed")) Mission goals (deliver item to Room 118).

    #v(2.5pt)
    #highlight("Autonomous Vehicle Pipeline:", color: rgb("#0369a1"))
    #v(1.5pt)
    #rounded-table(
      columns: (1fr, 1.5fr),
      inset: 2.5pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.4pt)[Stage]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.4pt)[Sub-Modules & Tasks]],
      [*Sensors*], [Cameras, Radar, LiDAR, GPS / IMU],
      [*Perception*], [Obstacle Detection, Free Space, Localisation],
      [*Planning*], [Route $arrow.r$ Behavioral $arrow.r$ Trajectory],
      [*Control*], [PID, MPC $arrow.r$ Drive-By-Wire (DBW) Actuators]
    )
  ]

  #colbreak()

  // --- 3. SHAKEY & STRIPS PLANNING ---
  #card(title: "3. Shakey & STRIPS Planning (6-Step Algorithm)", color: rgb("#d97706"), icon-name: "bot")[
    - #highlight("Shakey (1967-69, SRI / DARPA):", color: rgb("#b45309")) First AI mobile robot using *Means-Ends Analysis* (reduces state difference $Delta$).
    
    #v(2pt)
    #mini-block(title: "The 6 Steps in Executing STRIPS", badge-txt: "Recursive Stack", color: rgb("#d97706"))[
      #grid(
        columns: 1fr,
        row-gutter: 2.2pt,
        block(
          width: 100%,
          fill: rgb("#fffbeb"),
          radius: 3pt,
          inset: (x: 4pt, y: 2.0pt),
          grid(
            columns: (auto, 1fr),
            gutter: 4pt,
            align: (left + top, left + top),
            num-bullet("1", color: rgb("#d97706")),
            [#text(size: 6.9pt)[*Compute difference:* $Delta = "Goal" - "Initial State"$. If $Delta = emptyset$, terminate.]]
          )
        ),
        block(
          width: 100%,
          fill: rgb("#f0f9ff"),
          radius: 3pt,
          inset: (x: 4pt, y: 2.0pt),
          grid(
            columns: (auto, 1fr),
            gutter: 4pt,
            align: (left + top, left + top),
            num-bullet("2", color: rgb("#0284c7")),
            [#text(size: 6.9pt)[*Select Operator:* If $Delta != emptyset$, pick 1st operator in Difference Table whose *add-list* negates $Delta$.]]
          )
        ),
        block(
          width: 100%,
          fill: rgb("#eef2ff"),
          radius: 3pt,
          inset: (x: 4pt, y: 2.0pt),
          grid(
            columns: (auto, 1fr),
            gutter: 4pt,
            align: (left + top, left + top),
            num-bullet("3", color: rgb("#4f46e5")),
            [#text(size: 6.9pt)[*Examine Preconditions:* Check if variable bindings evaluate all preconditions to *TRUE*.]]
          )
        ),
        block(
          width: 100%,
          fill: rgb("#fff1f2"),
          radius: 3pt,
          inset: (x: 4pt, y: 2.0pt),
          grid(
            columns: (auto, 1fr),
            gutter: 4pt,
            align: (left + top, left + top),
            num-bullet("4", color: rgb("#dc2626")),
            [#text(size: 6.9pt)[*Recurse on Subgoal:* If FALSE, push original goal to stack, set 1st FALSE condition as *new subgoal*, & recurse.]]
          )
        ),
        block(
          width: 100%,
          fill: rgb("#ecfdf5"),
          radius: 3pt,
          inset: (x: 4pt, y: 2.0pt),
          grid(
            columns: (auto, 1fr),
            gutter: 4pt,
            align: (left + top, left + top),
            num-bullet("5", color: rgb("#059669")),
            [#text(size: 6.9pt)[*Push to Plan Stack:* When all preconditions match, push operator to plan stack & update world model copy.]]
          )
        ),
        block(
          width: 100%,
          fill: rgb("#f5f3ff"),
          radius: 3pt,
          inset: (x: 4pt, y: 2.0pt),
          grid(
            columns: (auto, 1fr),
            gutter: 4pt,
            align: (left + top, left + top),
            num-bullet("6", color: rgb("#7c3aed")),
            [#text(size: 6.9pt)[*Pop & Resume:* Return to parent operator with failed condition to apply it or recurse on next condition.]]
          )
        )
      )
    ]
  ]

  // --- 4. STRIPS OPERATOR LOGIC ---
  #card(title: "4. STRIPS Predicates & Operator Anatomy", color: rgb("#7c3aed"), icon-name: "code")[
    - #highlight("Predicates:", color: rgb("#6d28d9")) UPPERCASE statements evaluating to $"TRUE"/"FALSE"$ (e.g. $text("INROOM")(text("IT"), R_1)$, $text("CONNECTS")(D_1, R_1, R_2)$).
    
    #v(2pt)
    #rounded-table(
      columns: (1fr, 1.35fr, 1.05fr, 0.85fr),
      inset: 2.5pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#f3e8ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#6b21a8"), weight: "bold", size: 6.2pt)[Operator]],
      [#text(fill: rgb("#6b21a8"), weight: "bold", size: 6.2pt)[Preconditions]],
      [#text(fill: rgb("#6b21a8"), weight: "bold", size: 6.2pt)[Add-List]],
      [#text(fill: rgb("#6b21a8"), weight: "bold", size: 6.2pt)[Delete-List]],
      
      [#text(weight: "bold")[GOTODOOR\ (IT, dx)]],
      [
        #text(size: 5.6pt)[$text("INROOM")("IT", r_k)$]        #text(size: 5.6pt)[$text("CONNECT")(d_x, r_k, r_m)$]
      ],
      [#text(size: 5.6pt)[$text("NEXTTO")("IT", d_x)$]],
      [#text(size: 5.6pt)[---]],

      [#text(weight: "bold")[GOTHRU\ (IT, dx)]],
      [
        #text(size: 5.6pt)[$text("CONNECT")(d_x, r_k, r_m)$]        #text(size: 5.6pt)[$text("NEXTTO")("IT", d_x)$]        #text(size: 5.6pt)[$text("STATUS")(d_x, "OPEN")$]
      ],
      [#text(size: 5.6pt)[$text("INROOM")("IT", r_m)$]],
      [#text(size: 5.6pt)[$text("INROOM")("IT", r_k)$]]
    )
    #v(2pt)
    - #highlight("Generated Plan:", color: rgb("#0f172a")) Stack sequence: $text("GOTODOOR")(text("IT"), D_1) arrow.r text("GOTHRUDOOR")(text("IT"), D_1)$.
  ]

  #colbreak()

  // --- 5. WAREHOUSE STRIPS CASE STUDY ---
  #card(title: "5. Warehouse STRIPS Case Study", color: rgb("#059669"), icon-name: "compass")[
    #highlight("Warehouse Layout:", color: rgb("#047857")) Locations Charging ($C$), Storage ($S$), Packing ($P$), Delivery ($D$).
    
    #v(2.0pt)
    #image("assets/warehouse_layout.svg", width: 100%)

    #v(2pt)
    #rounded-table(
      columns: (0.95fr, 1.25fr, 0.95fr, 0.95fr),
      inset: 2.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#d1fae5") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.1pt)[Operator]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.1pt)[Preconditions]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.1pt)[Add-List]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.1pt)[Delete-List]],
      
      [#text(weight: "bold")[Move(x, y)]],
      [
        #text(size: 5.6pt)[$text("Path")(x, y)$]        #text(size: 5.6pt)[$not text("Blocked")(x, y)$]        #text(size: 5.6pt)[$text("At")("Robot", x)$]
      ],
      [#text(size: 5.6pt)[$text("At")("Robot", y)$]],
      [#text(size: 5.6pt)[$text("At")("Robot", x)$]],

      [#text(weight: "bold")[PickUp(p, x)]],
      [
        #text(size: 5.6pt)[$text("At")(p, x)$]        #text(size: 5.6pt)[$text("At")("Robot", x)$]        #text(size: 5.6pt)[$text("HandEmpty")$]
      ],
      [#text(size: 5.6pt)[$text("Holding")(p)$]],
      [
        #text(size: 5.6pt)[$text("At")(p, x)$]        #text(size: 5.6pt)[$text("HandEmpty")$]
      ],

      [#text(weight: "bold")[PutDown(p, x)]],
      [
        #text(size: 5.6pt)[$text("Holding")(p)$]        #text(size: 5.6pt)[$text("At")("Robot", x)$]
      ],
      [
        #text(size: 5.6pt)[$text("At")(p, x)$]        #text(size: 5.6pt)[$text("HandEmpty")$]
      ],
      [#text(size: 5.6pt)[$text("Holding")(p)$]]
    )

    #v(2pt)
    - #highlight("Obstacle Contingency:", color: rgb("#0f172a")) Since $text("Blocked")(P, D)$ is TRUE, planner avoids path $S arrow.r P arrow.r D$ and selects detour:
      #align(center)[#badge("Detour Plan:", color: rgb("#059669")) $text("Move")(C, S) arrow.r text("PickUp")(P_1, S) arrow.r text("Move")(S, C) arrow.r text("Move")(C, D) arrow.r text("PutDown")(P_1, D)$]
  ]

  // --- 6. EXAM TIP BOX ---
  #tip-box(title: "HIGH-YIELD EXAM DISTINCTION (LECTURE 05)")[
    *Deliberative Pros vs Cons:* Pro: Computes optimal, goal-directed solutions. Con: Fragile under uncertainty, high computational complexity, slow to react to dynamic changes.     *STRIPS Add/Delete Rule:* World state updates *only* by deleting predicates in Delete-List and appending predicates in Add-List upon successful precondition binding.
  ]
]

#pagebreak()

// =========================================================
// PAGE 6: LECTURE 06 — PERCEPTION & BEHAVIORAL COORDINATION
// =========================================================

#header-banner("06", "Perception, Affordances & Behavioral Coordination", "PERCEPTION & BEHAVIORS")

#columns(3, gutter: 8.5pt)[

  // --- 1. ACTION-PERCEPTION CYCLE & GIBSON ---
  #card(title: "1. Action-Perception & Ecological Approach", color: rgb("#4f46e5"), icon-name: "activity")[
    - #highlight("Action-Perception Cycle:", color: rgb("#4338ca")) Continuous closed feedback loop where perception guides actions, and actions alter the environment.
    
    #v(2.0pt)
    #image("assets/action_perception_cycle.svg", width: 100%)
    
    #v(2.0pt)
    - #highlight("Gibson's Ecological Approach:", color: rgb("#0f172a"))
      - #badge("Core Tenet", color: rgb("#4f46e5")) #text(size: 6.8pt, style: "italic")["... the world is its own best representation."]
      - Perception evolved *only to support survival actions* in an ecological niche, not to build abstract 3D maps.
  ]

  // --- 2. AFFORDANCES & TWO PERCEPTUAL SYSTEMS ---
  #card(title: "2. Affordances & Perceptual Systems", color: rgb("#0284c7"), icon-name: "eye")[
    - #highlight("Affordance:", color: rgb("#0369a1")) Directly perceivable potentiality for action provided by the environment (e.g. a chair affords *sitability*).
    - #highlight("Direct Perception:", color: rgb("#0f172a")) Requires *no memory, inference, or interpretation* $arrow.r$ near-instantaneous execution.
      - #badge("Visual: Optic Flow", color: rgb("#0284c7")) Pattern of apparent visual motion; expanding outward from center gives *time-to-contact* (diving gannets, landing).
      - #badge("Non-Visual", color: rgb("#059669")) Sound pitch change when filling a container indicates fullness without knowing cavity dimensions.

    #v(2.5pt)
    #rounded-table(
      columns: (1fr, 1.2fr),
      inset: 2.5pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.4pt)[Direct Perception (Gibsonian)]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.4pt)[Recognition (Cognitive)]],
      [
        - Primitive brain structures        - Local world models        - Fast, lightweight affordances
      ],
      [
        - High cognitive brain        - Global world models        - Top-down internal templates ("my cup vs your cup")
      ]
    )
  ]

  #colbreak()

  // --- 3. BEHAVIOR ACQUISITION SPECTRUM ---
  #card(title: "3. Behavior Acquisition Spectrum", color: rgb("#d97706"), icon-name: "compass")[
    #rounded-table(
      columns: (0.9fr, 0.9fr, 1.3fr),
      inset: 2.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#fef3c7") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#92400e"), weight: "bold", size: 6.2pt)[Type]],
      [#text(fill: rgb("#92400e"), weight: "bold", size: 6.2pt)[Biological Model]],
      [#text(fill: rgb("#92400e"), weight: "bold", size: 6.2pt)[Mechanism & Strategy]],
      
      [*Innate*], [*Arctic Tern* chicks], [Born with rule: "Peck at largest red blob" $arrow.r$ triggers parent feeding reflex.],
      [*Sequence of Innate*], [*Digger Wasp*], [Mating $arrow.r$ internal state triggers nest building $arrow.r$ visual nest triggers egg laying.],
      [*Innate with Memory*], [*Baby Bees*], [Innate flight exploration in expanding arcs to memorize hive appearance and approach vectors.],
      [*Learned*], [*Lion Cubs*], [Born with zero hunting behaviors; complex multi-stage skills (stalk, chase) learned over years.]
    )
  ]

  // --- 4. INNATE RELEASING MECHANISMS (IRM) ---
  #card(title: "4. Innate Releasing Mechanisms (IRM)", color: rgb("#7c3aed"), icon-name: "zap")[
    - #highlight("IRM Definition:", color: rgb("#6d28d9")) Theoretical construct where specific sensory triggers (*sign stimuli / releasers*) activate fixed behaviors.
    - #highlight("Releaser as Control Signal:", color: rgb("#0f172a")) Acts as a Boolean latch turning a behavior ON or OFF. If not released, behavior produces zero output.
    - #highlight("Compound Releasers:", color: rgb("#6d28d9")) Logical combination of *external stimuli* and *internal motivation* (e.g. $text("Hungry") and text("FoodPresent")$).
    
    #v(2.5pt)
    #mini-block(title: "Execution Modes & State Control", badge-txt: "Coordination", color: rgb("#7c3aed"))[
      - #highlight("Implicit Chaining:", color: rgb("#0f172a")) Execution order emerges dynamically from which releasers are TRUE.
      - #highlight("Inhibition & FAP Persistence:", color: rgb("#0f172a")) Prevents rapid flickering between states (e.g. flee vs feed) by locking behavior for time $T$.
      - #highlight("Explicit Sequences:", color: rgb("#0f172a")) State-machine order where each behavior runs to completion before advancing.
    ]
  ]

  #colbreak()

  // --- 5. BEHAVIORAL COORDINATION & CONCURRENT BEHAVIORS ---
  #card(title: "5. Coordination & Concurrent Behaviors", color: rgb("#059669"), icon-name: "layers")[
    #highlight("Behavioral Coordination Architecture:", color: rgb("#047857"))
    #v(1.5pt)
    #block(
      width: 100%,
      fill: rgb("#ecfdf5"),
      radius: 4pt,
      inset: (x: 4.5pt, y: 4.0pt),
      align(center)[
        #badge("Behavioral Coordination", color: rgb("#047857"))
        
        #box(width: 100%, height: 3.5pt)[
          #place(top + center, dx: 0pt, dy: 0pt, line(angle: 90deg, length: 3.5pt, stroke: 0.65pt + rgb("#64748b")))
        ]
        
        #grid(
          columns: (1.25fr, 0.75fr),
          align: (center, top),
          [
            #box(width: 100%, height: 4.5pt)[
              #place(top + right, dx: 0pt, dy: 0pt, line(length: 48%, stroke: 0.65pt + rgb("#64748b")))
              #place(top + left, dx: 52%, dy: 0pt, line(angle: 90deg, length: 4.5pt, stroke: 0.65pt + rgb("#64748b")))
            ]
            #badge("Concurrent", color: rgb("#0284c7"))
            
            #box(width: 100%, height: 3.5pt)[
              #place(top + center, dx: 0pt, dy: 0pt, line(angle: 90deg, length: 3.5pt, stroke: 0.65pt + rgb("#64748b")))
            ]
            #box(width: 100%, height: 4.5pt)[
              #place(top + center, dx: 0pt, dy: 0pt, line(length: 68%, stroke: 0.65pt + rgb("#64748b")))
              #place(top + left, dx: 16%, dy: 0pt, line(angle: 90deg, length: 4.5pt, stroke: 0.65pt + rgb("#64748b")))
              #place(top + right, dx: -16%, dy: 0pt, line(angle: 90deg, length: 4.5pt, stroke: 0.65pt + rgb("#64748b")))
            ]
            #grid(
              columns: (1fr, 1fr),
              gutter: 2.5pt,
              align: (center, top),
              [#text(size: 5.4pt, weight: "bold", fill: rgb("#0369a1"))[Cooperating\ (Blending / $Sigma$)]],
              [#text(size: 5.4pt, weight: "bold", fill: rgb("#0369a1"))[Competing\ (Arbitration)]]
            )
          ],
          [
            #box(width: 100%, height: 4.5pt)[
              #place(top + left, dx: 0pt, dy: 0pt, line(length: 48%, stroke: 0.65pt + rgb("#64748b")))
              #place(top + left, dx: 48%, dy: 0pt, line(angle: 90deg, length: 4.5pt, stroke: 0.65pt + rgb("#64748b")))
            ]
            #badge("Sequences", color: rgb("#7c3aed"))
            #v(2.5pt)
            #text(size: 5.3pt, fill: rgb("#64748b"))[(State Machines /\ Chained Tasks)]
          ]
        )
      ]
    )

    #v(2.5pt)
    #highlight("3 Types of Concurrent Interactions:", color: rgb("#047857"))
    #v(1.5pt)
    - #highlight("1. Equilibrium:", color: rgb("#0f172a")) Behaviors balance each other out (e.g. *Squirrel* hesitant between food lure and fear of human).
    - #highlight("2. Dominance (Winner-Take-All):", color: rgb("#0f172a")) One behavior completely suppresses others (e.g. sleep vs feed, flight over forage).
    - #highlight("3. Cancellation:", color: rgb("#0f172a")) Opposing stimuli cancel each other, leaving displacement behavior (e.g. *Male Stickleback* fish building a new nest when territory defense & attack cancel).
  ]

  // --- 6. EXAM TIP BOX ---
  #tip-box(title: "HIGH-YIELD EXAM DISTINCTION (LECTURE 06)")[
    *Design Hierarchy:* Always solve behavior using *Affordances* (direct perception) first if possible; resort to *Recognition* (world models) only when cognitive identification is strictly required.     *IRM Control vs Perceptual Filter:* An IRM's releaser decides *WHEN* to run; perceptual schema filters *WHAT* to track.
  ]
]

#pagebreak()

// =========================================================
// PAGE 7: LECTURE 07 — BEHAVIORAL COORDINATION: POTENTIAL FIELDS
// =========================================================

#header-banner("07", "Behavioral Coordination: Potential Fields", "POTENTIAL FIELDS")

#columns(3, gutter: 8.5pt)[

  // --- 1. POTENTIAL FIELDS METHODOLOGY ---
  #card(title: "1. Potential Fields Methodology", color: rgb("#4f46e5"), icon-name: "compass")[
    - #highlight("Core Concept:", color: rgb("#4338ca")) Most common method for *cooperating behaviors*; outputs are represented as *vectors* in a continuous field.
    - #highlight("Vector Tuple (m, d):", color: rgb("#0f172a")) Written as $(m, d)$ where:
      - $m$ = Magnitude (velocity / force strength).
      - $d$ = Direction (heading angle $phi$).
    - #highlight("Field Analogy:", color: rgb("#4338ca")) Analogous to magnetic or gravitational fields; the robot behaves as a *charged particle* influenced by surrounding objects.
    - #highlight("2D (x, y) Grid:", color: rgb("#0f172a")) Map divided into square elements; continuous space extends easily from 2D to 3D.
  ]

  // --- 2. PRIMITIVE POTENTIAL FIELDS ---
  #card(title: "2. Primitive Potential Fields", color: rgb("#0284c7"), icon-name: "grid")[
    - #highlight("5 Fundamental Primitive Fields:", color: rgb("#0369a1"))
    
    #v(2.0pt)
    #image("assets/primitive_pfields.svg", width: 100%)
    
    #v(2.0pt)
    #rounded-table(
      columns: (1fr, 1.4fr),
      inset: 2.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.2pt)[Field]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.2pt)[Application & Function]],
      [*Uniform*], [Constant flow / current across region],
      [*Perpendicular*], [Orient away from walls / corridor centering],
      [*Attraction*], [Target seeking, phototaxis, waypoints],
      [*Repulsion*], [Obstacle avoidance ($180 degree$ push-away)],
      [*Tangential*], [Orbiting obstacles, perimeter tracing, docking]
    )
  ]

  #colbreak()

  // --- 3. MAGNITUDE PROFILES ---
  #card(title: "3. Magnitude Profiles & Decay Functions", color: rgb("#d97706"), icon-name: "trending-down")[
    - #highlight("Magnitude Profile:", color: rgb("#b45309")) Defines how vector magnitude changes over distance $x$ ($d$).
    
    #v(2.0pt)
    #image("assets/magnitude_profiles.svg", width: 100%)
    
    #v(2.0pt)
    - #highlight("1. Constant Magnitude:", color: rgb("#0f172a")) Binary velocity inside range; drops abruptly to 0. *Drawback:* causes jerky oscillations on field perimeter.
    - #highlight("2. Linear Drop-off", color: rgb("#0f172a")) ($y = m x + b$): Response proportional to stimulus (reflexivity). Slows down to prevent overshooting.
    - #highlight("3. Exponential Drop-off", color: rgb("#0f172a")) ($y prop 1/d^2$): Force halves with distance; smooth asymptotic decay eliminates sharp boundaries.
  ]

  // --- 4. COMBINING FIELDS VIA VECTOR SUMMATION ---
  #card(title: "4. Combining Fields & Vector Summation", color: rgb("#7c3aed"), icon-name: "cpu")[
    - #highlight("Emergent Trajectory:", color: rgb("#6d28d9")) Emerges from simultaneous linear summation of attractive & repulsive schemas:
      #align(center)[#badge("Resultant:", color: rgb("#7c3aed")) $bold(V)_("resultant") = sum_(i=1)^n bold(V)_i = bold(V)_("att") + bold(V)_("rep")$]
    
    #v(2.0pt)
    #image("assets/pfield_summation.svg", width: 100%)
  ]

  #colbreak()

  // --- 5. LOCAL MINIMA PROBLEM & SOLUTIONS ---
  #card(title: "5. Local Minima Problem & Solutions", color: rgb("#059669"), icon-name: "alert-triangle")[
    - #highlight("Local Minima:", color: rgb("#047857")) Occurs when opposing forces cancel out ($sum bold(V) = bold(0)$) before goal is reached, trapping robot in deadlock.
    
    #v(2.0pt)
    #image("assets/pfield_local_minima.svg", width: 100%)
    
    #v(2.0pt)
    #rounded-table(
      columns: (1fr, 1.4fr),
      inset: 2.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#d1fae5") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.2pt)[Solution Method]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.2pt)[Mechanism & Trade-off]],
      [*Random Noise*], [Always-active small noise schema to bump robot out of deadlocks.],
      [*Navigation Templates (NaTs)*], [Uses strategic vector to inform redirection (e.g. avoid water on bridge).],
      [*Harmonic Functions*], [Solves Laplace eq ($nabla^2 phi = 0$); *guarantees 0 local minima*. Heavy compute.]
    )
  ]

  // --- 6. EXAM TIP BOX ---
  #tip-box(title: "HIGH-YIELD EXAM DISTINCTION (LECTURE 07)")[
    *Pfield Advantages:* Intuitive continuous representation, compositional C++ behavioral libraries, extensible to 3D.     *Linear vs Exponential Drop-off:* Linear represents reflexivity ($y = m x + b$) but has boundary edge; Exponential provides smooth decay without jerky chattering.     *Harmonic Guarantee:* Only harmonic functions strictly eliminate all local minima traps mathematically.
  ]
]

#pagebreak()

// =========================================================
// PAGE 8: LECTURE 08 — MULTI-ROBOT SYSTEMS & SWARMS
// =========================================================

#header-banner("08", "Multi-Robot Systems, Foraging & Swarm Formations", "MULTI-ROBOT SYSTEMS")

#columns(3, gutter: 8.5pt)[

  // --- 1. MRS FOUNDATIONS ---
  #card(title: "1. Multi-Robot Systems (MRS) Foundations", color: rgb("#4f46e5"), icon-name: "users")[
    - #highlight("Core Motivation:", color: rgb("#4338ca")) Scaling capability, redundancy, and spatial distribution beyond single-robot limits.
    
    #v(2.0pt)
    #rounded-table(
      columns: (1fr, 1fr),
      inset: 2.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0e7ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.2pt)[Why Multiple Robots?]],
      [#text(fill: rgb("#3730a3"), weight: "bold", size: 6.2pt)[Key Challenges & Bottlenecks]],
      [
        - Faster execution & parallelism        - Robustness & fault tolerance        - Distributed sensing/action        - Specialist robot teams
      ],
      [
        - Communication congestion        - Sensor/physical interference        - $N times$ testing & debugging        - Emergent unpredictability
      ]
    )

    #v(2.0pt)
    - #highlight("Coordination Spectrum:", color: rgb("#4338ca"))
      - #badge("Loosely Coordinated", color: rgb("#0284c7")) Mapping, exploration, hazardous cleanup (low comms).
      - #badge("Tightly Coordinated", color: rgb("#7c3aed")) Box pushing, heavy lifting, construction (tight sync).
      - #badge("Task Allocation (MRTA)", color: rgb("#059669")) Formulated as Multi-Traveling Salesman (mTSP).
  ]

  // --- 2. CORE TASK ARCHETYPES ---
  #card(title: "2. Core MRS Task Archetypes", color: rgb("#0284c7"), icon-name: "briefcase")[
    #rounded-table(
      columns: (0.9fr, 1.4fr),
      inset: 2.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.2pt)[Task Archetype]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 6.2pt)[Definition & Robotic Application]],
      [*Foraging*], [Collecting dispersed/clustered items to a depot/boundary.],
      [*Consuming*], [Performing in-place work (assembly, machining, welding).],
      [*Grazing*], [Complete surface coverage (lawn mowing, mine clearing).],
      [*Formations*], [Maintaining geometric structure while moving (flocking).],
      [*Object Transport*], [Joint multi-agent manipulation / cooperative carrying.]
    )
  ]

  #colbreak()

  // --- 3. FORAGING STRATEGIES ---
  #card(title: "3. Foraging Dynamics & Distribution", color: rgb("#d97706"), icon-name: "compass")[
    - #highlight("Foraging Benchmark:", color: rgb("#b45309")) Speed of completion depends heavily on item distribution (evenly spread vs clustered).
    
    #v(2.0pt)
    #image("assets/foraging_strategies.svg", width: 100%)
    
    #v(2.0pt)
    - #highlight("1. Explicit (Fixed Zones):", color: rgb("#0f172a")) Space divided into rigid areas. Optimal for uniform items; robots become idle if items are clustered.
    - #highlight("2. Implicit (Repel Beacons):", color: rgb("#0f172a")) Omni-directional repulsion keeps robots distributed without central control. Minimizes robot contact.
    - #highlight("3. Recruitment Signaling:", color: rgb("#0f172a")) Robot finding a food cluster turns on beacon $\to$ recruits nearby teammates.
  ]

  // --- 4. FORMATIONS & FLOCKING (BOIDS) ---
  #card(title: "4. Swarm Formations & Flocking (Boids)", color: rgb("#7c3aed"), icon-name: "wind")[
    - #highlight("Reynolds 3 Flocking Rules:", color: rgb("#6d28d9")) Emergent cohesion vs collision avoidance balance:
    
    #v(2.0pt)
    #image("assets/flocking_rules.svg", width: 100%)
    
    #v(2.0pt)
    - #highlight("1. Separation:", color: rgb("#dc2626")) Steer to avoid crowding/colliding with local flockmates ($180 degree$ repulsion).
    - #highlight("2. Alignment:", color: rgb("#059669")) Steer towards the *average heading* ($bold(v)_("avg")$) of local flockmates.
    - #highlight("3. Cohesion:", color: rgb("#0284c7")) Steer to move toward the *average centroid* ($bold(p)_("avg")$) of local flockmates.
  ]

  #colbreak()

  // --- 5. MULTI-ROBOT COMMUNICATION ---
  #card(title: "5. Multi-Robot Communication Taxonomy", color: rgb("#059669"), icon-name: "radio")[
    #rounded-table(
      columns: (1fr, 1.4fr),
      inset: 2.2pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#d1fae5") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      align: top + left,
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.2pt)[Dimension]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 6.2pt)[Taxonomy Categories]],
      [*Range*], [None | Near (Local, scalable) | Infinite (Global, heavy)],
      [*Topology*], [Broadcast (all hear) | Addressed | Tree | Graph/Mesh],
      [*Bandwidth*], [High ("free") | Motion-related | Low | Zero]
    )
    
    #v(2.0pt)
    #image("assets/mrs_communication.svg", width: 100%)
    
    #v(2.0pt)
    - #highlight("Explicit Comms:", color: rgb("#0f172a")) Direct message exchange (e.g. drones broadcasting GPS/velocities; "Help, I'm stuck").
    - #highlight("Implicit Comms (Stigmergy):", color: rgb("#0f172a")) Communication through the environment (e.g. sensing markers, seeing a loading bay vacate).
  ]

  // --- 6. EXAM TIP BOX ---
  #tip-box(title: "HIGH-YIELD EXAM DISTINCTION (LECTURE 08)")[
    *Range vs Societal Performance:* Wider communication range is *not* always better; excessive long-range broadcast leads to packet collisions and decreased group performance.     *Stigmergy Principle:* "Communicate only what others cannot easily observe themselves."     *Repel Scheme:* In clustered foraging, implicit repulsion outperforms fixed partitions by avoiding idle zones.
  ]
]
