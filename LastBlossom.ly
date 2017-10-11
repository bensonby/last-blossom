\version "2.18.2"

\header {
  title = "王菲 － 開到荼蘼"
  subtitle = "For female voice and piano accompaniment"
  arranger = "Arranged by Benson"
}

upper-midi = \relative c' {
  \set Staff.pedalSustainStyle = #'bracket
  \key ais \minor
  \clef treble
  \tempo 4 = 92
  \bar "|."
}

lower-midi = \relative c {
  \set Staff.pedalSustainStyle = #'bracket
  \key ais \minor
  \clef bass
  \bar "|."
}

upper-print = \relative c' {
  \set Staff.pedalSustainStyle = #'bracket
  \key ais \minor
  \clef treble
  \tempo 4. = 92
  \bar "|."
}

lower-print = \relative c {
  \set Staff.pedalSustainStyle = #'bracket
  \key ais \minor
  \clef bass
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
  r4. r8 eis, cis' cis cis bis ais cis4 bis4. r4. eis,8 gisis4 ais8 bis8 r
  r4. r8 dis eis eis dis r dis dis cis eis ais, ais r4 ais8 ais4 gis8 ais cis4
  r4. r8 eis, cis' cis cis bis ais( cis4) dis4. r4. eis,8 bis'4 cis8 dis8 r
}

melodyb = \relative c' {
  r4. r4 bis8
  cis4 bis8 cis4 bis8 cis4. eis bis ais bis4 gis8 r4.
  cis4 bis8 cis4 bis8 cis4. eis4 eis8 gis4. fis4 fis8 eis4. dis
  cis4 bis8 cis4 bis cis4. gis' bis, ais bis4 gis8 r
  ais8 ais4. bis cis fis r eis4 fisis8 gisis4. eis

  eis4 disis8 eis4 disis8 eis4. ais4 ais8 gis4. fis eis dis
  eis4 disis8 eis4 disis8 eis4. ais4 ais8 gis4. fis eis dis
  eis4 disis8 eis4 disis8 eis4. ais,4 ais8 dis4. cis bis4 cis8 r4
  ais8 ais4. bis cis fis eis4 fisis8~ fisis4. gisis4 bis8~ bis4.

  ais4 gisis8 ais4 gisis8 ais4. eis4 eis8 gis4. fis eis dis
  ais'4 gisis8 ais4 gisis8 ais4. eis4 eis8 ais4. ais bis4 ais8 gisis4 r8
  eis4 disis8 eis4 disis8 eis4. ais4 ais8 gis4. fis eis dis4 r8
  ais4. bis cis fis4 eis8 eis4. fisis gisis eis
}

melody = \relative c' {
  \key ais \minor
  \clef treble
  \time 6/8
  \melodya
  \melodyb
}


\book {
\score {
  <<
    \new ChordNames {
      \guitarchords
    }
    \new Staff = "melodystaff" <<
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
      \new Staff = "right" { \upper-midi }
      \new Staff = "left" { \lower-midi }
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
    \new ChordNames {
      \set chordChanges = ##t
      \guitarchords
    }
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

