#!/bin/bash

# Nome do serviço a ser reiniciado (deve ser o mesmo usado no simular_falha.sh)
SERVICO="apache2"
LOG_DIR="/var/log/simulador_falhas"
LOG_FILE="$LOG_DIR/recovery.log"

# Criar diretório de logs se não existir
mkdir -p "$LOG_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Tentando restaurar o serviço: $SERVICO" | tee -a "$LOG_FILE"

# Verifica se o serviço está parado
if ! systemctl is-active --quiet "$SERVICO"; then
    sudo systemctl start "$SERVICO"
    sleep 2
    if systemctl is-active --quiet "$SERVICO"; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Serviço $SERVICO restaurado com sucesso." | tee -a "$LOG_FILE"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Falha ao restaurar o serviço $SERVICO." | tee -a "$LOG_FILE"
    fi
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Serviço $SERVICO já está ativo." | tee -a "$LOG_FILE"
fi

# Adicionar marcação para facilitar análise no log
echo "-----------------------------" >> "$LOG_FILE"
