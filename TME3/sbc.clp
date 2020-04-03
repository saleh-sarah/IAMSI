;;; IAMSI 2020 : séance TME 3
;;; sbc.clp

; La règle qui permet de remplir la base de faits
; elle est facultative si on décide d'entrer les faits à la
; main dans CLIPS
(defrule my_init
	 (initial-fact)
=>
	(watch facts)
	(watch rules)

	(assert (taches_rouges patient ))
	(assert (peu_boutons patient))
	(assert (sensation_froid patient))
	(assert (forte_fievre patient))
	(assert (yeux_douleureux patient))
	(assert (amygdales_rouges patient))
	(assert (peau_pele patient))
	(assert (peau_seche patient))
)

; Eruption cutanée1
(defrule eruption_cutanee1
	 (peu_boutons ?x)
=>
	(assert (erruption_cutanee ?x ))
)

; Eruption cutanée2
(defrule eruption_cutanee2
	 (beaucoup_boutons ?x)
=>
	(assert (erruption_cutanee ?x ))
)

; exantheme1
(defrule exantheme1
	 (erruption_cutanee ?x)
=>
	(assert (exantheme ?x ))
)

; exantheme2
(defrule exantheme2
	 (rougeurs ?x)
=>
	(assert (exantheme ?x ))
)


; Etat fébrile1
(defrule etat_febrile1
	 (fievre_forte ?x )
=>
	(assert (etat_febrile ?x))
)

; Etat fébrile2
(defrule etat_febrile2
	 (sensation_froid ?x )
=>
	(assert (etat_febrile ?x))
)

; Signe suspect
(defrule signe_suspect
	 (amygdales_rouges ?x )
	(taches_rouges ?x)
	(peau_pele ?x)
=>
	(assert (signe_suspect ?x))
)

; Rougeole1
(defrule rougeole1
	 (etat_febrile ?x )
	(yeux_douloureux ?x)
	(exantheme ?x)
=>
	(assert (rougeole ?x))
)

; Rougeole2
(defrule rougeole2
	 (signe_suspect ?x )
	(forte_fievre ?x)
=>
	(assert (rougeole ?x))
)


; Rectification_diagnostic
(defrule rectif_pas_rougeole
	 ?r <- (rougeole ?x )
	(peu_fievre ?x)
	(peu_boutons ?x)
=>
	(retract ?r)
)


; Douleur1
(defrule douleur1
	 (yeux_douleureux ?x )
=>
	(assert (douleur ?x))
)

; Douleur2
(defrule douleur2
	 (dos_douleureux ?x )
=>
	(assert (douleur ?x))
)

; grippe
(defrule grippe
	 (dos_douleureux ?x )
	(etat_febrile ?x)
=>
	(assert (grippe ?x))
)

; Diagnostic
(defrule diagnostic
	 (not (rougeole ?x) )
=>
	(assert (rubeole ?x))
	(assert (varicelle ?x))
)

; Varicelle
(defrule varicelle
	 (fortes_demangeaisons ?x)
	(pustules ?x)
=>
	(assert (varicelle ?x))
)

; Rubeole
(defrule rubeole
	 (peau_seche ?x)
	(inflammations_ganglions ?x)
	( not (pustules ?x))
	(not (sensation_froid ?x))
=>
	(assert (rubeole ?x))
)


; ----- fin fichier famille.clp
