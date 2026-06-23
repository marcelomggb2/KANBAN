#!/usr/bin/env node
const fs = require('fs');

const raw = fs.readFileSync('manifest.json', 'utf8');
const manifest = JSON.parse(raw);

function fail(msg) {
  console.error(`[ERROR] ${msg}`);
  process.exit(1);
}

if (manifest.manifest_version !== 3) {
  fail('manifest_version deve ser 3.');
}

if (!Array.isArray(manifest.host_permissions)) {
  fail('host_permissions ausente ou invalido.');
}

if (manifest.host_permissions.includes('<all_urls>')) {
  fail('host_permissions nao pode conter <all_urls>.');
}

if (!Array.isArray(manifest.permissions) || !manifest.permissions.includes('storage')) {
  fail('permissao storage obrigatoria para persistencia local.');
}

console.log('[OK] manifest.json valido e dentro da politica OSS minima.');
