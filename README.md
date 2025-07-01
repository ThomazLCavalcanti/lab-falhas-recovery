# Projeto: Simulação de Falhas e Recovery com Zabbix

Este projeto demonstra a simulação de falhas em serviços Linux com análise de logs, alertas via Zabbix e scripts de recuperação automatizada.

## Objetivo
Demonstrar conhecimento prático em monitoramento, resposta a incidentes, automação de tarefas e troubleshooting de serviços Linux.

## Componentes

- **scripts/**: Contém os scripts de simulação de falhas, análise de logs e restauração do serviço.
- **zabbix/**: Template e trigger para importar no Zabbix e monitorar o serviço simulado.
- **docs/**: Imagens e documentação explicando a estrutura, alertas e simulações realizadas.
- **services/**: Arquivo de serviço do Apache2 usado como exemplo de monitoramento.

## Como Funciona

1. O script `simular_falha.sh` desativa um serviço (ex: apache2).
2. O Zabbix detecta a falha via trigger configurada e gera um alerta.
3. O script `log_analise.sh` analisa os logs da falha para verificar padrões ou mensagens de erro.
4. O script `restaurar_servico.sh` reinicia o serviço e registra a ação em log.
5. Toda a atividade é documentada e monitorada, simulando uma rotina de resposta a incidentes.

## Pré-requisitos

- Zabbix configurado e acessível
- Sistema Linux com permissões de root
- Serviço apache2 instalado e habilitado

## Autor

Thomaz Cavalcanti - Projeto de portfólio para área de Redes, Infraestrutura e Monitoramento.
