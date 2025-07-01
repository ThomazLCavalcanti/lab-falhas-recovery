#!/bin/bash

# Nome do serviço a ser parado (pode ser alterado para outro, como nginx, mysql, etc.)
SERVICO="apache2"
LOG_DIR="/var/log/simulador_falhas"
LOG_FILE="$LOG_DIR/falhas.log"

# Criar diretório de logs se não existir
mkdir -p "$LOG_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Simulando falha no serviço: $SERVICO" | tee -a "$LOG_FILE"

# Parar o serviço
if systemctl is-active --quiet "$SERVICO"; then
    sudo systemctl stop "$SERVICO"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Serviço $SERVICO parado com sucesso." | tee -a "$LOG_FILE"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Serviço $SERVICO já estava parado." | tee -a "$LOG_FILE"
fi

# Adicionar marcação para facilitar análise no log
echo "-----------------------------" >> "$LOG_FILE"
