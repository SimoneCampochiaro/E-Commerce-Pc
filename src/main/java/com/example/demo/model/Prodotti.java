package com.example.demo.model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "prodotti")
@Data
public class Prodotti {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_prodotto")
    private Integer idProdotto;

    @Column(name = "componente")
    private String componente;

    @Column(name = "descrizione")
    private String descrizione;

    @Column(name = "codice_ian13")
    private String codiceIan13;

    @Column(name = "quantita")
    private Integer quantita;

    @Column(name = "disponibilita")
    private Boolean disponibilita;

    @Column(name="prezzo_di_acquisto")
    private Double prezzoDiAcquisto;

    @Column(name = "prezzo_di_vendita")
    private Double prezzoDiVendita;

    @JoinColumn(name = "id_anagrafica_fornitore")
    @ManyToOne
    @JsonIgnoreProperties("prodotti")
    private Fornitori fornitori;

    @JoinColumn(name = "id_assemblato")
    @ManyToOne
    @JsonIgnoreProperties("prodotti")
    private Assemblati assemblati;

    @OneToMany(mappedBy = "prodotti")
    @JsonIgnore
    private List<ProdottiAssemblato> prodottiAssemblato;

    @OneToMany(mappedBy = "prodotti")
    @JsonIgnore
    private List<ProdottiNelCarrello> prodottiNelCarrello;
}
