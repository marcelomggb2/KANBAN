# Contributing

Obrigado por contribuir com o Wa Flow OSS.

## Fluxo recomendado

1. Crie uma branch a partir de `main`.
2. Faça mudancas pequenas e focadas.
3. Rode os checks locais antes do commit.
4. Abra PR descrevendo impacto e risco.

## Checks locais minimos

```bash
node -e "JSON.parse(require('fs').readFileSync('manifest.json','utf8')); console.log('manifest OK')"
chmod +x scripts/scan-secrets.sh
scripts/scan-secrets.sh
```

## Regras de seguranca para contribuicoes

- Nao adicione chaves, tokens ou segredos no repositorio.
- Nao amplie `host_permissions` sem justificativa tecnica.
- Evite `"<all_urls>"` em extensoes de producao.
- Prefira configuracao local para integracoes externas.

## Escopo desta base

A base atual contem artefatos compilados (`*.bundle.js`) e modulo WASM.
Contribuicoes devem preservar compatibilidade com a extensao carregada no Chrome.
