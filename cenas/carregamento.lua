
local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaCarregamento = self.view

  local x = display.contentWidth
  local y = display.contentHeight

  local fundo = display.newImageRect(cenaCarregamento, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  local logo = display.newImageRect(cenaCarregamento, 'recursos/imagens/logo.png', x*0.8, y*0.3 )
  logo.x = x*0.5
  logo.y = y*0.3

  local bandeira1 = display.newImageRect(cenaCarregamento, 'recursos/bandeiras/south-korea.png', x*0.22, y*0.10)
  bandeira1.x = x*0.2
  bandeira1.y = y*0.55

  local bandeira2 = display.newImageRect(cenaCarregamento, 'recursos/bandeiras/portugal.png', x*0.22, y*0.10)
  bandeira2.x = x*0.8
  bandeira2.y = y*0.55

  local bandeira3 = display.newImageRect(cenaCarregamento, 'recursos/bandeiras/italy.png', x*0.22, y*0.10)
  bandeira3.x = x*0.35
  bandeira3.y = y*0.55

  local bandeira4 = display.newImageRect(cenaCarregamento, 'recursos/bandeiras/united-states.png', x*0.22, y*0.10)
  bandeira4.x = x*0.65
  bandeira4.y = y*0.55

  local bandeira5 = display.newImageRect(cenaCarregamento, 'recursos/bandeiras/brazil-.png', x*0.22, y*0.10)
  bandeira5.x = x*0.5
  bandeira5.y = y*0.55

  local fundoBarra = display.newRoundedRect(cenaCarregamento, x*0.5, y*0.7, x*0.8, y*0.07, 100 )
  fundoBarra:setFillColor(0,0,0)

  local barra = display.newRoundedRect(cenaCarregamento, x*0.5, y*0.7, 0, y*0.05, 100 )

  transition.to( barra, {
    time = math.random( 5000, 10000 ),
    width = x*0.7,
    onComplete = function()
      composer.gotoScene( 'cenas.menu', {time = 300, effect = 'fade'} )
    end
  })



end
cena:addEventListener('create', cena)
return cena