\version "2.18.2"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  http://lsr.di.unimi.it/LSR/Item?id=445

%LSR by Jay Anderson.
%modyfied by Simon Albrecht on March 2014.
%=> http://lilypond.1069038.n5.nabble.com/LSR-445-error-td160662.html

#(define (octave-up m t)
 (let* ((octave (1- t))
      (new-note (ly:music-deep-copy m))
      (new-pitch (ly:make-pitch
        octave
        (ly:pitch-notename (ly:music-property m 'pitch))
        (ly:pitch-alteration (ly:music-property m 'pitch)))))
  (set! (ly:music-property new-note 'pitch) new-pitch)
  new-note))

#(define (octavize-chord elements t)
 (cond ((null? elements) elements)
     ((eq? (ly:music-property (car elements) 'name) 'NoteEvent)
       (cons (car elements)
             (cons (octave-up (car elements) t)
                   (octavize-chord (cdr elements) t))))
     (else (cons (car elements) (octavize-chord (cdr elements ) t)))))

#(define (octavize music t)
 (if (eq? (ly:music-property music 'name) 'EventChord)
       (ly:music-set-property! music 'elements (octavize-chord
(ly:music-property music 'elements) t)))
 music)

makeOctaves = #(define-music-function (parser location arg mus) (integer? ly:music?)
 (music-map (lambda (x) (octavize x arg)) (event-chord-wrap! mus)))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
  title = "王菲 － 開到荼蘼"
  subtitle = "For female voice and piano accompaniment"
  arranger = "Arranged by Benson"
}

lower-prelude = \relative c {
  \time 6/8
  \key f \minor
  \partial 8. r8.
  e8 g' c, bes g' c, f, aes' c, aes aes' c, g bes' e, des bes' e, aes, aes' f c aes' f
  bes,, des' g, f des' g, c, c' aes f c' aes c, e' bes g e' bes f f' c aes f' des
  e,8 g' c, bes g' c, f, aes' c, aes aes' c, g bes' ees, des bes' ees, aes, aes' ees c aes' ees
  des, f' bes, aes f' bes, ees, ees' c aes ees' c ees, ees' des g, ees' des aes, c' ees, fes des' ees,
  aes, c' ees, fes des' ees, aes, c' ees, c g' bes e4. r4.
  bes,8 c' des f des c bes c des f des c
}

upper-prelude = \relative c'' {
  \time 6/8
  \key f \minor
  \partial 8. c8.
  c16 des b c ees des c des b c fis g c, des b c ees des c des b c aes' f
  e f e dis e g bes c bes a bes des c des c b c g aes bes aes g aes e
  f g f e f c des ees des c des b c des c b c g aes bes aes g aes f
  e g bes des e g bes des c bes aes g bes c aes g aes f e g f e f des
  c des b c ees des c des b c fis g c, des b c ees des c des b c aes' f
  ees f ees d ees g bes c bes a es f' ees f ees d ees b c des c b c g
  aes bes aes g aes e f g f e f des c des bes g aes bes c des ees f g aes
  g aes f ees f des c des bes c f, g 
  aes bes aes g aes a bes c bes c f, g aes bes aes g aes a bes c bes c f, g
  aes bes aes g aes bes c-"rit." des c
  \set Score.tempoHideNote = ##t
  \tempo 4. = 84
  b c des
  \tempo 4. = 78
  c des c
  \tempo 4. = 69
  b c des
  \tempo 4. = 60
  c des c
  \tempo 4. = 48
  bes a f
  \set Score.tempoHideNote = ##f
  \tempo 4. = 52
  bes8 r r r4.
  R2.
}

lower-melodya = \relative c' {
  \key ais \minor
  ais8 bis cis eis cis ais
  gisis bis cis eis cis bis
  gis bis cis eis cis gis
  fisis bis cis eis cis ais
  fis ais cis eis dis cis
  fis, gisis bis dis cis bis
  eis, fis ais bis cis dis
  eis, gisis cis bis ais gisis

  ais8 bis cis eis cis ais
  gisis bis cis eis cis bis
  gis bis cis eis cis gis
  fisis bis cis eis cis ais
  dis, ais' cis fis cis ais
  cis, ais' cis fis cis ais
  bis, fis' ais dis ais fis
  eis, bis' eis fisis gisis bis
}

lower-melodya-dash = \relative c' {
  ais,8 bis' cis eis cis ais
  gisis, bis' cis eis cis bis
  gis, bis' cis eis cis gis
  fisis, bis' cis eis cis ais
  fis, ais' cis eis dis cis
  fis,, gisis' bis dis cis bis
  eis,, fis' ais bis cis dis
  eis,, gisis' cis bis ais gisis

  ais,8 bis' cis eis cis ais
  gisis, bis' cis eis cis bis
  gis, bis' cis eis cis gis
  fisis, bis' cis eis cis ais
  dis,, ais'' cis fis cis ais
  cis,, ais'' cis fis cis ais
  bis,, fis'' ais dis ais fis
  eis,, bis'' eis fisis gisis bis
}

upper-melodya = \relative c''' {
  \clef treble
  r4. <bis cis eis> r q r q r <bis cis eis>16 eis, gis fisis fis eis
  cis4 gis'16 ais <gis cis eis>4.
  r8 dis eis <dis gisis> ais'16 eis gisis ais
  bis gisis fis dis bis ais gisis4 <eis dis'>8
  <gisis eis'>4 <ais fisis'>8 <bis gisis'>4.

  r4. <bis' cis eis> r q r q r <bis cis eis>16 eis, gis fisis fis eis
  cis4 gis'16 ais <gis cis eis>4.
  r8 dis eis <dis gisis> ais'16 eis gisis ais
  bis gisis fis dis bis ais gisis4 <fis eis'>8
  <fisis dis' >4 <gis cis>8 << { bis16 cis cisis dis disis eis } \\ { <gisis, bis>4. } >>
}

compound-meter-to-simple-meter-mark = \tempo \markup {
  \concat {
    (
    \smaller \general-align #Y #DOWN \note #"8." #1
    "="
    \smaller \general-align #Y #DOWN \note #"4" #1
    )
  }
}

simple-meter-to-compound-meter-mark = \tempo \markup {
  \concat {
    (
    \smaller \general-align #Y #DOWN \note #"4" #1
    "="
    \smaller \general-align #Y #DOWN \note #"8." #1
    )
  }
}

upper-bridgea-print = \relative c'' {
  fis16 ais, fis eis' gis, eis disis' gis, disis dis' ais dis,
  \time 3/4
  \compound-meter-to-simple-meter-mark
  \tuplet 3/2 4 { d'8 ais d, cis' a cis, bis' <dis, eis> bis }
}

upper-bridgea-midi = \relative c'' {
  fis16 ais, fis eis' gis, eis disis' gis, disis dis' ais dis,
  \time 3/4
  \tempo 4 = 104
  \tuplet 3/2 4 { d'8 ais d, cis' a cis, bis' <dis, eis> bis }
}

lower-bridgea-print = \relative c, {
  dis8. eis fis fisis
  \time 3/4
  eis4 fisis gisis
}

lower-bridgea-midi = \relative c, {
  dis8. eis fis fisis
  \time 3/4
  \tempo 4 = 104
  eis4 fisis gisis
}

upper-bridgea-dash = \relative c'' {
  \tuplet 3/2 4 {
    <fisis disis'>8 bis fisis <aisis eis'> cis aisis <fisis cis' fis> ais cis
  }
}

lower-bridgea-dash = \relative c, {
  <eis eis'>4 <fisis fisis'> <gisis gisis'>
}

upper-melodyb = \relative c' {
  \tuplet 3/2 4 { r4 bis8 <cis eis>4 bis'8 <cis eis>4 cis'8
  bis dis, bis ais' dis, bis bis' dis, bis gis' dis gis,
  r4 bis,8 <cis eis>4 bis'8 <cis eis>4 cis'8
  bis dis, bis ais' dis, bis gis' bis, gis fis' bis, fis
  r4 bis,8 <cis eis>4 bis'8 <cis eis>4 cis'8
  bis dis, bis ais' dis, bis bis' dis, bis gis' dis gis,
  <ais cis> eis cis <eis gisis> dis bis <fis' ais> cis <fis ais>
  <bis, eis gisis> dis fis gisis bis dis
  <bis eis gisis> dis fis gisis bis dis
  }
}

lower-melodyb = \relative c {
  ais2~ \tuplet 3/2 4 { ais4 ais8 } gis1
  fis2~ \tuplet 3/2 4 { fis4 fis8 } eis1
  ais2~ \tuplet 3/2 4 { ais4 ais8 } gis1
  fis2~ \tuplet 3/2 4 { fis4 disis8 } eis4 <fisis fisis'> <gisis gisis'> <eis eis'>
}

upper-melodyc = \relative c'' {
  \tuplet 3/2 4 { <eis bis' eis>4 bis,8 <cis eis>4 bis'8 <cis eis>4 cis'8 }
  << { ais2. } \\ { <bis, dis>4 <b dis> <ais cis> } >> \tuplet 3/2 4 { dis8 eis bis' }
  \tuplet 3/2 4 { <cis, eis cis'>4 cis,8 <eis fisis>4 cis'8 <eis fisis>4 cis'8 }
  << {cis2. } \\ { <fis, ais>4 <d gis> <cis eis> } >> \tuplet 3/2 4 { fis8 gisis bis }
  \tuplet 3/2 4 { <eis, ais bis eis>4 bis,8 <cis eis>4 bis'8 <cis eis>4 cis'8 }
  << { ais2. } \\ { <bis, dis>4 <b dis> <ais cis> } >> \tuplet 3/2 4 { dis8 eis bis' }
  \tuplet 3/2 4 { <cis, eis cis'>4 cis,8 <dis fis>4 cis'8 } <dis fis>4
  \tuplet 3/2 4 { <gisis, eis'>8 cis <ais fisis'>8 cis dis fisis <dis eis gisis>4 <dis fisis gisis bis>8~ } q4
}

lower-melodyc = \relative c {
  \tuplet 3/2 4 { <ais, ais'>4 disis'8 eis4 gisis8 } ais4
  <bis,, bis'> <b b'> <ais ais'> <gisis gisis'>
  \tuplet 3/2 4 { <fisis fisis'>4 ais'8 cis4 eis8 } fisis4
  <dis,, dis'> <e e'> <fisis fisis'> <gisis gisis'>
  \tuplet 3/2 4 { <ais ais'>4 disis'8 eis4 gisis8 } ais4
  <bis,, bis'> <b b'> <ais ais'> <gisis gisis'>
  \tuplet 3/2 4 { <fis fis'>4 ais'8 cis4 eis8} fis4
  \tuplet 3/2 { <eis,, eis'>4 <dis dis'>8~ } q4 \tuplet 3/2 4 { <cis cis'>4 <bis bis'>8~ } q4
}

upper-melodyd = \relative c'' {
  <fisis ais>4 q q <gis ais> q q q
  <eis ais>4 q q <cis eis> <dis eis> <dis fisis> <dis fis>
  <fisis ais>4 q q <dis ais'> q <dis gis> q
  <dis fis> q <e fis>
  \clef bass
  <fisis,, gisis dis'>1~
  \time 2/4
  q2
}

lower-melodyd = \relative c'' {
  \clef treble
  \repeat unfold 3 { \tuplet 3/2 4 { ais8 cis eis } }
  \repeat unfold 4 { \tuplet 3/2 4 { ais,8 bis dis } }
  \repeat unfold 3 { \tuplet 3/2 4 { fisis,8 ais cis } }
  \tuplet 3/2 4 { fis,8 ais cis fis, ais cis eis, gisis cis eis, gisis bis }
  \repeat unfold 3 { \tuplet 3/2 4 { ais8 cis eis } }
  \repeat unfold 4 { \tuplet 3/2 4 { bis dis eis } }
  \tuplet 3/2 4 { cis8 dis ais' cis, dis ais' cis, e ais }
  \clef bass
  <eis,,, bis'>1~
  \time 2/4
  q2
}

upper-melodyd-dash = \relative c' {
  <fisis cis' eis fisis>4 <fis bis dis fis> <fisis ais cis eis> <gis b cis eis> <gis cis eis gis> <fisis ais cis eis> <fis gisis bis dis>
  <ais e' fis ais> <ais cis fis ais> <bis dis eis bis'> <cis eis fisis cis'> <ais e' fis ais> <bis dis fis bis> <dis eis gisis dis'>
  <bis cis eis ais> <cis eis gisis cis> <cis eis gis bis> <ais cis eis ais> <gis cis e gis> <bis dis eis gisis> <bis dis fis gisis>
  <ais cis eis ais> <gis cis fis gis> <fis bis dis fis> <eis fisis ais eis'> <fisis ais cis fisis> <gisis b dis gisis> <eis gisis dis' eis>
}

lower-melodyd-dash = \relative c, {
  \makeOctaves #1 {
    ais4 bis fisis dis gisis fisis gis
    ais dis, eis fisis gis gisis bis
    ais gisis gis fisis fis eis gisis
    fis disis gisis eis dis cis bis
  }
}

upper-bridged = \relative c' {
  \time 6/8
  R2.
}

lower-bridged = \relative c {
  \time 6/8
  \clef bass
  eis16 <ais cis> eis' disis, <gisis cis> eis'
  dis, <cis' eis> cis, <bis' eis> bis, <gisis' eis'>
}

upper-melodye = \relative c' {
  \tuplet 3/2 4 { ais8 bis cis cisis dis disis eis disis dis cisis cis bis r eis bis' <cis eis> eis bis' } <cis eis>4
  \tuplet 3/2 4 { gis,,8 ais aisis bis cis cisis dis cisis cis bis aisis ais r eis' bis' <cis eis> eis bis' } <cis eis>4
  \tuplet 3/2 4 { fisis,,,8 gis gisis ais aisis bis cis bis aisis ais gisis gis r eis' bis' <cis eis> eis bis' } <cis eis>4
  <ais,, cis fis>4 <gisis bis fis'> <fisis bis fis'> <fis bis fis'> <gis b fis'> <fisis aisis gis'> <fisis aisis fis'>
}

lower-melodye = \relative c, {
  \tuplet 3/2 4 { <ais ais'>8 bis' cis cisis dis disis eis disis dis cisis cis bis ais eis' ais <bis eis> eis ais } <bis eis>4
  \tuplet 3/2 4 { <gis,,, gis'>8 ais' aisis bis cis cisis dis cisis cis bis aisis ais gis eis' ais <bis eis> eis ais } <bis eis>4
  \tuplet 3/2 4 { <fisis,,, fisis'>8 gis' gisis ais aisis bis cis bis aisis ais gisis gis fisis eis' ais <bis eis> eis ais } <bis eis>4
  \makeOctaves #1 { fis,,,4 eis disis dis cisis cis bis }
}

upper-bridgee = \relative c' {
  << {
    \makeOctaves #1 { \tuplet 3/2 4 { dis8 cisis dis disis eis fis eis disis eis fis fisis gis
    gisis ais b bis cis cisis dis disis eis fis fis eis }}
  } \\ {
    <a, bis>4 s4 <b cisis> s <dis fis> <fis gisis> <gisis bis> <bis dis>
  } >>
}

lower-bridgee = \relative c, {
  \makeOctaves #1 { \tuplet 3/2 4 {
    fis8 eis fis fisis gis a gis fisis gis gisis ais b
    bis cis cisis dis disis eis fis fisis gis gisis ais bis
  }}
}

upper-bridge-ending = \relative c' {
  \time 6/8
  \key ees \minor
  << {
    ges'4.~ ges4 f16 ees bes'4. aes
    ces4.~ ces4 bes16 f bes2.
    ees4.~ ees8 des16 ces aes ees ges4~ ges16 f ees4.
    <ces fes>4. d4~ d16 ees <ees ges,>4.
  } \\ {
    ees4. s4 s16 \hideNotes ees~ \unHideNotes ees2~ ees8. f16~ f2. fes2~
    \stemUp
    fes8. ees16~
    \stemDown
    ees2. d4. ees s4. aes,4.
  } >>
  r4.
  <f' bes ees f>4. <f bes des f> <f a c f>2.
}

lower-bridge-ending = \relative c' {
  \key ees \minor
  << {
    bes16 ces a ces bes ges \stemNeutral bes ces a ces bes \change Staff = "right" ees
    \change Staff = "left" \stemUp
    ces des bes des ces aes ces des bes des ces aes~
    aes bes g bes aes f \stemNeutral aes bes g bes aes \change Staff = "right" f'
    \change Staff = "left" \stemUp
    g, aes fis aes g e g aes fis aes g8~
    g16 aes fis aes g ees aes bes g bes aes8~
    aes16 bes g bes aes f ges aes f aes ges ees
    \change Staff = "right" \stemNeutral
    aes bes g bes aes \change Staff = "left" fes \stemUp f ges e ges f bes,~
    bes ces a ces bes ges ees f d f ees ces
  } \\ {
    ees'2. f d des ces bes4. ces aes bes ees,4
  } >>
  bes'8 bes' ees f des bes
  f, a' c f c a
}

upper-ending-print = \relative c'' {
  fis16 ais, fis eis' gis, eis disis' gis, disis dis' ais dis,
  \time 3/4
  \compound-meter-to-simple-meter-mark
  \tuplet 3/2 4 { d'8 ais d, cis' a cis, bis' <dis, eis> bis }
  <cis eis fisis>2.
}

upper-ending-midi = \relative c'' {
  fis16 ais, fis eis' gis, eis disis' gis, disis dis' ais dis,
  \time 3/4
  \tempo 4 = 104
  \tuplet 3/2 4 { d'8 ais d, cis' a cis, bis' <dis, eis> bis }
  <cis eis fisis>2.
}

lower-ending-print = \relative c, {
  dis8. eis fis fisis
  \time 3/4
  eis4 fisis gisis
  ais2.
}

lower-ending-midi = \relative c, {
  dis8. eis fis fisis
  \time 3/4
  \tempo 4 = 104
  eis4 fisis gisis
  ais2.
}


upper-midi = \relative c' {
  \set Staff.pedalSustainStyle = #'bracket
  \clef treble
  \tempo 4. = 90
  \time 6/8
  \upper-prelude
  \key ais \minor
  \upper-melodya
  \upper-bridgea-midi
  \upper-melodyb
  \upper-melodyc
  \time 2/4 r4 \tuplet 3/2 4 { cis''8 bis b }
  \time 7/4
  \upper-melodyd
  \tempo 4. = 52
  \upper-bridged
  \upper-melodya
  \tempo 4 = 104
  \upper-bridgea-dash
  \upper-melodyb
  \upper-melodyc
  \upper-melodyd-dash
  \time 4/4
  \upper-bridgee
  \time 7/4
  \upper-melodye
  \upper-melodye
  \time 6/8
  \tempo 4. = 52
  \upper-bridge-ending
  \key ais \minor
  \upper-melodya
  \upper-ending-midi
  \bar "|."
}

lower-midi = \relative c {
  \set Staff.pedalSustainStyle = #'bracket
  \clef bass
  \time 6/8
  \lower-prelude
  \lower-melodya
  \lower-bridgea-midi
  \lower-melodyb
  \lower-melodyc
  \time 2/4
  R2
  \time 7/4
  \lower-melodyd
  \lower-bridged
  \lower-melodya-dash
  \lower-bridgea-dash
  \lower-melodyb
  \lower-melodyc
  \lower-melodyd-dash
  \time 4/4
  \lower-bridgee
  \time 7/4
  \lower-melodye
  \lower-melodye
  \time 6/8
  \lower-bridge-ending
  \key ais \minor
  \lower-melodya
  \lower-ending-midi
  \bar "|."
}

upper-print = \relative c' {
  \set Staff.pedalSustainStyle = #'bracket
  \clef treble
  \tempo 4. = 90
  \time 6/8
  \upper-prelude
  \key ais \minor
  \upper-melodya
  \upper-bridgea-print
  \upper-melodyb
  \upper-melodyc
  \time 2/4 r4 \tuplet 3/2 4 { cis''8 bis b }
  \time 7/4
  \upper-melodyd
  \simple-meter-to-compound-meter-mark
  \upper-bridged
  \upper-melodya
  \compound-meter-to-simple-meter-mark
  \upper-bridgea-dash
  \upper-melodyb
  \upper-melodyc
  \upper-melodyd-dash
  \time 4/4
  \upper-bridgee
  \time 7/4
  \upper-melodye
  \upper-melodye
  \simple-meter-to-compound-meter-mark
  \time 6/8
  \upper-bridge-ending
  \key ais \minor
  \upper-melodya
  \upper-ending-print
  \bar "|."
}

lower-print = \relative c {
  \set Staff.pedalSustainStyle = #'bracket
  \clef bass
  \time 6/8
  \lower-prelude
  \lower-melodya
  \lower-bridgea-print
  \lower-melodyb
  \lower-melodyc
  \time 2/4
  R2
  \time 7/4
  \lower-melodyd
  \lower-bridged
  \lower-melodya-dash
  \lower-bridgea-dash
  \lower-melodyb
  \lower-melodyc
  \lower-melodyd-dash
  \time 4/4
  \lower-bridgee
  \time 7/4
  \lower-melodye
  \lower-melodye
  \time 6/8
  \lower-bridge-ending
  \key ais \minor
  \lower-melodya
  \lower-ending-print
  \bar "|."
}

dynamics = {
  s1
}

guitarchords = \chordmode {
  ais1:m
}

lyricsmain = \lyricmode {
  每 隻 螞 蟻 都 有 眼 睛 鼻 子 牠 美 不 美 麗
  偏 差 有 沒 有 一 毫 釐 有 何 關 係
  每 一 個 人 傷 心 了 就 哭 泣 餓 了 就 要 吃
  相 差 大 不 過 天 地 有 何 刺 激

  有 太 多 太 多 魔 力 太 少 道 理
  太 多 太 多 遊 戲 只 是 為 了 好 奇
  還 有 什 麼 值 得 歇 斯 底 里
  對 什 麼 東 西 死 心 塌 地
  一 個 一 個 偶 像 都 不 外 如 此
  沉 迷 過 的 偶 像 一 個 個 消 失
  誰 曾 傷 天 害 理 誰 又 是 上 帝
  我 們 在 等 待 什 麼 奇 蹟
  最 後 剩 下 自 己 捨 不 得 挑 剔
  最 後 對 著 自 己 也 不 大 看 的 起
  誰 給 我 全 世 界 我 都 會 懷 疑
  心 花 怒 放 卻 開 到 荼 蘼

  每 隻 螞 蟻 都 有 眼 睛 鼻 子 牠 美 不 美 麗
  偏 差 有 沒 有 一 毫 釐 有 何 關 係
  每 一 個 人 傷 心 了 就 哭 泣 餓 了 就 要 吃
  相 差 大 不 過 天 地 有 何 刺 激

  有 太 多 太 多 魔 力 太 少 道 理
  太 多 太 多 遊 戲 只 是 為 了 好 奇
  還 有 什 麼 值 得 歇 斯 底 里
  對 什 麼 東 西 死 心 塌 地
  一 個 一 個 偶 像 都 不 外 如 此
  沉 迷 過 的 偶 像 一 個 個 消 失
  誰 曾 傷 天 害 理 誰 又 是 上 帝
  我 們 在 等 待 什 麼 奇 蹟
  最 後 剩 下 自 己 捨 不 得 挑 剔
  最 後 對 著 自 己 也 不 大 看 的 起
  誰 給 我 全 世 界 我 都 會 懷 疑
  心 花 怒 放 卻 開 到 荼 蘼

  一 個 一 個 一 個 人 誰 比 誰 美 麗
  一 個 一 個 一 個 人 誰 比 誰 甜 蜜
  一 個 一 個 一 個 人 誰 比 誰 容 易
  又 有 什 麼 了 不 起

  一 個 一 個 一 個 人 誰 比 誰 美 麗
  一 個 一 個 一 個 人 誰 比 誰 甜 蜜
  一 個 一 個 一 個 人 誰 比 誰 容 易
  又 有 什 麼 了 不 起

  每 隻 螞 蟻 和 誰 擦 身 而 過 都 那 麼 整 齊
  有 何 關 係
  每 一 個 人 碰 見 所 愛 的 人 都 心 有 餘 悸
}

melodya = \relative c' {
  r4. r8 dis eis eis dis r dis dis cis eis ais, ais r4 ais8 ais4 gis8 ais cis4
  r4. r8 eis, cis' cis cis bis ais cis4 bis4. r4 eis,8 gisis4 ais8 bis4 r8
  r4. r8 dis eis eis dis r dis dis cis eis ais, ais r4 ais8 ais4 gis8 ais cis4
  r4. r8 eis, cis' cis cis bis ais( cis4) dis4. r4 eis,8 bis'4 cis8 dis4 r8
}

melodyaa = \relative c' {
  r4. r8 dis eis eis dis r dis dis cis eis ais, ais r4 ais8 ais4 gis8 ais cis4
  r4. r8 eis, cis' cis cis bis ais cis4 bis4. r4. eis,8 gisis4 ais8 bis8 r
  r4. r8 dis eis eis dis r dis dis cis eis ais, ais r4 ais8 ais4 gis8 ais cis4
  r4. r8 eis, cis' cis cis bis ais( cis4) dis4. r4. eis,8 bis'4 cis8 dis8 r
}

melodyb = \relative c' {
  \tuplet 3/2 4 { r4 bis8 }
  \time 7/4
  \tuplet 3/2 4 { cis4 bis8 cis4 bis8 cis4 eis8 } bis4 ais4 \tuplet 3/2 4 { bis4 gis8~ } gis4
  \tuplet 3/2 4 { cis4 bis8 cis4 bis8 cis4 eis8 gis4 gis8 fis4 fis8 } eis4 dis4
  \tuplet 3/2 4 { cis4 bis8 cis4 bis8 cis4 gis'8 } bis,4 ais \tuplet 3/2 4 { bis4 gis8~ gis4 ais8 }
  ais4 bis \tuplet 3/2 4 { cis4 fis8 } eis4 fisis4 gisis4 eis4
}

melodyc = \relative c' {
  \tuplet 3/2 4 { eis4 disis8 eis4 disis8 eis4 ais8 } ais4 \tuplet 3/2 4 { gis4 fis8 eis4 dis8~ } dis4
  \tuplet 3/2 4 { eis4 disis8 eis4 disis8 eis4 ais8 gis4 fis8 } fis4 \tuplet 3/2 4 {eis4 dis8~ } dis4
  \tuplet 3/2 4 { eis4 disis8 eis4 disis8 eis4 ais,8 } dis4 \tuplet 3/2 4 { dis4 cis8 bis4 cis8~ } cis4
  \tuplet 3/2 4 { ais4 ais8 bis4 cis8 } fis4 \tuplet 3/2 4 { eis4 fisis8~ } fisis4 \tuplet 3/2 4 { gisis4 bis8~ } bis4
}

melodyd = \relative c' {
  \tuplet 3/2 4 { ais'4 gisis8 ais4 gisis8 ais4 eis8 } eis4 \tuplet 3/2 4 { gis4 fis8 } eis4 dis
  \tuplet 3/2 4 { ais'4 gisis8 ais4 gisis8 ais4 eis8 } eis4 \tuplet 3/2 4 { ais4 ais8 bis4 ais8 } gisis4
  \tuplet 3/2 4 { eis4 disis8 eis4 disis8 eis4 ais8 } ais4 \tuplet 3/2 4 { gis4 fis8 } eis4 dis4
  \tuplet 3/2 4 { ais4 bis8 } cis4 \tuplet 3/2 4 { fis4 eis8 } eis4 fisis gisis eis
}

melodye = \relative c' {
  \repeat unfold 3 {
    \tuplet 3/2 4 { eis4 disis8 eis4 disis8 eis4 disis8 } eis4
    \tuplet 3/2 4 { ais4 ais8 ais4 gisis8 } ais4
  }
  fis4 fis fis fis \tuplet 3/2 4 { fis4 fis8 } gis4( fis)
}

melodyf = \relative c' {
  r4. r8 dis eis eis dis r dis dis cis eis ais, ais r4 ais8 ais4 gis8 ais cis4
  R2. R2. r4. r4 eis,8 gisis4 ais8 bis4 r8
  r4. r8 dis eis eis dis r dis dis cis eis ais, ais r4 ais8 ais4 gis8 ais cis4
}

melody = \relative c' {
  \clef treble
  \time 6/8
  \key f \minor
  \partial 8. r8.
  R2.*21
  \key ais \minor
  \melodya
  R2.
  \time 3/4 r2
  \melodyb
  \melodyc
  \time 2/4 R2
  \time 7/4
  \melodyd
  \time 2/4
  R2
  \time 6/8
  R2.
  \time 6/8
  \melodya
  \time 3/4 r2
  \melodyb
  \melodyc
  \melodyd
  \time 4/4
  R1 R1
  \time 7/4
  \melodye
  \melodye
  \time 6/8
  \key ees \minor
  R2.*10
  \key ais \minor
  \melodyf
  R2.*7
  \bar "|."
}


\book {
\score {
  <<
    % \new ChordNames {
      % \guitarchords
    % }
    \new Staff = "melodystaff" <<
      \set Staff.midiInstrument = #"electric guitar (clean)"
      \set Staff.instrumentName = #"Voice"
      \set Staff.midiMinimumVolume = #0.9
      \set Staff.midiMaximumVolume = #1
      \new Voice = "melody" {
        \melody
      }
      \context Lyrics = "lyrics" { \lyricsto "melody" { \lyricsmain } }
    >>
    \new PianoStaff <<
      \set Staff.midiInstrument = #"acoustic grand"
      \set Staff.instrumentName = #"Piano"
      \new Staff = "right" {
        \set Staff.midiMinimumVolume = #0.1
        \set Staff.midiMaximumVolume = #0.4
        \upper-midi
      }
      \new Staff = "left" {
        \set Staff.midiMinimumVolume = #0.1
        \set Staff.midiMaximumVolume = #0.4
        \lower-midi
      }
    >>
  >>
  \midi {
    \context {
      \ChordNameVoice \remove Note_performer
    }
  }
}
}
\book {
\score {
  <<
    % \new ChordNames {
      % \set chordChanges = ##t
      % \guitarchords
    % }
    \new Staff = "melodystaff" \with {
      fontSize = #-3
      \override StaffSymbol.staff-space = #(magstep -3)
    }
    <<
      \set Staff.midiInstrument = #"choir aahs"
      \set Staff.instrumentName = #"Voice"
      \new Voice = "melody" {
        \melody
      }
      \context Lyrics = "lyrics" { \lyricsto "melody" { \lyricsmain } }
    >>
    \new PianoStaff <<
      \set Staff.midiInstrument = #"acoustic grand"
      \set Staff.instrumentName = #"Piano"
      \new Staff = "right" { \upper-print }
      \new Dynamics = "Dynamics_pf" \dynamics
      \new Staff = "left" { \lower-print }
    >>
  >>
  \layout {
    \context {
      % add the RemoveEmptyStaffContext that erases rest-only staves
      \Staff \RemoveEmptyStaves
    }
    \context {
      % add the RemoveEmptyStaffContext that erases rest-only staves
      \Dynamics \RemoveEmptyStaves
    }
    \context {
      \Score
      % Remove all-rest staves also in the first system
      \override VerticalAxisGroup.remove-first = ##t
      % If only one non-empty staff in a system exists, still print the starting bar
      \override SystemStartBar.collapse-height = #1
    }
    \context {
      \ChordNames
      \override ChordName #'font-size = #-3
    }
  }
}
}

