Funcion menu <- opciones
	Escribir "Bienvenido"
	Escribir "Escoja una opcion de 0 a 2 de acuerdo a lo que requiera"
	Escribir "1. Registrar estudiantes"
	Escribir "2. Asignar notas a un estudiante"
	Escribir "3. Registrar inasistencias de un estudiante"
	Escribir "4. Listado de estudiantes"
	Escribir "5. Calcular nota final"
	Escribir "0. Salir"
	leer menu
FinFuncion

Funcion registrar[dbEstudiante]
	Para i = 0 Hasta 9 Hacer
		si dbEstudiante[i, 0] = "" Entonces
			Para l = 0 Hasta 9 Hacer
				Escribir "Ingrese el codigo del estudiante"
				Leer codigo
				si dbEstudiante[i, 0] = codigo Entonces
					Escribir "EL codigo del estudiante ya existe"
					l = 10
					i = 10
				SiNo
					dbEstudiante[i, 0] = codigo
					Escribir "Ingrese el nombre del estudiante"
					Leer dbEstudiante[i, 1]
					Escribir "SI DESEA AGREGAR MAS ESTUDIANTES ESCRIBA SI"
					Leer continuar
					continuar = Mayusculas(continuar)
					Si continuar <> "SI" Entonces
						l = 10
						i = 10
					FinSi
				FinSi
			FinPara
		FinSi
	FinPara
FinFuncion

Funcion notas[dbEstudiante, dbNotas]
	Escribir "Por favor ingrese el codigo del estudiante"
	Leer codigo
	Para i = 0 Hasta 9
		si dbEstudiante[i, 0] = codigo Entonces
			Escribir "Por favor ingrese las notas de " dbEstudiante[i, 1] " en un rango de 1 a 5"
			Escribir "Siendo 1 la PEOR y 5 la MEJOR nota"
			Escribir "Nota #1"
			Leer dbNotas[i, 0]
			val <- validar[dbNotas[i, 0]]
			si val = Verdadero
				Escribir "Nota #2"
				Leer dbNotas[i, 1]
				val <- validar[dbNotas[i, 1]]
				si val = Verdadero
					Escribir "Nota #3"
					Leer dbNotas[i, 2]
					val <- validar[dbNotas[i, 2]]
				FinSi
			FinSi
		FinSi
	FinPara
FinFuncion

Funcion inas <- inasistencia[dbEstudiante]
	Escribir "Por favor ingrese el codigo del estudiante"
	Leer codigo
	Para i = 0 Hasta 9
		si dbEstudiante[i, 0] = codigo Entonces
			Escribir "Por favor ingrese el numero de inasistencias de " dbEstudiante[i, 1]
			Leer inas
		FinSi
	FinPara
FinFuncion

Funcion lista[dbEstudiante]
	Escribir "CODIGO --- NOMBRE"
	Para i = 0 Hasta 9 Hacer
		si dbEstudiante[i, 0] <> "" Entonces
			Escribir dbEstudiante[i, 0] " --- " dbEstudiante[i, 1]
		FinSi
	FinPara
FinFuncion

Funcion notaFinal[dbEstudiante, dbNotas, inas]
	Escribir "Por favor ingrese el codigo del estudiante"
	Leer codigo
	Para i = 0 Hasta 9
		si dbEstudiante[i, 0] = codigo Entonces
			si inas > 9 y inas < 16 Entonces
				menos = 0.5
			SiNo
				si inas > 15 Entonces
					menos = 1
				SiNo
					menos = 0
				FinSi
			FinSi
			notaFin = (dbNotas[i, 0] + dbNotas[i, 1] + dbNotas[i, 2])/3 - menos
			Escribir "CODIGO -- NOMBRE -- NP1 -- NP2 -- NP3 -- INASISTENCIAS -- NOTA FINAL"
			Escribir dbEstudiante[i, 0] " - " dbEstudiante[i, 1] " - " dbNotas[i, 0] " - "  dbNotas[i, 1]  " - " dbNotas[i, 2] " - " inas " - " notaFin
		FinSi
	FinPara
FinFuncion

Funcion val <- validar[nota]
	si nota < 0 o nota > 5 Entonces
		Escribir "No es una nota Valida"
	SiNo
		val = Verdadero
	FinSi
FinFuncion

Algoritmo examen
	Dimension dbEstudiante[10,2], dbNotas[10, 3]
	Repetir
		menu <- opciones
		Segun menu Hacer
			0:
				Escribir "Gracias por usar el sistema de notas"
			1:
				Escribir "REGISTRO DE ESTUDIANTES"
				registrar[dbEstudiante]
			2:
				Escribir "ASIGNACION DE NOTAS"
				notas[dbEstudiante, dbNotas]
			3:
				Escribir "REGISTRO DE INASISTENCIAS"
				inas = inasistencia[dbEstudiante]
				
			4: 
				Escribir "LISTA DE ESTUDIANTES"
				lista[dbEstudiante]
				
			5:
				Escribir "NOTA FINAL"
				notaFinal[dbEstudiante, dbNotas, inas]
			De Otro Modo:
				Escribir "Accion incorrecta"
		FinSegun
		//lista[dbEstudiante]
	Hasta Que menu = 0
FinAlgoritmo