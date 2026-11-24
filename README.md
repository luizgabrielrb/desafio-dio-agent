# dio-agent-appsec-mentor

Evolução do [DIO Agent](https://github.com/digitalinnovationone/dio-agent) em um **mentor de cibersegurança**: ele não responde direto, mas entende o contexto, avalia **impacto, probabilidade e severidade** e orienta a correção. Nenhum modelo foi treinado: o comportamento vem só dos arquivos.

## Especialização e motivo
Escolhi **análise de vulnerabilidades (AppSec)**, porque é onde um agente genérico mais erra: dá comandos sem perguntar nada. Um profissional primeiro entende o ambiente. Esta especialização ensina esse processo ao agente.

## Arquivos criados ou alterados
| Arquivo | Função |
|---|---|
| `skills/vulnerability-analysis/SKILL.md` | Roteiro em 5 etapas, regras defensivas e formato fixo de resposta |
| `skills/vulnerability-analysis/README.md` | Explica a skill para pessoas |
| `agent/knowledge/security-basics.md` | Vulnerabilidade, ameaça, risco, tríade CIA, MITRE/CWE e boas práticas |
| `agent/persona.md` (alterado) | Trecho "Modo mentor de cibersegurança" |
| `AGENTS.md` (alterado) | Linha na tabela de skills |
| `lab/app.py` e `lab/app_fixed.py` | App de laboratório vulnerável e sua versão corrigida |
| `docs/prompts-de-teste.md` | Prompts usados nos testes |

## Como rodar
1. Instale o Hermes conforme a documentação indicada no README do DIO Agent.
2. `git clone` deste repositório e abra o terminal **dentro da pasta do projeto**.
3. Execute `hermes` e use os prompts de `docs/prompts-de-teste.md`.
4. Para o laboratório: `pip install flask` e `python lab/app.py` (somente em `127.0.0.1`).

## Melhoria escolhida
**Formato de saída padronizado**: toda análise termina com Impacto, Probabilidade e Severidade (regra de combinação no `SKILL.md`), o que permite comparar casos diferentes.

## Evidências
Prints em `docs/prints/`: análise do `app.py`, perguntas de contexto do agente e comparação com um chat genérico.

## Aviso
Todos os testes usam apenas código e servidores meus, de laboratório.
