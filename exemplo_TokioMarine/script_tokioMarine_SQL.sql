select * from cliente;

select 
	cliente.nome as nome,
    count(dependente.id_dependente) as dependentes
    from cliente, grau_parentesco, dependente
    where 
		cliente.id_cliente = grau_parentesco.id_cliente and
        grau_parentesco.id_dependente = dependente.id_dependente
	group by nome
    having dependentes = 2;

select
	cliente.nome,
    grau_parentesco.descricao
    from cliente inner join grau_parentesco on cliente.id_cliente = grau_parentesco.id_cliente;
    