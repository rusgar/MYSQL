Algoritmo Dec_Romano
	Escribir "Ingrese el numero a convertir:"
	Leer n
	cad<-""
	Mientras n<>0 Hacer
		si n>=1000 entonces
			cad<-cad+"M"
			n<-n-1000
		sino
			si n>=900 Entonces
				cad<-cad+"DM"
				n<-n-900
			Sino
				si n>=500 Entonces
					cad<-cad+"D"
					n<-n-500
				Sino
					si n>=400 entonces
						cad<-cad+"CD"
						n<-n-400
					Sino
						si n>=100 Entonces
							cad<-cad+"C"
							n<-n-100
						Sino
							si n>=90 Entonces
								cad<-cad+"XC"
								n<-n-90
							Sino
								si n>=50 Entonces
									cad<-cad+"L"
									n<-n-50
								Sino
									si n>=40 Entonces
										cad<-cad+"XL"
										n<-n-40
									Sino
										si n>=10 Entonces
											cad<-cad+"X"
											n<-n-10
										Sino
											si n>=9 Entonces
												cad<-cad+"IX"
												n<-n-9
											Sino
												si n>=5 Entonces
													cad<-cad+"V"
													n<-n-5
												Sino
													si n>=4 Entonces
														cad<-cad+"IV"
														n<-n-4
													Sino
														si n>=1 Entonces
															cad<-cad+"I"
															n<-n-1
														FinSi
													FinSi
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
		
	Fin Mientras
	
	Escribir "Numero Romano:"
	Mostrar cad
FinAlgoritmo
