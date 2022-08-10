class ListarTurmasEntity {
  final String nome;
  final String id;
  final String horaEntrada;
  final String horaSaida;
  final String dataInicio;
  final String dataFim;
  final bool status;
  final String disciplina;

  ListarTurmasEntity(this.nome, this.id, this.status, this.horaEntrada, this.horaSaida, this.dataInicio, this.dataFim, this.disciplina);

}
