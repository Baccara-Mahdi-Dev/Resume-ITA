
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Baccara Mahdi"
#let locale-catalog-page-numbering-style = context { "Baccara Mahdi - pagina " + str(here().page()) + " \ " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = ""
#let locale-catalog-language = "it"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.3em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Roboto"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.4pt
#let design-section-titles-font-size = 1.3em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.4cm
#let design-section-titles-vertical-space-below = 0.2cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 9pt
#let design-text-leading = 0.5em
#let design-text-font-family = "Roboto"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Roboto"
#let design-header-name-font-size = 28pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Roboto"
#let design-header-vertical-space-between-name-and-connections = 0.6cm
#let design-header-vertical-space-between-connections-and-first-section = 0.6cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.4cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 3.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1cm
#let design-page-bottom-margin = 1cm
#let design-page-left-margin = 1cm
#let design-page-right-margin = 1cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Baccara Mahdi

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Genova],
  [#box(original-link("mailto:baccara.mahdi@zoho.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)baccara.mahdi\@zoho.com])],
  [#box(original-link("tel:+39-346-950-2475")[#fa-icon("phone", size: 0.9em) #h(0.05cm)346 950 2475])],
  [#box(original-link("https://baccara-dev.netlify.app/")[#fa-icon("link", size: 0.9em) #h(0.05cm)baccara-dev.netlify.app])],
  [#box(original-link("https://linkedin.com/in/mahdi-baccara")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)mahdi-baccara])],
  [#box(original-link("https://github.com/Baccara-Mahdi-Dev")[#fa-icon("github", size: 0.9em) #h(0.05cm)Baccara-Mahdi-Dev])],
)
#connections(connections-list)



== Esperienza Lavorativa


#two-col-entry(
  left-content: [
    #strong[Akronos S.R.L. \(per Siemens\)], Full-stack Developer
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Attività di consulenza presso Siemens, focalizzata su sviluppo full-stack, performance testing e gestione pipeline CI\/CD in ambiente enterprise.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Integrazione e sviluppo di pipeline #strong[CI\/CD] su #strong[GitLab], con gestione di processi di build, test e deploy.],[Sviluppo e miglioramento di test automatici di performance tramite #strong[K6], con analisi dei risultati e generazione di report.],[Utilizzo estensivo del protocollo #strong[NATS] e della relativa client library per sistemi di messaggistica asincrona.],[Refactoring e aggiornamento di componenti #strong[.NET] e #strong[C\#], con adattamento di test e pipeline.],[Creazione di tool personalizzati in #strong[Node.js] per l’elaborazione automatica dei risultati di test.],[Attività di containerizzazione e gestione immagini con #strong[Docker], controllo e validazione di immagini pubbliche e golden.],[Monitoraggio dei test tramite #strong[InfluxDB] e #strong[Grafana], con creazione di dashboard dedicate.],[Introduzione e adattamento di pipeline provenienti da altri sistemi \(es. TFS\) all'infrastruttura #strong[GitLab].],)
  ],
  right-content: [
    Genova, Italia

Giu 2024 – Attuale
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Algowatt S.p.A.], Full-stack Developer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Sviluppo e manutenzione del software con #strong[Angular], #strong[C\# ASP.NET .NET] e #strong[DB Oracle].],[Contribuzione alla documentazione del progetto.],[Creazione di script #strong[CMake] e programmi #strong[C++] per il refactoring di software Matlab, con supporto di ai ChatGPT],[Rimodernizzazione del software C\# .NET per Windows utilizzando #strong[DevExpres] s per creare un'applicazione full stack con #strong[Angular] nel frontend e .NET nel backend.],[Risoluzione dei bug e test del software.],[Esperienza di lavoro con #strong[API].],)
  ],
  right-content: [
    Genova, Italia

Lug 2023 – Giu 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Boris Production], Full-stack Developer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Sviluppo della nuova U.I. e U.X. in #strong[SCSS], #strong[PHP] e #strong[Javascript] di indici.blablive],[Sviluppo e mantenimento di codice #strong[PHP]],[Test e correzione di bug],[Contribuzione alla documentazione],[Sviluppo di nuovi ed aggiornamento di #strong[Wordpress] plugin in PHP e #strong[React]],[Risoluzione ticket],[Esperienza di lavoro con le #strong[API]],[Creazione webapp project management, stack : #strong[Laverl 10], #strong[TailwindCSS], #strong[AlpineJS], #strong[MySQL]],)
  ],
  right-content: [
    Genova, Italia

Lug 2022 – Lug 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[MyPass], Full-stack Developer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Sviluppo e mantenimento di #strong[API RESTFUL] basate sul framework #strong[Larvel] \(#strong[Lumen]\) e #strong[REST] basate sul framework #strong[Restler]],[Contribuzione alla documentazione sulla piattaforma Confluence],[Test e correzione di bug],[Risoluzione ticket su #strong[Trello] e #strong[GitLab]],[Sviluppo di script PHP e query MySql, finalizzati alla gestione di numerosi dati ed eseguiti regolarmente tramite cron jobs],[Esperienza con #strong[GitLab] e pipeline #strong[CI\/CD]],[Sviluppo di dashboard personalizzate e strumenti in #strong[php] e #strong[React]],[Esperienza di lavoro con le API, integrazione con servizi web esterni tra cui XML, REST o JSON],)
  ],
  right-content: [
    Genova, Italia

Ago 2021 – Lug 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[2Way Communication & Consulting], Full-stack Developer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Sviluppo e manutenzione di applicazioni web utilizzando #strong[PHP] e #strong[CodeIgniter] con architettura MVC.],[Utilizzo di #strong[MySQL] per la gestione di database relazionali.],[Implementazione di funzionalità interattive con #strong[AJAX] e #strong[jQuery].],[Creazione e gestione di interfacce utente responsive con #strong[HTML], #strong[CSS] e #strong[Bootstrap 4].],[Redazione di documentazione per l'uso delle web app.],[Test e risoluzione di bug nel software.],[Esperienza nell'uso di #strong[API] per l'integrazione con altri sistemi.],)
  ],
  right-content: [
    Genova, Italia

Gen 2021 – Ago 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Liguria Digitale], Internship
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Sviluppo di pagine web #strong[XML] supportate dal #strong[Bootstrap 4] e applicativi in #strong[Java] , tramite l'utilizzo dell'ambiente di programmazione #strong[Eclipse].],)
  ],
  right-content: [
    Genova, Italia

Lug 2023 – Giu 2024
  ],
)



== Istruzione


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Università di Genova], Informatica

    
  ],
  right-content: [
    Genova, Italia

Set 2020 – Attuale
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[T-Dip]],
  middle-content: [
    #strong[Istituto Istruzione Superiore \"Italo Calvino\"], ITIS - Informatica

    
  ],
  right-content: [
    Genova, Italia

Set 2014 – Giu 2020
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming Languages:] C, C++, C\#, Python, JavaScript, TypeScript, PHP. GO]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Web Development:] HTML5, CSS3, TailwindCSS, Bootstrap 4\/5, Vue.js]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Frontend Frameworks:] React, Angular, JQuery]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Backend Frameworks:] Node.js, NestJS, Laravel, CodeIgniter, .NET, Lumen]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Database Technologies:] MySQL, PostgreSQL, OracleDB, MongoDB, Firebase]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Version Control:] Git, GitLab, GitHub]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[DevOps Tools:] Docker, Kubernetes, Helm, SonarQube, GitLab CI\/CD, K6, Grafana, InfluxDB]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Networking & Systems:] Linux \(Ubuntu, Debian\), Windows \(7, 8, 10\), macOS, Cisco networking \(routers, switches\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Software Development Tools:] Visual Studio Code, Eclipse, NetBeans, PHPStorm, Unity Game Engine, NotePad++, VIM, CygWin, PHPMyAdmin]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Cloud & Virtualization:] Oracle VM VirtualBox, VMware, Hyper-V, Docker]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Agile Methodologies:] Scrum, SAFE Agile, Waterfall]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Project Management Tools:] Jira, Confluence, Polarion, Atlassian Suite]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Data Serialization:] JSON, XML, YAML]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Game Development:] Unity Game Engine]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Security & Code Quality:] Secure coding practices, SonarQube]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Operating Systems:] Linux \(Ubuntu, Debian\), Windows \(7, 8, 10\), macOS]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Soft Skills:] Communication, Teamwork, Problem-solving, Time management]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] #emph[English] \(C1\), #emph[Italian] \(native\)]
)


== Ulteriori Informazioni


#one-col-entry(
  content: [#strong[Patente di guida:] B, AM 

 #emph[Autorizzo il trattamento dei miei dati personali presenti nel CV ai sensi dell’art. 13 d. lgs. 30 giugno 2003 n. 196 - “Codice in materia di protezione dei dati personali” e dell’art. 13 GDPR 679\/16 - “Regolamento europeo sulla protezione dei dati personali”.]]
)


