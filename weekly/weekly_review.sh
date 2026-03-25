#!/bin/bash
# @tomozo_gr 毎週日曜21時 Instagram分析スクリプト
# cron設定: 0 21 * * 0 /home/user/gr/weekly/weekly_review.sh

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DATE=$(date +%Y-%m-%d)
REPORT_DIR="$REPO_DIR/weekly/reports"

mkdir -p "$REPORT_DIR"

echo "📊 @tomozo_gr 週次レビュー開始: $DATE"

# Claude Code CLI でレビュープロンプトを実行
claude --print \
  --system-prompt "$(cat "$REPO_DIR/CLAUDE.md")" \
  "$(cat "$REPO_DIR/weekly/instagram_review_prompt.md")

今日は $DATE（日曜日）です。
weekly/reports/ フォルダに今週のレポートを ${DATE}_review.md として保存してください。" \
  > "$REPORT_DIR/${DATE}_review.md"

echo "✅ レポート保存: $REPORT_DIR/${DATE}_review.md"
