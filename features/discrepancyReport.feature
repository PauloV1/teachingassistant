Feature: Discrepancy Report
	As a professor de uma Turma 
	I want to comparar minha avaliação de um aluno com a autoavaliação deste aluno
	So that eu posso verificar as discrepâncias das avaliações ao acessar o relatório de discrepância e notificar o aluno quando houver discrepância

Scenario: Visualização sem 
	Given eu estou logado como professor com login “prof1”
	And estou na tela de relatório de discrepâncias
	And não tem alunos com discrepância de notas
	When o relatório é exibido
	Then posso visualizar a mensagem “Nenhuma discrepância encontrada”
	And visualizar  a lista de alunos sem marcações de discrepância.
Scenario: Visualização com discrepância em alguns alunos
	Given eu estou logado como professor com login “prof1”
	And estou na tela de relatório de discrepâncias
	And dois os alunos A e B da turma têm mais de 25% das metas com autoavaliações acima do professor
	When o relatório é exibido
	Then posso visualizar a lista dos alunos discrepantes
	And visualizar a quantidade e o percentual de discrepantes em relação à turma.
