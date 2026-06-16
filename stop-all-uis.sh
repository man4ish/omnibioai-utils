#!/bin/bash
echo 'Stopping all OmniBioAI React UIs...'
pkill -f 'serve -s dist' 2>/dev/null || true
echo 'Done.'
