# 🛡️ GG // Endpoint Hardening Auditor

[![STATUS MVP](https://img.shields.io/badge/STATUS_MVP-2F81F7?style=for-the-badge&logoColor=white)](https://github.com/geovanniandrade/gg-endpoint-hardening-auditor) [![ABRIR INTERFACE](https://img.shields.io/badge/ABRIR_INTERFACE-2F81F7?style=for-the-badge&logo=googlechrome&logoColor=white)](https://geovanniandrade.github.io/gg-endpoint-hardening-auditor/) [![REPOSITÓRIO](https://img.shields.io/badge/REPOSIT%C3%93RIO-2F81F7?style=for-the-badge&logo=github&logoColor=white)](https://github.com/geovanniandrade/gg-endpoint-hardening-auditor)

Auditoria defensiva de configurações de segurança do Windows.

## 🎯 O que faz?

Firewall, BitLocker, SMBv1, RDP e versão do Windows.

## 🧭 Modos de utilização

**🧪 Demonstração:** utilize **Carregar exemplo fictício** na interface. Não requer executar PowerShell.

**🏢 Corporativo:** a coleta exige autorização e método de execução aprovado. O script atual é **não assinado**; não altere políticas de PowerShell nem remova marca de origem para contornar controles. Revise o código e homologue a distribuição antes de usá-lo em endpoints corporativos.

## 🚀 Como utilizar (apenas em ambiente autorizado)

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


---
## 🧭 Navegação e demonstração

- [🌐 Interface web](https://geovanniandrade.github.io/gg-endpoint-hardening-auditor/)
- [📋 Checklist de qualidade, testes e limitações](QUALITY.md)
- [🧪 Exemplo fictício para demonstração](examples/gg-hardening-demo.json)

**Identidade visual:** Azul. **Versão:** MVP 0.2 (identificador documental; não significa homologação).

**Fluxo recomendado:** usar o exemplo fictício → revisar os resultados → abrir relatório → salvar PDF apenas após conferir o conteúdo. Em ambientes reais, verificar autorização, origem dos dados e precisão das conclusões. Nunca incluir inventário, nomes reais de usuários ou dados sensíveis em issues e repositórios públicos.

**Limites:** ferramentas de triagem, não substituem avaliação profissional nem comprovam conformidade. As validações executadas e pendentes estão em [QUALITY.md](QUALITY.md).
