# Security Policy

## Reporting

Se voce identificar vulnerabilidade de seguranca, abra issue privada ou entre em contato com o mantenedor antes da divulgacao publica.

## Boas praticas adotadas nesta versao

- Escopo de host reduzido e explicito no `manifest.json`.
- Remocao de token hardcoded identificado durante auditoria.
- Remocao de artefato zip redundante para reduzir risco de drift de distribuicao.

## Recomendacoes continuas

- Rotacionar chaves de servicos externos regularmente.
- Nao commitar segredos em bundles.
- Executar varredura de segredos antes de cada release.
