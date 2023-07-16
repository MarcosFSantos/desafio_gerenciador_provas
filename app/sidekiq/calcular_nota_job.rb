class CalcularNotaJob
  include Sidekiq::Job

  def perform(participante_id, prova_id)
    @participante = Participante.find_by_id(participante_id)

    if @participante.nil?
      raise StandardError, 'Participante não encontrado'
    end

    @resposta = Resposta.find_by(participante_id: participante_id, prova_id: prova_id)

    if @resposta.nil?
      raise StandardError, 'Resposta não encontrada'
    end

    @prova = @participante.provas.find_by_id(prova_id)

    if @prova.nil?
      raise StandardError, 'Prova não encontrada'
    end

    # Incrementa 1 para cada acerto
    @resultados_corretos = 0.0
    @resposta.dados.each do |questao_id, resposta_usuario|
      resposta_correta = @prova.respostas[questao_id.to_i]
      next if resposta_correta.nil?
      next unless resposta_usuario == resposta_correta

      @resultados_corretos += 1.0
    end
    
    # Calcula a nota dividindo o número de acertos pelo total de questões
    total_questoes = @resposta.dados.size
    @nota = @resultados_corretos / total_questoes * 10
    @resposta.nota = @nota
    @resposta.save
  end
end