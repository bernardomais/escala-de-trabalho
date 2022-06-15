package br.com.qintess.entities_old;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;


@Entity(name = "TB_TURNO")
@Inheritance(strategy = InheritanceType.JOINED)
public class TurnoEntity {

  @Id
  private Integer id;
  private String nome;
  private String sigla;
  private boolean trabalhaNoFeriado;
  private String horaInicio;
  private String horaTermino;
  private String totalHoras;


}