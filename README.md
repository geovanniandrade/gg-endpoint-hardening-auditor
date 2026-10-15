# 🛡️ GG // Endpoint Hardening Auditor

[![STATUS MVP](https://img.shields.io/badge/STATUS_MVP-2F81F7?style=for-the-badge&logoColor=white)](https://github.com/geovanniandrade/gg-endpoint-hardening-auditor) [![ABRIR INTERFACE](https://img.shields.io/badge/ABRIR_INTERFACE-2F81F7?style=for-the-badge&logo=googlechrome&logoColor=white)](https://geovanniandrade.github.io/gg-endpoint-hardening-auditor/) [![REPOSITÓRIO](https://img.shields.io/badge/REPOSIT%C3%93RIO-2F81F7?style=for-the-badge&logo=github&logoColor=white)](https://github.com/geovanniandrade/gg-endpoint-hardening-auditor)

Auditoria defensiva de configurações de segurança do Windows.

## 🎯 O que faz?

Firewall, BitLocker, SMBv1, RDP e versão do Windows.

## 🚀 Como utilizar

1. Baixe e revise o [script PowerShell Collect-Hardening.ps1](collector/Collect-Hardening.ps1) ([download direto](https://raw.githubusercontent.com/geovanniandrade/gg-endpoint-hardening-auditor/main/collector/Collect-Hardening.ps1)).
2. Salve como `Collect-Hardening.ps1` na pasta **Downloads** do Windows.
3. Abra o **Windows PowerShell** na máquina autorizada e execute:

```powershell
& "$env:USERPROFILE\\Downloads\\Collect-Hardening.ps1" -OutputPath "$env:USERPROFILE\\Downloads\\gg-hardening-audit.json"
```

4. O JSON será criado em `Downloads\\gg-hardening-audit.json`. Abra a [interface web](https://geovanniandrade.github.io/gg-endpoint-hardening-auditor/) e importe esse arquivo.
5. Revise os resultados e utilize **Gerar PDF → Salvar como PDF**.

> Se o Windows bloquear a execução por política de segurança, procure orientação da equipe responsável. Não desative controles nem execute scripts sem verificar sua procedência.

## 🧪 Exemplo prático

Uma estação de laboratório apresenta SMBv1 habilitado: o relatório destaca o ponto para revisão, sem modificar a configuração.

> **Status:** versão MVP educacional, com processamento local no navegador e sem backend próprio. Não homologada para produção. Não envie dados corporativos confidenciais nem considere a saída como diagnóstico definitivo.

## 📌 Próximas melhorias

Ampliar as verificações, padronizar resultados e testar o coletor em diferentes versões do Windows.

---

**GG // Security Applications** · Segurança acessível, investigação responsável e resultados verificáveis.
