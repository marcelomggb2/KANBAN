# Wa Flow OSS

Extensao Chrome (Manifest V3) para operacao de CRM/Kanban no WhatsApp Web.

## Objetivo

Esta versao foi preparada para publicacao open source com foco em:
- reducao de superficie de permissao
- remocao de segredos hardcoded conhecidos
- manutencao das funcoes internas principais de operacao local

## Instalar localmente

1. Abra `chrome://extensions`.
2. Ative `Modo do desenvolvedor`.
3. Clique em `Carregar sem compactacao`.
4. Selecione a pasta do projeto.
5. Abra `https://web.whatsapp.com/`.

## Permissoes

O manifesto usa allowlist explicita de dominios necessarios em vez de `"<all_urls>"`.

## Seguranca

- Nao publique chaves de API no codigo.
- Use configuracao local para integracoes externas.
- Revise periodicamente `host_permissions`.

## Aviso sobre artefatos compilados

O projeto atual contem bundles compilados (`*.bundle.js`) e modulo WASM de validacao.
Para colaboracao aberta ideal, recomenda-se publicar tambem o codigo-fonte de build em fase posterior.
