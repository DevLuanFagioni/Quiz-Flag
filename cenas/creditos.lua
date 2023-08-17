local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaCreditos = self.view

  local x = display.contentWidth
  local y = display.contentHeight
  
  local fundo = display.newImageRect(cenaCreditos, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  local textoCreditos = display.newText(cenaCreditos, 'CREDITOS', x*0.5, y*0.2, fonte, 350 )
  textoCreditos:setFillColor( 0,0,0 )

  local bloco = display.newRoundedRect(cenaCreditos, x*0.5, y*0.6, x*0.8, y*0.5, 100 )
  bloco.alpha = 0.7

  local botaoInstagram = display.newRoundedRect(cenaCreditos, x*0.5, y*0.45, x*0.5, y*0.09, 100 )
  botaoInstagram:setFillColor(0, 0.4, 0.8) 

  local textoInstagram = display.newText(cenaCreditos, 'Instagram', botaoInstagram.x, botaoInstagram.y, fonte, 100 )

  local botaoLinkedin = display.newRoundedRect(cenaCreditos, x*0.5, y*0.6, x*0.5, y*0.09, 100 )
  botaoLinkedin:setFillColor(0, 0.4, 0.8) 

  local textoLinkedin = display.newText(cenaCreditos, 'Linkedin', botaoLinkedin.x, botaoLinkedin.y, fonte, 100 )

  local botaoVoltar = display.newRoundedRect(cenaCreditos, x*0.5, y*0.75, x*0.5, y*0.09, 100 )
  botaoVoltar:setFillColor(0, 0.4, 0.8) 

  local textoVoltar = display.newText(cenaCreditos, 'Voltar', botaoVoltar.x, botaoVoltar.y, fonte, 100 )


  function verificaToque( event )
    if event.phase == 'began' then
       if event.target == botaoInstagram then
         system.openURL( 'https://www.instagram.com/luan_fagioni/' )

       elseif event.target == botaoLinkedin then
         system.openURL( 'https://www.linkedin.com/in/luanfagioni/' )

       elseif event.target == botaoVoltar then 
         composer.gotoScene( 'cenas.menu', {time = 500, effect = 'fade'} )
       end 
    end  
 end

botaoInstagram:addEventListener('touch', verificaToque)
botaoLinkedin:addEventListener('touch', verificaToque)
botaoVoltar:addEventListener('touch', verificaToque)

end
cena:addEventListener('create', cena)
return cena