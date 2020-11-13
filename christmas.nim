## A triangular ("christmas tree"-style) 12-hour clock in Nim using SDL2

import sdl2, times

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("christmas", 100, 100, 500, 900, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or
    Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  runGame = true
  r: Rect

r.w = 80
r.h = 80

let tree = [1, 2, 3, 4, 1, 2, 3, 4, 5]

while runGame:
  let d = now()
  var
    h = d.hour mod 12
    m = d.minute
    s = d.second
    s1, s5, s20: int
    h6, h2, m30, m6, m1, mm: int
  let secblink = (s + 1) mod 2
  s20 = s div 20
  s -= s20 * 20
  s5 = s div 5
  s1 = s mod 5
  h6 = h div 6
  h -= h6 * 6
  h2 = h div 2
  h -= h2 * 2
  mm = 60 * h + m
  m30 = mm div 30
  mm -= m30 * 30
  m6 = mm div 6
  m1 = mm mod 6

  while pollEvent(evt):
    if evt.kind == QuitEvent:
      runGame = false
      break
  render.setDrawColor(0, 0, 0, 255)
  render.clear

  let on = [secblink, s20, s5, s1, h6, h2, m30, m6, m1]
  for y in 0..8:
    for x in 0..5:
      if x >= tree[y]:
        continue
      if x < on[y]:
        if y == 0:
          render.setDrawColor(170, 170, 85, 255)
        else:
          render.setDrawColor(0, 170, 85, 255)
      else:
        render.setDrawColor(0, 82, 41, 255)
      r.x = 10 + 100 * cint(x) + (250 - 50 * cint(tree[y]))
      r.y = 10 + 100 * cint(y)
      render.fillRect(r)

  render.present
  delay(100)

destroy render
destroy window

