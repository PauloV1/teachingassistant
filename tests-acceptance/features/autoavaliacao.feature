Feature: autoavaliação
	As um aluno de uma turma
	I want to avaliar meus resultados em relação à cada uma das metas de aprendizagem da turma
	So that eu posso apresentar ao professor a forma como avalio meu próprio desempenho 
	
	As um professor responsável por uma turma
	I want analisar as autoavaliações dos alunos e compará-las com a minha avaliação
	So that eu posso identificar discrepâncias, contactar os alunos para entender ou explicar as metas atribuídas e corrigir algum erro caso necessário

GUI Scenario 1: Aluno tenta remover uma meta que não foi inserida
Given eu estou logado como o aluno “pvbs”
And eu estou na página “Realizar autoavaliação”
When eu removo o conceito da meta “Entender conceitos de requisitos”
Then eu vejo uma mensagem de erro informando que não é possível remover um conceito não inserido

GUI Scenario 2: Aluno confirma a autoavaliação sem preencher todas as metas
Given eu estou logado como o aluno “pvbs”
And eu estou na página “Realizar autoavaliação”
And eu vejo as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” vazias
When eu seleciono o conceito “MA” para “Entender conceitos de requisitos”
And eu seleciono o conceito “MPA” para “Especificar requisitos com qualidade”
And eu confirmo a seleção
Then eu vejo uma mensagem de erro informando que há campos não preenchidos

GUI Scenario 3: Aluno insere todas as metas e confirma a autoavaliação antes do final do período letivo
Given eu estou logado como o aluno “pvbs”
And eu estou na página “Inicial”
When seleciono a opção “Realizar autoavaliação”
Then eu vejo uma mensagem informando que só é permitido realizar a autoavaliação no final do período letivo

GUI Scenario 4: Aluno remove uma meta e confirma
Given eu estou logado como o aluno “pvbs”
And eu estou na página “Realizar autoavaliação”
And eu vejo as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” com conceitos “MA”, “MPA” e “MPA” respectivamente
When eu removo o conceito “MA” da meta “Entender conceitos de requisitos”
And confirmo a autoavaliação
Then eu vejo uma mensagem de erro informando que há campos não preenchidos

Service Scenario 1: Rejeita autoavaliação se houver alguma meta sem conceito
Given o aluno “pvbs” está armazenado no sistema com as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” vazios
When eu adiciono “MANA” na meta “Entender conceitos de requisitos”
And eu adiciono “MA” na meta “Especificar requisitos com qualidade”
Then o aluno “pvbs” está armazenado no sistema com as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” vazios

