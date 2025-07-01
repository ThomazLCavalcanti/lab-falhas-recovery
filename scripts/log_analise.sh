#!/bin/bash

LOG_DIR="/var/log/simulador_falhas"
FALHA_LOG="$LOG_DIR/falha.log"
RECOVERY_LOG="$LOG_DIR/recovery.log"

echo "=================="
echo " ANÁLISE DE LOGS"
echo "=================="

# Verifica se os arquivos de log existem
if [[ ! -f "$FALHA_LOG" || ! -f "$RECOVERY_LOG" ]]; then
    echo "[ERRO] Arquivos de log não encontrados em $LOG_DIR"
    exit 1
fi

echo -e "\n🛑 Falhas detectadas:"
grep "parado" "$FALHA_LOG"

echo -e "\n✅ Serviços restaurados:"
grep "restaurado com sucesso" "$RECOVERY_LOG"

echo -e "\n⚠️ Falhas sem recuperação:"
grep "Falha ao restaurar" "$RECOVERY_LOG"

echo -e "\n📅 Resumo das datas de falha:"
cut -d "]" -f1 "$FALHA_LOG" | tr -d "[" | sort | uniq -c

echo -e "\n📅 Resumo das datas de recovery:"
cut -d "]" -f1 "$RECOVERY_LOG" | tr -d "[" | sort | uniq -c

echo -e "\n📌 Fim da análise."
