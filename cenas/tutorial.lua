local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaTutorial = self.view

  local x = display.contentWidth
  local y = display.contentHeight

  local fundo = display.newImageRect(cenaTutorial, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  local textoTutorial = display.newText(cenaTutorial, 'TUTORIAL', x*0.5, y*0.2, fonte, 350 )
  textoTutorial:setFillColor( 0,0,0 )

  local bloco = display.newRoundedRect(cenaTutorial, x*0.5, y*0.6, x*0.8, y*0.5, 100 )
  bloco.alpha = 0.7

  local texto = display.newText(cenaTutorial, 'Neste jogo voce deverá identificar a bandeira e clicar na resposta correta, ao clicar na correta ganhará mais tempo e ao clicar na errada perderá tempo, quando chegar a 0 voce irá perder.', x*0.5, y*0.65, x*0.7, y*0.5, fonte, 70 )
  texto:setFillColor(0,0,0)

  local botaoJogar = display.newRoundedRect(cenaTutorial, x*0.5, y*0.76, x*0.5, y*0.09, 100 )
  botaoJogar:setFillColor(0, 0.4, 0.8) 

  local textoJogar = display.newText(cenaTutorial, 'JOGAR', botaoJogar.x, botaoJogar.y, fonte, 100 )

  function verificaToque( event )
    if event.phase == 'began' then
      composer.gotoScene( 'cenas.jogo', {
        time = 500, effect = 'fade'
      })
    end
  end
  botaoJogar:addEventListener( 'touch', verificaToque )


end
cena:addEventListener('create', cena)
return cena