\version "2.18.2"
#(set-global-staff-size 16)

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

lower-prelude = \relative c' {
  ais8\( bis cis eis cis bis\)
  gisis\( bis cis eis cis bis\)
  gis_"simile" bis cis eis cis bis
  fisis bis cis eis cis bis
  fis cis' eis ais eis cis
  eis, bis' eis gisis eis bis
  ais bis cis eis cis bis
  ais bis cis eis cis bis
}

upper-prelude = \relative c''' {
  eis4.\( e dis d cis bis b ais~\) ais2. r4. cis,8\( bis b ais4.\) r R2.
}

lower-melodya = \relative c' {
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
  r4. <bis cis eis> r q r q r <bis cis eis>16 eis,\( gis fisis fis eis
  cis4 gis'16 ais <gis cis eis>4.\)
  r8 dis\( eis <dis gisis> ais'16 eis gisis ais
  bis gisis fis dis bis ais gisis4\) <eis dis'>8\(
  <gisis eis'>4 <ais fisis'>8 <bis gisis'>4.\)

  r4. <bis' cis eis> r q r q r <bis cis eis>16 eis,\( gis fisis fis eis
  cis4 gis'16 ais <gis cis eis>4.\)
  r8 dis\( eis <dis gisis> ais'16 eis gisis ais
  bis gisis fis dis bis ais gisis4\) << { <fis eis'>8\(
  <fisis dis' >4 <gis cis>8 bis16\) cis cisis-1 dis-2 disis-3 eis-4 } \\ { s8 s4. <gisis, bis>4. } >>
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
    <fisis-1 disis'-5>8 bis-3 fisis-1 <aisis-2 eis'-5> cis-3 aisis-2 <fisis-1 cis'-3 fis>-5 ais cis
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
  \omit TupletNumber
  <ais cis> eis cis <eis gisis> dis bis <fis' ais> cis <fis-3 ais-5>
  <bis,-1 eis-2 gisis-4> dis fis gisis-1 bis-2 dis-3
  <bis-1 eis-4 gisis-5> dis-2 fis-4 gisis-1 bis-2 dis-4
  \undo \omit TupletNumber
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
  \tuplet 3/2 4 { <gisis, eis'>8-> cis <ais fisis'>8-> cis dis fisis <dis eis gisis>4-> <dis fisis gisis bis>8~-> } q4
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
  \omit TupletNumber
  \repeat unfold 3 { \tuplet 3/2 4 { fisis,8 ais cis } }
  \tuplet 3/2 4 { fis,8 ais cis fis, ais cis eis, gisis cis eis, gisis bis }
  \repeat unfold 3 { \tuplet 3/2 4 { ais8 cis eis } }
  \repeat unfold 4 { \tuplet 3/2 4 { bis dis eis } }
  \tuplet 3/2 4 { cis8 dis ais' cis, dis ais' cis, e ais }
  \undo \omit TupletNumber
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
  \omit TupletNumber
  \omit TupletBracket
  \tuplet 3/2 4 { ais8\( bis cis cisis dis disis eis disis dis cisis cis bis\) r eis bis' <cis eis> eis bis' } <cis eis>4
  \tuplet 3/2 4 { gis,,8\( ais aisis bis cis cisis dis cisis cis bis aisis ais\) r eis' bis' <cis eis> eis bis' } <cis eis>4
  \tuplet 3/2 4 { fisis,,,8\( gis gisis ais aisis bis cis bis aisis ais gisis gis\) r eis' bis' <cis eis> eis bis' } <cis eis>4
  \undo \omit TupletNumber
  \undo \omit TupletBracket
  <ais,, cis fis>4\( <gisis bis fis'> <fisis bis fis'> <fis bis fis'> <gis b fis'> <fisis aisis gis'> <fisis aisis fis'>\)
}

lower-melodye = \relative c, {
  \omit TupletNumber
  \tuplet 3/2 4 { <ais ais'>8\( bis' cis cisis dis disis eis disis dis cisis cis bis ais\) eis' ais <bis eis> eis ais } <bis eis>4
  \tuplet 3/2 4 { <gis,,, gis'>8\( ais' aisis bis cis cisis dis cisis cis bis aisis ais gis\) eis' ais <bis eis> eis ais } <bis eis>4
  \tuplet 3/2 4 { <fisis,,, fisis'>8\( gis' gisis ais aisis bis cis bis aisis ais gisis gis fisis\) eis' ais <bis eis> eis ais } <bis eis>4
  \undo \omit TupletNumber
  \makeOctaves #1 { fis,,,4\( eis disis dis cisis cis bis\) }
}

upper-bridgee = \relative c' {
  << {
    \makeOctaves #1 { \tuplet 3/2 4 { dis8\( cisis dis disis eis fis\) eis\( disis eis fis fisis gis\)
    \omit TupletNumber
    gisis\( ais b bis cis cisis\) dis\( disis eis fis fis eis\) }}
    \undo \omit TupletNumber
  } \\ {
    <a, bis>4 s4 <b cisis> s <dis fis> <fis gisis> <gisis bis> <bis dis>
  } >>
}

lower-bridgee = \relative c, {
  \makeOctaves #1 { \tuplet 3/2 4 {
    fis8\( eis fis fisis gis a\) gis\( fisis gis gisis ais b\)
    \omit TupletNumber
    bis\( cis cisis dis disis eis\) fis\( fisis gis gisis ais bis\)
    \undo \omit TupletNumber
  }}
}

upper-bridge-ending-print = \relative c {
  \tuplet 3/2 4 { <eis ais eis'>4 ais'8 <bis eis> <bis' eis>4->~ } q4
  \tuplet 3/2 4 { <eis,, ais eis'>4 ais8 <bis eis> <bis' eis>4->~ } q4
  \time 2/4
  \tuplet 3/2 4 { <eis,, ais eis'>4-- <ais eis'>8-- bis <bis' eis>4-- }
  \simple-meter-to-compound-meter-mark
  \time 3/8
  <cis ais'>8 <bis gis'> <ais fis'>
  \time 6/8
  <gisis eis'>4. dis'
}

upper-bridge-ending-midi = \relative c {
  \tuplet 3/2 4 { <eis ais eis'>4 ais'8 <bis eis> <bis' eis>4->~ } q4
  \tuplet 3/2 4 { <eis,, ais eis'>4 ais8 <bis eis> <bis' eis>4->~ } q4
  \time 2/4
  \tuplet 3/2 4 { <eis,, ais eis'>4 <ais eis'>8 bis <bis' eis>4-> }
  \tempo 4. = 52
  \time 3/8
  <cis ais'>8 <bis gis'> <ais fis'>
  \time 6/8
  <gisis eis'>4. dis'
}

lower-bridge-ending = \relative c,,, {
  \tuplet 3/2 4 {<ais' ais'>8 eis'' ais bis cis eis } ais4
  \tuplet 3/2 4 { gis8 bis eis~ } eis2
  \tuplet 3/2 4 { fis,8 fis' ais, ais' gis, gis' }
  \time 3/8
  fis,4.
  \time 6/8
  eis2.
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
  \tempo 4. = 52
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
  \upper-bridge-ending-midi
  \upper-melodya
  \upper-ending-midi
  \bar "|."
}

lower-midi = \relative c {
  \set Staff.pedalSustainStyle = #'bracket
  \clef bass
  \time 6/8
  \key ais \minor
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
  \lower-bridge-ending
  \lower-melodya
  \lower-ending-midi
  \bar "|."
}

upper-print = \relative c' {
  \set Staff.pedalSustainStyle = #'bracket
  \set fingeringOrientations = #'(up)
  \clef treble
  \tempo 4. = 52
  \time 6/8
  \key ais \minor
  \upper-prelude
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
  \upper-bridge-ending-print
  \upper-melodya
  \upper-ending-print
  \bar "|."
}

lower-print = \relative c {
  \set Staff.pedalSustainStyle = #'bracket
  \clef bass
  \time 6/8
  \key ais \minor
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
  \lower-bridge-ending
  \lower-melodya
  \lower-ending-print
  \bar "|."
}

dynamics = {
  s2.\mp s2.*5 s2.\p s2.
  s2.*15
  s4. s4.-"cresc."
  s2. s2.
  s2.\mf s1
  s2. s1
  s2. s1
  s2. s1-"cresc."
  s2.\f s1
  \repeat unfold 3 { s2. s1 }
  s4 s4\mp
  s2.-"legato" s1
  \repeat unfold 3 { s2. s1 }
  s2
  s2.\mf
  s2.*15
  s4. s4.-"cresc."
  s2.
  s2.\mf s1
  s2. s1
  s2. s1
  s2. s1-"cresc."
  s2.\f s1
  \repeat unfold 3 { s2. s1 }
  s2.-"non marcato" s1
  \repeat unfold 3 { s2. s1 }
  s8\mp s8-"cresc." s2. s1
  s2.\ff s1
  \repeat unfold 7 { s2. s1 }
  s2.\mf s2. s2 s4.-"dim." s2.
  s2.\p
  s2.*14
  s4. s4.-"cresc."
  s2.\mf
  s2.-"senza dim. e senza rit."
  s2.

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
  \key ais \minor
  R2.*8
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
  \time 3/4
  R2.*2
  \time 2/4
  R2
  \time 3/8
  R4.
  \time 6/8
  R2.
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
      \override StaffSymbol.thickness = #(magstep -3)
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

