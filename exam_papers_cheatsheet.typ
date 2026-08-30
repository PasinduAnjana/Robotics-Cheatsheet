
#set page(
  paper: "a4",
  flipped: true,
  fill: rgb("#ffffff"),
  margin: (x: 0.8cm, top: 0.65cm, bottom: 0.55cm),
  header: none,
  footer: context {
    let page_num = counter(page).get().first()
    place(
      bottom + left,
      text(size: 7.0pt, fill: rgb("#94a3b8"), weight: "bold")[
        COGNITIVE ROBOTICS EXAM MASTER CHEAT SHEET (SCS4202 / IS4109)
      ]
    )
    align(right + horizon)[
      #text(size: 7.2pt, fill: rgb("#64748b"), weight: "bold")[
        PAGE #page_num OF 5
      ]
    ]
  }
)

#set text(
  font: ("Ubuntu", "DejaVu Sans", "Liberation Sans", "Noto Sans"),
  size: 6.8pt,
  fill: rgb("#1e293b"),
  spacing: 108%,
  lang: "en"
)

#set par(justify: true, leading: 0.36em)

// Reusable Components
#let header-banner(num, title, category) = {
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    radius: 4pt,
    inset: (x: 8pt, y: 4.5pt),
    stroke: (bottom: 1.5pt + rgb("#e2e8f0")),
    [
      #grid(
        columns: (auto, 1fr, auto),
        align: horizon,
        gutter: 8pt,
        [
          #box(
            fill: rgb("#4f46e5"),
            radius: 3pt,
            inset: (x: 5pt, y: 3pt),
            text(fill: white, weight: "bold", size: 7.5pt)[#num]
          )
        ],
        [
          #text(size: 9.8pt, weight: "bold", fill: rgb("#0f172a"))[#title]
        ],
        [
          #box(
            fill: rgb("#e0e7ff"),
            radius: 3pt,
            inset: (x: 5pt, y: 3pt),
            text(fill: rgb("#3730a3"), weight: "bold", size: 6.8pt)[#category]
          )
        ]
      )
    ]
  )
  v(3pt)
}

#let card(title: "", color: rgb("#4f46e5"), icon-name: "", body) = {
  block(
    width: 100%,
    fill: rgb("#ffffff"),
    radius: 4.0pt,
    inset: 4.8pt,
    stroke: 0.6pt + color.lighten(60%),
    [
      #block(
        width: 100%,
        fill: color.lighten(92%),
        radius: 2.5pt,
        inset: (x: 4.0pt, y: 2.5pt),
        [
          #text(fill: color, weight: "bold", size: 7.2pt)[#title]
        ]
      )
      #v(2.5pt)
      #body
    ]
  )
}

#let badge(content, color: rgb("#4f46e5")) = {
  box(
    fill: color.lighten(88%),
    radius: 2.5pt,
    inset: (x: 3.5pt, y: 1.5pt),
    text(fill: color, weight: "bold", size: 5.8pt)[#content]
  )
}

#let highlight(content, color: rgb("#4f46e5")) = {
  text(fill: color, weight: "bold")[#content]
}

#let tip-box(title: "EXAM KEY POINT", body) = {
  block(
    width: 100%,
    fill: rgb("#fffbeb"),
    radius: 3.5pt,
    inset: 4.5pt,
    stroke: 0.6pt + rgb("#fde68a"),
    [
      #text(fill: rgb("#b45309"), weight: "bold", size: 6.5pt)[💡 #title]      #v(1.2pt)
      #text(size: 6.2pt, fill: rgb("#78350f"))[#body]
    ]
  )
}

#let rounded-table(..args) = {
  table(
    stroke: 0.4pt + rgb("#cbd5e1"),
    ..args
  )
}

// =========================================================
// PAGE 1: EXAM BLUEPRINT & QUESTION 1 (FOUNDATIONS & SENSING)
// =========================================================

#header-banner("Q1", "Question 1: Foundational Concepts, Sensing & Hardware", "FOUNDATIONS & SENSORS")

#columns(3, gutter: 8.5pt)[

  // --- 0. THE 4-QUESTION EXAM BLUEPRINT ---
  #card(title: "The 4-Question Exam Blueprint", color: rgb("#4f46e5"))[
    - #highlight("Predictable Annual Pattern (2021--2025):", color: rgb("#4338ca"))
      - #badge("Question 1", color: rgb("#2563eb")) Foundational Concepts, Sensing & Hardware (Lec 1 & 2)
      - #badge("Question 2", color: rgb("#7c3aed")) Agency, Behaviors, and Schema Theory (Lec 3 & 6)
      - #badge("Question 3", color: rgb("#059669")) Perception, Biological Mechanisms & Behavior Acquisition (Lec 4, 5, 6)
      - #badge("Question 4", color: rgb("#d97706")) Potential Fields & Multi-Robot Task Allocation (Lec 7 & MRS)
  ]

  // --- 1.1 DEFINING ROBOT & ROBOTICS ---
  #card(title: "1.1 Defining Robot and Robotics", color: rgb("#0284c7"))[
    - #highlight("Robot:", color: rgb("#0369a1")) An electromechanical device that is *reprogrammable*, *multifunctional*, and *sensible for the environment*.
    - #highlight("Robotics:", color: rgb("#0369a1")) The study and application of robot technology.
    - #highlight("Telerobotics:", color: rgb("#0369a1")) Robot systems that are operated remotely.
  ]

  // --- 1.2 AUTOMATION VS ROBOTS ---
  #card(title: "1.2 Automation vs. Robots", color: rgb("#059669"))[
    - #highlight("Industrial Automation:", color: rgb("#047857")) Machinery designed for a *specific, single task* (e.g. bottling machine, dishwasher). Always better & more efficient for that single task due to optimal design.
    - #highlight("Robots:", color: rgb("#047857")) Machinery designed to carry out a *variety of tasks* (e.g. pick-and-place arms, mobile robots, CNC).
  ]

  // --- 1.3 ASIMOV'S LAWS & ETHICS ---
  #card(title: "1.3 Asimov's Laws of Robotics & Ethical Scenarios", color: rgb("#dc2626"))[
    - #highlight("Law 1:", color: rgb("#b91c1c")) May not injure a human being or, through inaction, allow a human to come to harm.
    - #highlight("Law 2:", color: rgb("#b91c1c")) Must obey orders from humans, except where conflicting with Law 1.
    - #highlight("Law 3:", color: rgb("#b91c1c")) Must protect own existence, unless conflicting with Laws 1 or 2.
    - #highlight("Law Zero:", color: rgb("#b91c1c")) May not injure humanity, or through inaction allow humanity to come to harm (*overrides Laws 1, 2, 3*).
    
    #v(1.5pt)
    #highlight("Exam Scenarios:", color: rgb("#991b1b"))
    - *Kill President:* *Refuse order.* Law 1 strictly prohibits injuring a human; Law 2 obeys orders except when conflicting with Law 1.
    - *Kill Terrorist with Bomb in Crowd:* *Obey & neutralize terrorist.* Inaction harms crowd (violates Law 1). Conflict resolved by *Law Zero* to protect humanity.
  ]

  #colbreak()

  // --- 1.4 PROPRIOCEPTIVE VS EXTEROCEPTIVE ---
  #card(title: "1.4 Proprioceptive vs. Exteroceptive Sensing", color: rgb("#7c3aed"))[
    - #highlight("Proprioceptive (Internal):", color: rgb("#6d28d9")) Monitors robot's own internal mechanical/electrical states (battery level, joint angle, velocity, orientation).
      - *Examples:* Wheel encoders (odometry), gyroscopes, accelerometers, tachometers.
    - #highlight("Exteroceptive (External):", color: rgb("#6d28d9")) Measures parameters of surrounding environment (obstacles, light, temp, sound).
      - *Examples:* Cameras, LIDAR, sonar/ultrasound, contact whiskers.
    - #highlight("Case Study (Contaminated Zone):", color: rgb("#4c1d95"))
      - *Internal:* Battery voltage, wheel encoders (displacement).
      - *External:* LIDAR/sonar (obstacles), GPS (coordinates).
  ]

  // --- 1.5 ACTIVE VS PASSIVE SENSING ---
  #card(title: "1.5 Active vs. Passive Sensing", color: rgb("#2563eb"))[
    - #highlight("Active Sensors:", color: rgb("#1d4ed8")) Emit physical energy into environment & measure reflection/delay.
      - *Examples:* Sonar (sound waves), LIDAR (laser light), IR proximity (IR pulses).
    - #highlight("Passive Sensors:", color: rgb("#1d4ed8")) Passively capture naturally occurring ambient energy.
      - *Examples:* CCD/CMOS cameras (ambient light), microphones (ambient sound), bump switches (mechanical deflection).
  ]

  // --- 1.6 SPECIALIZED SENSORS ---
  #card(title: "1.6 Deep Dive: Specialized Robotic Sensors", color: rgb("#d97706"))[
    - #highlight("A. Touch / Feelers:", color: rgb("#b45309")) Binary limit switches; robust contact detection.
    - #highlight("B. Inductive vs Capacitive:", color: rgb("#b45309"))
      - *Inductive:* Senses *metallic/conductive objects only* via electromagnetic field oscillation distortion.
      - *Capacitive:* Senses *all materials* (metals, plastics, liquids, glass) via dielectric permittivity shift.
    - #highlight("C. Infrared (IR):", color: rgb("#b45309"))
      - *Reflectance:* Emitter + detector; binary line tracking.
      - *Triangulation:* PSD sensor; calculates distance via geometric angle. Vulnerable to surface color/ambient light.
    - #highlight("D. LIDAR:", color: rgb("#b45309")) Rotating laser pulsed ToF ($d = c t / 2$). Millimeter 2D/3D angular accuracy.
    - #highlight("E. Ultrasonic (Sonar):", color: rgb("#b45309")) Time-of-flight sound pulse:
      #align(center)[#badge("Formula", color: rgb("#d97706")) $d = (v dot t) / 2 quad (v approx 340 "m/s")$]
      - *Weaknesses:* Wide bearing uncertainty ($approx 30^circle$), specular reflection (false negatives), sound latency.
  ]

  #colbreak()

  // --- 1.7 PROGRAMMING METHODOLOGIES ---
  #card(title: "1.7 Robot Programming Methodologies", color: rgb("#059669"))[
    - #highlight("A. Online Programming (Direct):", color: rgb("#047857"))
      - *Teach Pendant / Lead-Through:* Operator manually guides robot to waypoints; robot records coordinates.
      - *Pros:* Simple, intuitive, no CAD model needed.
      - *Cons:* Halts production line during teaching (downtime).
    - #highlight("B. Offline Programming (Software):", color: rgb("#047857"))
      - Programmed in 3D simulator/IDE and uploaded to robot.
      - *Pros:* Zero production downtime, complex logic support.
      - *Cons:* Real-world calibration errors (sim-to-real gap).
  ]

  // --- 1.8 EV3 BLOCK DIAGRAM LOGIC ---
  #card(title: "1.8 EV3 Classroom Block Diagram Logic", color: rgb("#4f46e5"))[
    #highlight("Step 1: Avoid Collision (Binary Bumper):", color: rgb("#4338ca"))
    - Touch Sensor pressed $arrow.r$ Reverse motor + Turn $90^circle$.
    #highlight("Step 2: Avoid Collision (Ultrasonic Range):", color: rgb("#4338ca"))
    - Ultrasonic distance $< 20 "cm"$ $arrow.r$ Steer away.
    #highlight("Step 3a: Line Tracking (Two State Relay):", color: rgb("#4338ca"))
    - Color Sensor on Black ($< 50%$) $arrow.r$ Steer Left; White ($>= 50%$) $arrow.r$ Steer Right (Zig-zag line edge follow).
  ]

  #tip-box(title: "HIGH-YIELD EXAM DISTINCTION (QUESTION 1)")[
    *Inductive vs Capacitive:* Inductive = *Metals only*; Capacitive = *All materials* (dielectric change).     *Ultrasonic vs LIDAR:* Ultrasonic has *wide beam spread* ($30^circle$) and *specular reflections*; LIDAR gives precise millimeter angular sweeps.     *Asimov Law Zero:* Overrides Laws 1, 2, and 3 to protect *humanity as a whole*.
  ]
]

#pagebreak()

// =========================================================
// PAGE 2: QUESTION 2 (AGENCY, BEHAVIORS & SCHEMA THEORY)
// =========================================================

#header-banner("Q2", "Question 2: Agency, Behaviors, and Schema Theory", "AGENCY & SCHEMAS")

#columns(3, gutter: 8.5pt)[

  // --- 2.1 ARCHITECTURAL PARADIGMS ---
  #card(title: "2.1 Robotic Architectural Paradigms", color: rgb("#4f46e5"))[
    #v(1pt)
    #image("assets/exam_paradigms.svg", width: 100%)
    #v(1.5pt)
    - #highlight("1. Hierarchical / Deliberative (SPA):", color: rgb("#1d4ed8"))
      - Sense $arrow.r$ Plan $arrow.r$ Act. Builds monolithic *Global World Model*.
      - *Limitation (Frame Problem):* Slow model updates; fragile to environment changes (e.g. *Shakey* with STRIPS).
    - #highlight("2. Reactive (SA):", color: rgb("#166534"))
      - Sense $arrow.r$ Act directly with *no planning layer*. Vertical decomposition with parallel behaviors.
      - *Subsumption:* Higher layers suppress/inhibit lower layers (Brooks).
    - #highlight("3. Hybrid (Plan-SPA):", color: rgb("#6d28d9"))
      - 3-Layer: Deliberative $arrow.r$ Sequencer $arrow.r$ Reactive execution.

    #v(2.0pt)
    #highlight("Subsumption Architecture (Stay-In-Middle):", color: rgb("#4338ca"))
    #image("assets/exam_subsumption_corridor.svg", width: 100%)
  ]

  #colbreak()

  // --- 2.2 MARR'S 3 LEVELS ---
  #card(title: "2.2 Marr's Three Information-Processing Levels", color: rgb("#0284c7"))[
    - #highlight("Level 1: Computational (Theory):", color: rgb("#0369a1")) *What* is the mathematical goal of the task?
    - #highlight("Level 2: Algorithmic (Representation):", color: rgb("#0369a1")) *How* is it represented (inputs, outputs, decision rules)?
    - #highlight("Level 3: Implementational (Physical):", color: rgb("#0369a1")) *How* is it physically constructed? (neurons vs microcontrollers/motors).
    
    #v(1.5pt)
    #highlight("Case Study: Mosquito vs Search & Rescue Robot:", color: rgb("#0f172a"))
    - *Mosquito:* L1 = Find warm host; L2 = Thermotaxis + Chemotaxis; L3 = Thermal pit organs, biological brain, flight muscles.
    - *S&R Robot:* L1 = Find survivors in rubble; L2 = Vector sum of FLIR thermal + $"CO"_2$ gas centroids; L3 = FLIR sensor, ARM MCU, DC motors.
    - #badge("Note:", color: rgb("#dc2626")) Levels 1 & 2 are abstract; *only Level 3 differentiates biology from robots*.
  ]

  // --- 2.3 BIOLOGICAL MAPPINGS ---
  #card(title: "2.3 Biological Inspiration to Robotic Mappings", color: rgb("#059669"))[
    #rounded-table(
      columns: (1fr, 1fr),
      inset: 2.0pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#ecfdf5") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      [#text(fill: rgb("#065f46"), weight: "bold", size: 5.8pt)[Biological System]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 5.8pt)[Robotic Mapping]],
      [*Bat Echolocation*], [Active ultrasonic distance sensors],
      [*Ant Foraging*], [Ant Colony Optimization (ACO) shared maps],
      [*Bird Flocking*], [Boids (Cohesion, Alignment, Separation) UAVs],
      [*Frog's Tongue Reflex*], [Visual servoing high-speed robotic arm],
      [*Cuttlefish Camouflage*], [Pattern mapping on flexible E-skins]
    )
  ]

  // --- 2.4 BEHAVIOR CLASSIFICATIONS ---
  #card(title: "2.4 Biological Behavior Classifications", color: rgb("#d97706"))[
    - #highlight("1. Reflexive Behavior:", color: rgb("#b45309")) Pure stimulus-response ($S arrow.r R$) with no memory.
      - *Taxes:* Orienting relative to stimulus (e.g. phototaxis to light).
      - *Fixed-Action Pattern (FAP):* Response continues much longer than stimulus (e.g. web spinning, courtship dance).
    - #highlight("2. Reactive Behavior:", color: rgb("#b45309")) Learned through repetition; automatic "muscle memory" (e.g. bike riding).
    - #highlight("3. Conscious Behavior:", color: rgb("#b45309")) Deliberative, highly cognitive (e.g. path planning, assembly).
  ]

  #colbreak()

  // --- 2.5 SCHEMA THEORY & OOP ---
  #card(title: "2.5 Schema Theory in OOP Robotics", color: rgb("#7c3aed"))[
    - #highlight("Behavioral Schema:", color: rgb("#6d28d9")) Modeled in OOP as a class with exactly one *Perceptual Schema* and one *Motor Schema*.
      - *Perceptual Schema:* Extracts percepts from raw sensors.
      - *Motor Schema:* Generates action vector from percept.
      - *Schema Instantiation (SI):* Parameterizing generic class template with runtime properties (speed, color).
    
    #v(1.5pt)
    #highlight("Mathematical S-R Schema Notation:", color: rgb("#4c1d95"))
    #align(center)[#badge("Notation", color: rgb("#7c3aed")) $ {B : S arrow.r R} quad "or" quad B[S] = R $]

    #v(1.5pt)
    #image("assets/exam_turtle_schemas.svg", width: 100%)

    #v(1.5pt)
    #highlight("Case Study: Baby Turtle Nest Hatching:", color: rgb("#0f172a"))
    - *B1 (Dig Upward):*
      - $S$: Warm sand temp gradient + gravity pull (negative geotaxis).
      - $R$: Upward flipper shoveling.
      - $B_1[S_("temp, gravity")] = R_("dig_up")$.
    - *B2 (Crawl to Ocean):*
      - $S$: Bright horizon light + wave acoustic thuds.
      - $R$: Crawling thrust towards ocean.
      - $B_2[S_("light, acoustics")] = R_("crawl_to_ocean")$.
  ]

  #tip-box(title: "EXAM FORMULA NOTATION (QUESTION 2)")[
    *Schema Notation:* Always write both $B[S] = R$ and $\{B : S arrow.r R\}$.     *Marr's 3 Levels:* Level 1 = Goal/Theory; Level 2 = Rules/Transforms; Level 3 = Hardware implementation.
  ]
]

#pagebreak()

// =========================================================
// PAGE 3: QUESTION 3 (PERCEPTION, IRM & PSEUDOCODE)
// =========================================================

#header-banner("Q3", "Question 3: Perception, Biological Mechanisms & Behavior Acquisition", "PERCEPTION & IRM")

#columns(3, gutter: 8.5pt)[

  // --- 3.1 ACTION-PERCEPTION CYCLE ---
  #card(title: "3.1 Action-Perception Cycle & Affordances", color: rgb("#4f46e5"))[
    - #highlight("Action-Perception Cycle:", color: rgb("#4338ca")) Cyclic feedback loop: Action modifies environment $arrow.r$ Sensed by agent $arrow.r$ Determines next Action.
    - #highlight("Gibson's Ecological Approach:", color: rgb("#4338ca")) Perception is direct, active, and environmental (not passive pixel reconstruction).
    - #highlight("Affordances:", color: rgb("#4338ca")) Actionable properties directly perceivable between environment and agent (e.g. a chair affords "sitting", a door handle affords "pulling").
  ]

  // --- 3.2 FOUR BEHAVIOR ACQUISITION METHODS ---
  #card(title: "3.2 Four Methods of Acquiring Behaviors", color: rgb("#0284c7"))[
    #rounded-table(
      columns: (1fr, 1.2fr),
      inset: 2.0pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#e0f2fe") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 5.8pt)[Acquisition Method]],
      [#text(fill: rgb("#0369a1"), weight: "bold", size: 5.8pt)[Operating Principle]],
      [*1. Ethologically Guided*], [Hard-coding innate animal behaviors into robot schemas.],
      [*2. Supervised Learning*], [Training on expert human operator labeled datasets.],
      [*3. Reinforcement Learning*], [Trial-and-error optimization via reward/penalty ($Q$-learning).],
      [*4. Imitation Learning*], [Direct sensorimotor mapping by observing demonstrations.]
    )
  ]

  // --- 3.3 & 3.4 IRM & ARCHITECTURES ---
  #card(title: "3.3 & 3.4 Innate Releasing Mechanisms (IRM)", color: rgb("#7c3aed"))[
    - #highlight("IRM Definition:", color: rgb("#6d28d9")) Neural biological circuit that acts as a gate/switch: activates a *Fixed-Action Pattern (FAP)* upon detecting a specific *Sign Stimulus / Releaser*.
    - #highlight("Architectures:", color: rgb("#6d28d9"))
      - *Combinatorial (Boolean):* Logical gating ($A "AND" B$).
      - *Sequential (Chain):* Precondition of behavior $N$ satisfied by completion of behavior $N-1$.
  ]

  #colbreak()

  // --- PSEUDOCODE SCENARIO A: ARCTIC TERN ---
  #card(title: "Scenario A: Arctic Tern Beak Pecking", color: rgb("#d97706"))[
    - #highlight("Context:", color: rgb("#b45309")) Chick pecks red spot on parent beak to trigger feeding.
    - #highlight("IRM Latch:", color: rgb("#b45309")) Releaser = Visual Red Spot moving. Action = Feed chick.
    
    #v(1.5pt)
    #block(
      width: 100%,
      fill: rgb("#0f172a"),
      radius: 3pt,
      inset: 4pt,
      text(fill: rgb("#f8fafc"), font: ("Ubuntu", "DejaVu Sans"), size: 5.2pt)[
```cpp
enum Releaser { PRESENT, NOT_PRESENT };

void ParentBirdControlLoop() {
  while (TRUE) {
    if (DetectChickPeckOnRedSpot() == PRESENT) {
      RegurgitateFood();
      FeedChick();
    } else {
      MaintainNest();
    }
  }
}
```
      ]
    )
  ]

  // --- PSEUDOCODE SCENARIO B: HONEYBEE WAGGLE ---
  #card(title: "Scenario B: Honeybee Waggle Dance", color: rgb("#059669"))[
    - #highlight("Context:", color: rgb("#047857")) Dance angle = food direction relative to sun; waggle duration = distance.
    - #highlight("Compound Releasers:", color: rgb("#047857")) Energy OK AND Weather OK AND Dance decoded.
    
    #v(1.5pt)
    #block(
      width: 100%,
      fill: rgb("#0f172a"),
      radius: 3pt,
      inset: 4pt,
      text(fill: rgb("#f8fafc"), font: ("Ubuntu", "DejaVu Sans"), size: 5.2pt)[
```cpp
void ForagerBeeControlLoop() {
  while (TRUE) {
    if (IsEnergySufficient() == PRESENT) {
      if (IsWeatherSafe() == PRESENT) {
        if (DecodeDanceAngle(&ang, &dist)) {
          FlyToTarget(ang, dist);
          ExtractNectar();
          ReturnToHive();
        } else { SearchRandomly(); }
      } else { StayInHive(); }
    } else { RestInHive(); }
  }
}
```
      ]
    )
  ]

  #colbreak()

  // --- PSEUDOCODE SCENARIO C: ANT COLONY TRAIL ---
  #card(title: "Scenario C: Ant Colony Trail Following", color: rgb("#dc2626"))[
    - #highlight("Context:", color: rgb("#b91c1c")) Scout leaves pheromones; followers follow if energy OK, no alarm danger, and trail strength $>= "THRESHOLD"$.
    
    #v(1.5pt)
    #block(
      width: 100%,
      fill: rgb("#0f172a"),
      radius: 3pt,
      inset: 4pt,
      text(fill: rgb("#f8fafc"), font: ("Ubuntu", "DejaVu Sans"), size: 5.2pt)[
```cpp
void FollowerAntControlLoop() {
  while (TRUE) {
    if (IsEnergySufficient() == PRESENT) {
      if (IsDangerSignal() == NOT_PRESENT) {
        if (Pheromone() == PRESENT && 
            GetStrength() >= THRESHOLD) {
          FollowTrailToFood();
          BringFood();
          ReinforceTrail();
        } else { SearchRandomly(); }
      } else { StayInNest(); }
    } else { StayInNest(); }
  }
}
```
      ]
    )
  ]

  #tip-box(title: "EXAM PSEUDOCODE RULES (QUESTION 3)")[
    *Nested IF Gates:* Always structure IRM pseudocode using explicit nested `if (Releaser == PRESENT)` blocks to reflect biological threshold gating.     *Compound Releasers:* Check Energy $	o$ Environmental Danger $	o$ Signal Stimulus.
  ]
]

#pagebreak()

// =========================================================
// PAGE 4: QUESTION 4 (POTENTIAL FIELDS & MRS FORAGING)
// =========================================================

#header-banner("Q4", "Question 4: Behavioral Coordination & Multi-Robot Systems", "PFIELDS & MRS")

#columns(3, gutter: 8.5pt)[

  // --- 4.1 COOPERATING VS COMPETING ---
  #card(title: "4.1 Cooperating vs. Competing Behaviors", color: rgb("#4f46e5"))[
    - #highlight("Concurrent Competing (Arbitration):", color: rgb("#4338ca")) Winner-take-all behavior selection. Lower-priority behaviors are suppressed by higher layers (e.g. *Subsumption*).
    - #highlight("Concurrent Cooperating (Blending):", color: rgb("#4338ca")) Outputs of multiple behaviors are mathematically combined into a smooth action vector (e.g. *Motor Schema Potential Fields*).
  ]

  // --- 4.2 POTENTIAL FIELDS METHODOLOGY ---
  #card(title: "4.2 Potential Fields (PFields) Methodology", color: rgb("#0284c7"))[
    - #highlight("Concept:", color: rgb("#0369a1")) Robot modeled as a charged particle. Obstacles are *repulsive sources*; goals are *attractive sinks*.
    - #highlight("Vector Summation ($Sigma$):", color: rgb("#0369a1")) Each motor schema outputs a vector $(m, d)$; final force is $Sigma$:
      #align(center)[#badge("Resultant Force", color: rgb("#0284c7")) $bold(V)_("resultant") = bold(V)_("attractive") + bold(V)_("repulsive")$]
    #v(1.5pt)
    #image("assets/pfield_summation.svg", width: 100%)
  ]

  #colbreak()

  // --- 4.3 MAGNITUDE PROFILES & MATH ---
  #card(title: "4.3 PField Magnitude Profiles & Math Formulations", color: rgb("#7c3aed"))[
    - #highlight("1. Constant Profile:", color: rgb("#6d28d9")) Constant velocity inside $D$, zero outside. *Drawback:* Jerky boundary oscillations.
    - #highlight("2. Linear Drop-Off Profile ($y = m x + b$):", color: rgb("#6d28d9"))
      - #badge("Repulsive Field (Away from Obstacle):", color: rgb("#dc2626"))
        $ V_("dir") = -180^circle, quad V_("mag") = cases((D - d)/D &"for" d <= D, 0 &"for" d > D) $
      - #badge("Attractive Field (Towards Goal):", color: rgb("#059669"))
        $ V_("dir") = "angle to goal", quad V_("mag") = cases(1 &"for" d > D, d/D &"for" d <= D) $
    - #highlight("3. Exponential Drop-Off Profile:", color: rgb("#6d28d9"))
      #align(center)[#badge("Exponential", color: rgb("#7c3aed")) $V_("mag") = e^(-k dot d^2)$]
  ]

  // --- 4.4 LOCAL MINIMA & 3 SOLUTIONS ---
  #card(title: "4.4 The Local Minima Problem & Solutions", color: rgb("#dc2626"))[
    - #highlight("Deadlock Cause:", color: rgb("#b91c1c")) Equal magnitude, opposite direction vectors sum to zero ($bold(V)_"res" = bold(0)$).
    - #highlight("Three Key Solutions:", color: rgb("#991b1b"))
      - *1. Random Noise / Perturbation:* Heuristic random push; simple but sub-optimal.
      - *2. Harmonic Functions ($nabla^2 phi = 0$):* Mathematically guarantees no local minima; computationally heavy.
      - *3. Navigation Templates (NaTs) / Informed Redirection:* Feeds strategic goal direction to route around obstacle.

    #v(2.0pt)
    #image("assets/exam_local_minima_grid.svg", width: 100%)
  ]

  #colbreak()

  // --- 4.5 MRS FORAGING STRATEGIES TABLE ---
  #card(title: "4.5 Multi-Robot Systems (MRS) Foraging Strategies", color: rgb("#059669"))[
    #rounded-table(
      columns: (0.9fr, 1.1fr),
      inset: 2.0pt,
      stroke: none,
      fill: (_, row) => if row == 0 { rgb("#ecfdf5") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#f1f5f9") },
      [#text(fill: rgb("#065f46"), weight: "bold", size: 5.5pt)[Foraging Strategy]],
      [#text(fill: rgb("#065f46"), weight: "bold", size: 5.5pt)[Principle & Trade-offs]],
      [*Random Locomotion*], [Wander randomly. Simple, zero comms. Slowest, collision crashes on scale.],
      [*Explicit (Fixed)*], [Equal spatial division. Complete coverage, no crosstalk. Inefficient if clustered.],
      [*Implicit (Repel)*], [Omnidirectional repel beacons. Great for clusters, no GPS needed.],
      [*Beacon Recruitment*], [Stationary beacon upon food discovery. Fastest for clustered items.]
    )
  ]

  #tip-box(title: "HIGH-YIELD EXAM FORMULAS (QUESTION 4)")[
    *Repulsive Linear Profile:* $V_("mag") = (D - d)/D$ with direction $-180^circle$.     *Attractive Linear Profile:* $V_("mag") = d/D$ (slows down to prevent overshoot).     *Local Minima Trap:* Occurs when $bold(V)_("att") + bold(V)_("rep") = bold(0)$.
  ]
]

#pagebreak()

// =========================================================
// PAGE 5: STEP-BY-STEP MATHEMATICAL GUIDE (MRS AUCTIONS 2022-2025)
// =========================================================

#header-banner("MATH", "Step-by-Step Mathematical Guide: MRS Task Allocation Auctions", "AUCTION MATRICES")

#columns(2, gutter: 9pt)[

  // --- SCENARIO 1: ROBOTICS 2022 ---
  #card(title: "Scenario 1: Robotics 2022 (Ukrainian Core Recovery)", color: rgb("#2563eb"))[
    - #highlight("Given Data:", color: rgb("#1d4ed8")) Rewards: $X = 120, Y = 180, Z = 200$. Transitions: $X <-> Y = 60, Y <-> Z = 50$. Initial Dist: A to $X=50, Y=100, Z=110$; B to $X=70, Y=60, Z=75$; K to $X=200, Y=200, Z=200$. K sells $Y+Z$ data for 20.
    
    #v(1.0pt)
    #rounded-table(
      columns: (0.8fr, 0.4fr, 0.4fr, 0.4fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.6fr, 0.6fr),
      inset: 1.5pt,
      stroke: 0.3pt + rgb("#cbd5e1"),
      fill: (_, row) => if row == 0 { rgb("#dbeafe") } else { rgb("#ffffff") },
      align: center,
      [#text(weight:"bold", size: 5.0pt)[Robot]], [X], [Y], [Z], [X+Y], [Y+X], [Y+Z], [Z+Y], [X+Y+Z], [Z+Y+X],
      [*A*], [50], [100], [110], [110], [160], [150], [160], [160], [220],
      [*B*], [70], [60], [75], [130], [120], [110], [125], [180], [185],
      [*K*], [200], [200], [200], [260], [260], [250], [250], [310], [310]
    )
    #v(1.5pt)
    - #highlight("Step (ii) Allocation & System Cost:", color: rgb("#1d4ed8"))
      - *Opt 1:* A wins $X$ (Cost 50), B wins $Y+Z$ (Cost 110, pays 20 to K). $"SC" = 50 + 110 = bold(160)$.
      - *Opt 2:* A wins $X+Y$ (Cost 110), B wins $Z$ (Cost 75). $"SC" = 110 + 75 = 185$.
      - *Allocation:* *Robot A $arrow.r X$, Robot B $arrow.r Y+Z$, Final System Cost = 160.*
    - #highlight("Step (iii) Net Profit Calculation:", color: rgb("#1d4ed8"))
      - *Robot A:* $"Profit" = 120 - 50 = bold(70)$.
      - *Robot B:* $"Profit" = 180 + 200 - 110 - 20 = bold(250)$.
      - *Robot K:* $"Profit" = bold(20)$ (sells data).
      - *Verification:* $"System Profit" = 500 - 160 = bold(340) = 70 + 250 + 20$.
  ]

  // --- SCENARIO 2: ROBOTICS 2023 ---
  #card(title: "Scenario 2: Robotics 2023 (Landslide Deployment)", color: rgb("#059669"))[
    - #highlight("Given Data:", color: rgb("#047857")) Rewards: $X = 120, Y = 180, Z = 200$. Transitions: $X <-> Y = 60, Y <-> Z = 50$. Initial Dist: A to $X=50, Y=100, Z=110$; B to $X=110, Y=75, Z=60$; K to $X=200, Y=200, Z=200$. K sells $Y+Z$ for 20.
    
    #v(1.0pt)
    #rounded-table(
      columns: (0.8fr, 0.4fr, 0.4fr, 0.4fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.6fr, 0.6fr),
      inset: 1.5pt,
      stroke: 0.3pt + rgb("#cbd5e1"),
      fill: (_, row) => if row == 0 { rgb("#d1fae5") } else { rgb("#ffffff") },
      align: center,
      [#text(weight:"bold", size: 5.0pt)[Robot]], [X], [Y], [Z], [X+Y], [Y+X], [Y+Z], [Z+Y], [X+Y+Z], [Z+Y+X],
      [*A*], [50], [100], [110], [110], [160], [150], [160], [160], [220],
      [*B*], [110], [75], [60], [170], [135], [125], [110], [185], [170],
      [*K*], [200], [200], [200], [260], [260], [250], [250], [310], [310]
    )
    #v(1.5pt)
    - #highlight("Step (ii) Allocation & System Cost:", color: rgb("#047857"))
      - *Opt 1:* A wins $X$ (Cost 50), B wins $Z+Y$ (Cost 110, pays 20 to K). $"SC" = 50 + 110 = bold(160)$.
      - *Opt 2:* A wins $X+Y$ (Cost 110), B wins $Z$ (Cost 60). $"SC" = 110 + 60 = 170$.
      - *Allocation:* *Robot A $arrow.r X$, Robot B $arrow.r Z+Y$, Final System Cost = 160.*
    - #highlight("Step (iii) Net Profit Calculation:", color: rgb("#047857"))
      - *Robot A:* $"Profit" = 120 - 50 = bold(70)$.
      - *Robot B:* $"Profit" = 180 + 200 - 110 - 20 = bold(250)$.
      - *Robot K:* $"Profit" = bold(20)$. Verification: $"Team Profit" = 500 - 160 = bold(340)$.
  ]

  #colbreak()

  // --- SCENARIO 3: ROBOTICS 2024 ---
  #card(title: "Scenario 3: Robotics 2024 (Storm-hit Backup Mission)", color: rgb("#d97706"))[
    - #highlight("Given Data:", color: rgb("#b45309")) Rewards: $X = 150, Y = 200, Z = 300$. Transitions: $X <-> Y = 30, Y <-> Z = 40$. Dist: A: $50, 100, 150$; B: $150, 50, 20$; K: $350, 320, 310$. K sells $X+Y$ for 60, $Y+Z$ for 50.
    
    #v(1.0pt)
    #rounded-table(
      columns: (0.8fr, 0.4fr, 0.4fr, 0.4fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.6fr, 0.6fr),
      inset: 1.5pt,
      stroke: 0.3pt + rgb("#cbd5e1"),
      fill: (_, row) => if row == 0 { rgb("#fef3c7") } else { rgb("#ffffff") },
      align: center,
      [#text(weight:"bold", size: 5.0pt)[Robot]], [X], [Y], [Z], [X+Y], [Y+X], [Y+Z], [Z+Y], [X+Y+Z], [Z+Y+X],
      [*A*], [50], [100], [150], [80], [130], [140], [190], [120], [220],
      [*B*], [150], [50], [20], [180], [80], [90], [60], [220], [90],
      [*K*], [350], [320], [310], [380], [350], [360], [350], [420], [380]
    )
    #v(1.5pt)
    - #highlight("Step (ii) Allocation & System Cost:", color: rgb("#b45309"))
      - *Opt 1:* A wins $X$ (50), B wins $Y+Z$ ($50+40=90$, pays 50). $"SC" = 50 + 90 = 140$.
      - *Opt 2:* A wins $X+Y$ ($50+30=80$, pays 60), B wins $Z$ (20). $"SC" = 80 + 20 = bold(100)$.
      - *Allocation:* *Robot A $arrow.r X+Y$ (Cost 80, pays 60), Robot B $arrow.r Z$ (Cost 20), System Cost = 100.*
    - #highlight("Step (iii) Net Profit Calculation:", color: rgb("#b45309"))
      - *Robot A:* $"Profit" = 150 + 200 - 80 - 60 = bold(210)$.
      - *Robot B:* $"Profit" = 300 - 20 = bold(280)$.
      - *Robot K:* $"Profit" = bold(60)$. Verification: $"Team Profit" = 650 - 100 = bold(550)$.
  ]

  // --- SCENARIO 4: ROBOTICS 2025 ---
  #card(title: "Scenario 4: Robotics 2025 (Interstellar Probe 3i/Atlas)", color: rgb("#7c3aed"))[
    - #highlight("Given Data:", color: rgb("#6d28d9")) Rewards: $X = 150, Y = 150, Z = 150$. Transitions: $X <-> Y = 50, Y <-> Z = 40$. Dist: A: $50, 100, 120$; B: $80, 40, 100$; K: $300, 200, 140$. K sells 0 data.
    
    #v(1.0pt)
    #rounded-table(
      columns: (0.8fr, 0.4fr, 0.4fr, 0.4fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.6fr, 0.6fr),
      inset: 1.5pt,
      stroke: 0.3pt + rgb("#cbd5e1"),
      fill: (_, row) => if row == 0 { rgb("#f3e8ff") } else { rgb("#ffffff") },
      align: center,
      [#text(weight:"bold", size: 5.0pt)[Robot]], [X], [Y], [Z], [X+Y], [Y+X], [Y+Z], [Z+Y], [X+Y+Z], [Z+Y+X],
      [*A*], [50], [100], [120], [100], [150], [140], [160], [140], [210],
      [*B*], [80], [40], [100], [130], [90], [80], [140], [170], [190],
      [*K*], [300], [200], [140], [350], [250], [240], [180], [390], [230]
    )
    #v(1.5pt)
    - #highlight("Step (ii) Allocation & System Cost:", color: rgb("#6d28d9"))
      - *Opt 1:* A wins $X$ (Cost 50), B wins $Y+Z$ (Cost $40+40=80$). $"SC" = 50 + 80 = bold(130)$.
      - *Opt 2:* A wins $X+Y$ (Cost 100), B wins $Z$ (Cost 100). $"SC" = 100 + 100 = 200$.
      - *Allocation:* *Robot A $arrow.r X$, Robot B $arrow.r Y+Z$, Final System Cost = 130.*
    - #highlight("Step (iii) Net Profit Calculation:", color: rgb("#6d28d9"))
      - *Robot A:* $"Profit" = 150 - 50 = bold(100)$.
      - *Robot B:* $"Profit" = 150 + 150 - 80 = bold(220)$.
      - *Robot K:* $"Profit" = bold(0)$. Verification: $"Team Profit" = 450 - 130 = bold(320)$.
  ]
]
