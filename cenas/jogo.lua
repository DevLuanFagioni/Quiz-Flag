local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaJogo = self.view

  -- VARIAVEIS DE POSICIOMENTO
  local x = display.contentWidth
  local y = display.contentHeight

  -- DECLARACAO DOS GRUPOS (CAMADAS)
  local grupoFundo = display.newGroup()
  local grupoChina = display.newGroup()
  local grupoBrasil = display.newGroup()
  local grupoVenezuela = display.newGroup()
  local grupoMexico = display.newGroup()
  local grupoPortugal = display.newGroup()
  local grupoTela = display.newGroup()
  local grupoDerrota = display.newGroup()
  local grupoVitoria = display.newGroup()

  cenaJogo:insert( grupoFundo )
  cenaJogo:insert( grupoChina )
  cenaJogo:insert( grupoBrasil )
  cenaJogo:insert( grupoVenezuela )
  cenaJogo:insert( grupoMexico )
  cenaJogo:insert( grupoPortugal )
  cenaJogo:insert( grupoTela )
  cenaJogo:insert( grupoDerrota )
  cenaJogo:insert( grupoVitoria )

  -- DECLARACAO DAS PERGUNTAS
  local pergunta = {
    china = {
      bandeira = 'recursos/bandeiras/china.png',
      respostas = { 'China', 'Japão', 'Marrocos' }
    },
    brasil = {
      bandeira = 'recursos/bandeiras/brazil-.png',
      respostas = {'Brasil', 'Colombia', 'Argentina'},
    },
    venezuela = {
      bandeira = 'recursos/bandeiras/venezuela.png',
      respostas = {'Colombia', 'Venezuela', 'Chile'}
    },
    mexico = {
      bandeira = 'recursos/bandeiras/mexico.png',
      respostas = {'Colombia', 'Venezuela', 'Mexico'}
    },
    portugal = {
      bandeira = 'recursos/bandeiras/portugal.png',
      respostas = {'Brasil', 'Espanha', 'Portugal'}
    }
  }

  -- DECLARACAO DOS AUDIOS

  --EFEITOS SONOROS
  local audioCerto = audio.loadSound( 'recursos/audios/certo.mp3' )
  local audioErro = audio.loadSound( 'recursos/audios/Erro.mp3' )
  

  -- VARIAVEL QUE LIMITA O TOQUE NAS RESPOSTAS
  local limitaToque = true

  -- DECLARACAO DO FUNDO
  local fundo = display.newImageRect(grupoFundo, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5
  fundo:setFillColor(0,0.8,0.6)

  -- DECLARAÇÃO DO TEMPO
  local tempo = 15
  local tempoTexto = display.newText(grupoTela, tempo, x*0.1, y*0.07, fonte, 250  )

  -- DECLARACAO DERROTA
  local fundoDerrota = display.newRect(grupoDerrota ,x*0.5, y*0.5, x, y )
  fundoDerrota:setFillColor(0, 0, 0)
  fundoDerrota.alpha = 0.9

  local textoDerrota = display.newText(grupoDerrota,'DERROTA' ,x*0.5, y*0.4, fonte, 250 )

  local botaoDerrota = display.newRoundedRect(grupoDerrota, x*0.5, y*0.55, x*0.6, y*0.08, 100 )

  local botaoDerrotaTexto = display.newText(grupoDerrota, 'REINICIAR', botaoDerrota.x, botaoDerrota.y, fonte, 100 )
  botaoDerrotaTexto:setFillColor(0,0,0)

  grupoDerrota.alpha = 0


  -- DECLARACAO VITORIA
  local fundoVitoria = display.newRect(grupoVitoria ,x*0.5, y*0.5, x, y )
  fundoVitoria:setFillColor(0, 0, 0)
  fundoVitoria.alpha = 0.9

  local textoVitoria = display.newText(grupoVitoria,'VOCE GANHOU' ,x*0.5, y*0.4, fonte, 250 )

  local botaoVitoria = display.newRoundedRect(grupoVitoria, x*0.5, y*0.55, x*0.6, y*0.08, 100 )

  local botaoVitoriaTexto = display.newText(grupoVitoria, 'CREDITOS', botaoVitoria.x, botaoVitoria.y, fonte, 100 )
  botaoVitoriaTexto:setFillColor(0,0,0)

  grupoVitoria.alpha = 0


  -- DECLARACAO CHINA
  local bandeiraChina = display.newImageRect( grupoChina, pergunta.china.bandeira, x*0.5, x*0.5 )
  bandeiraChina.x = x*0.5
  bandeiraChina.y = y*0.23

  local blocoChina = display.newRoundedRect(grupoChina, x*0.5, y*0.67, x*0.7, y*0.5, 100 )

  local r1China = display.newRoundedRect(grupoChina, x*0.5, y*0.53, x*0.5, y*0.09, 100 )
  r1China:setFillColor(0, 0.4, 0.8) 

  local r1ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[1], r1China.x, r1China.y, fonte, 100)

  local r2China = display.newRoundedRect(grupoChina, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2China:setFillColor(0, 0.4, 0.8) 

  local r2ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[2], r2China.x, r2China.y, fonte, 100)

  local r3China = display.newRoundedRect(grupoChina, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3China:setFillColor(0, 0.4, 0.8) 

  local r3ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[3], r3China.x, r3China.y, fonte, 100)




  -- DECLARACAO BRASIL
  local bandeiraBrasil = display.newImageRect( grupoBrasil, pergunta.brasil.bandeira, x*0.5, x*0.5 )
  bandeiraBrasil.x = x*0.5
  bandeiraBrasil.y = y*0.23

  local blocoBrasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.67, x*0.7, y*0.5, 100 )

  local r1Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.53, x*0.5, y*0.09, 100 )
  r1Brasil:setFillColor(0, 0.4, 0.8) 

  local r1BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[1], r1Brasil.x, r1Brasil.y, fonte, 100)

  local r2Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Brasil:setFillColor(0, 0.4, 0.8) 

  local r2BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[2], r2Brasil.x, r2Brasil.y, fonte, 100)

  local r3Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Brasil:setFillColor(0, 0.4, 0.8) 

  local r3BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[3], r3Brasil.x, r3Brasil.y, fonte, 100)

  grupoBrasil.alpha = 0

  -- DECLARACAO VENEZUELA
  local bandeiraVenezuela = display.newImageRect( grupoVenezuela, pergunta.venezuela.bandeira, x*0.5, x*0.5 )
  bandeiraVenezuela.x = x*0.5
  bandeiraVenezuela.y = y*0.23

  local blocoVenezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.67, x*0.7, y*0.5, 100 )

  local r1Venezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.53, x*0.5, y*0.09, 100 )
  r1Venezuela:setFillColor(0, 0.4, 0.8) 

  local r1VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[1], r1Venezuela.x, r1Venezuela.y, fonte, 100)

  local r2Venezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Venezuela:setFillColor(0, 0.4, 0.8) 

  local r2VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[2], r2Venezuela.x, r2Venezuela.y, fonte, 100)

  local r3Venezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Venezuela:setFillColor(0, 0.4, 0.8) 

  local r3VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[3], r3Venezuela.x, r3Venezuela.y, fonte, 100)

  grupoVenezuela.alpha = 0


  -- DECLARACAO MEXICO
  local bandeiraMexico = display.newImageRect( grupoMexico, pergunta.mexico.bandeira, x*0.5, x*0.5 )
  bandeiraMexico.x = x*0.5
  bandeiraMexico.y = y*0.23

  local blocoMexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.67, x*0.7, y*0.5, 100 )

  local r1Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.53, x*0.5, y*0.09, 100 )
  r1Mexico:setFillColor(0, 0.4, 0.8) 

  local r1MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[1], r1Mexico.x, r1Mexico.y, fonte, 100)

  local r2Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Mexico:setFillColor(0, 0.4, 0.8) 

  local r2MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[2], r2Mexico.x, r2Mexico.y, fonte, 100)

  local r3Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Mexico:setFillColor(0, 0.4, 0.8) 

  local r3MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[3], r3Mexico.x, r3Mexico.y, fonte, 100)

  grupoMexico.alpha = 0

  -- DECLARACAO PORTUGAL
  local bandeiraPortugal = display.newImageRect( grupoPortugal, pergunta.portugal.bandeira, x*0.5, x*0.5 )
  bandeiraPortugal.x = x*0.5
  bandeiraPortugal.y = y*0.23

  local blocoPortugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.67, x*0.7, y*0.5, 100 )

  local r1Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.53, x*0.5, y*0.09, 100 )
  r1Portugal:setFillColor(0, 0.4, 0.8) 

  local r1PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[1], r1Portugal.x, r1Portugal.y, fonte, 100)

  local r2Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Portugal:setFillColor(0, 0.4, 0.8) 

  local r2PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[2], r2Portugal.x, r2Portugal.y, fonte, 100)

  local r3Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Portugal:setFillColor(0, 0.4, 0.8) 

  local r3PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[3], r3Portugal.x, r3Portugal.y, fonte, 100)

  grupoPortugal.alpha = 0




  -- DECLARACAO DAS FUNCIONALIDADES
  function verificaChina( event )
    if event.phase == 'began' and grupoChina.alpha == 1 and limitaToque == true then
      if event.target == r1China then
        r1China:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )
        
        timer.performWithDelay( 1000, function()
          transition.to( grupoChina, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoBrasil, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


      elseif event.target == r2China then
        r2China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r3China then  
        r3China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1China:addEventListener('touch', verificaChina)
  r2China:addEventListener('touch', verificaChina)
  r3China:addEventListener('touch', verificaChina)


  function verificaBrasil( event )
    if event.phase == 'began' and grupoBrasil.alpha == 1 and limitaToque == true then
      if event.target == r1Brasil then
        r1Brasil:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoBrasil, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVenezuela, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      elseif event.target == r2Brasil then
        r2Brasil:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Brasil then
        r3Brasil:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1Brasil:addEventListener('touch', verificaBrasil)
  r2Brasil:addEventListener('touch', verificaBrasil)
  r3Brasil:addEventListener('touch', verificaBrasil)


  function verificaVenezuela( event )
    if event.phase == 'began' and grupoVenezuela.alpha == 1 and limitaToque == true then
      if event.target == r1Venezuela then
        r1Venezuela:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoVenezuela, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoMexico, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      elseif event.target == r2Venezuela then
        r2Venezuela:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Venezuela then
        r3Venezuela:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1Venezuela:addEventListener('touch', verificaVenezuela)
  r2Venezuela:addEventListener('touch', verificaVenezuela)
  r3Venezuela:addEventListener('touch', verificaVenezuela)


  function verificaMexico( event )
    if event.phase == 'began' and grupoMexico.alpha == 1 and limitaToque == true then
      if event.target == r1Mexico then
        r1Mexico:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r2Mexico then
        r2Mexico:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Mexico then
        r3Mexico:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoMexico, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoPortugal, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Mexico:addEventListener('touch', verificaMexico)
  r2Mexico:addEventListener('touch', verificaMexico)
  r3Mexico:addEventListener('touch', verificaMexico)


  function verificaPortugal( event )
    if event.phase == 'began' and grupoPortugal.alpha == 1 and limitaToque == true then
      if event.target == r1Portugal then
        r1Portugal:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r2Portugal then
        r2Portugal:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Portugal then
        r3Portugal:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoPortugal, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVitoria, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Portugal:addEventListener('touch', verificaPortugal)
  r2Portugal:addEventListener('touch', verificaPortugal)
  r3Portugal:addEventListener('touch', verificaPortugal)


  function atualizaTempo()
    if tempo > 0 and grupoVitoria.alpha == 0 then
      tempo = tempo - 1
      tempoTexto.text = tempo
    end
  end
  timer.performWithDelay( 1000, atualizaTempo, 0 )
  
  function adicionaTempo()
    if tempo > 0 then
      tempo = tempo + 10
      tempoTexto.text = tempo
    end
  end

  function diminuiTempo()
    if tempo >= 5 then
      tempo = tempo - 5
      tempoTexto.text = tempo

    elseif tempo < 5 then
      tempo = 0
      tempoTexto.text = tempo
    end
  end

  function verificaTempo()
    if tempo == 0 then
      grupoDerrota.alpha = 1
      grupoBrasil.alpha = 0
      grupoChina.alpha = 0
    end
  end
  Runtime:addEventListener('enterFrame', verificaTempo )

  function reinicia()
    composer.removeScene( 'cenas.jogo' )
  end

  function derrota( event )
    if event.phase == 'began' and grupoDerrota.alpha == 1 then
      reinicia()
      composer.gotoScene( 'cenas.menu' , {
        time = 500, 
        effect = 'fade'
      } )
    end
  end
  botaoDerrota:addEventListener('touch', derrota)


  function vitoria( event )
    if event.phase == 'began' and grupoVitoria.alpha == 1 then
      reinicia()
      composer.gotoScene( 'cenas.creditos' , {
        time = 500, 
        effect = 'fade'
      } )
    end
  end
  botaoVitoria:addEventListener('touch', vitoria)



end
cena:addEventListener('create', cena)
return cena