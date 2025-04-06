SELECT 
    d.nome AS Departamento_nome, 
	-- conta os empregados pela matrícula por deptarmento
    COUNT(e.matr) AS Quantidade_empregados, 
	-- realiza as médias, substitui nulo e 2 casas decimais
    ROUND(COALESCE(AVG(v.valor), 0), 2) AS Media_salarial, 
    ROUND(COALESCE(MAX(v.valor), 0), 2) AS Maior_salario, 
    ROUND(COALESCE(MIN(v.valor), 0), 2) AS Menor_salario 
FROM 
    departamento d 
	-- concatena os resultados com os departamentos (codigo dep é a chave)
JOIN 
    divisao div ON d.cod_dep = div.cod_dep 
JOIN 
    empregado e ON div.cod_divisao = e.lotacao_div 
JOIN 
    emp_venc ev ON e.matr = ev.matr 
JOIN 
    vencimento v ON ev.cod_venc = v.cod_venc 
GROUP BY 
    d.nome 
ORDER BY 
    media_salarial DESC; 