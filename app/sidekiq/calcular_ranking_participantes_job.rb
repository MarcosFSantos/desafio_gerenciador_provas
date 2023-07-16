class CalcularRankingParticipantesJob
  include Sidekiq::Job

  def perform(prova_id)
    @prova = Prova.find_by_id(prova_id)
    @ranking = {}
    lista_participantes = {}
    @prova.participantes.each do |participante|
      @resposta = Resposta.find_by(participante_id: participante.id, prova_id: prova_id)
      next unless @resposta
      next if @resposta.nota.nil?
      lista_participantes[@resposta.nota] = participante
    end
    @ranking = lista_participantes.sort_by { |nota, _| -nota }.to_h
    @ranking
  end
end