#!/usr/bin/env bash
# README.md の目次セクションを、実ファイルから生成して置き換える。
# 目次は下記 2 つのマーカー行の間に書き込まれる。
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readme_path="$repository_root/README.md"
begin_marker="<!-- index:begin -->"
end_marker="<!-- index:end -->"

generate_index() {
  local total_count
  total_count=$(find "$repository_root" -mindepth 2 -name '*.md' \
    -not -path "$repository_root/.git/*" \
    -not -path "$repository_root/templates/*" | wc -l | tr -d ' ')
  echo "現在 ${total_count} 件。"
  echo

  local topic_directory topic_name article_path article_title
  for topic_directory in "$repository_root"/*/; do
    topic_name="$(basename "$topic_directory")"
    case "$topic_name" in scripts|templates|.git|.github) continue ;; esac
    [ -n "$(find "$topic_directory" -maxdepth 1 -name '*.md' -print -quit)" ] || continue

    echo "### $topic_name"
    echo
    for article_path in "$topic_directory"*.md; do
      # 本文 1 行目の `# ` 見出しをタイトルとして使う
      article_title="$(head -n 1 "$article_path" | sed 's/^#\{1,\} *//')"
      echo "- [$article_title](./$topic_name/$(basename "$article_path"))"
    done
    echo
  done
}

index_body="$(generate_index)"

awk -v begin_marker="$begin_marker" \
    -v end_marker="$end_marker" \
    -v index_body="$index_body" '
  $0 == begin_marker { print; print ""; print index_body; inside = 1; next }
  $0 == end_marker   { inside = 0 }
  !inside            { print }
' "$readme_path" > "$readme_path.tmp"

mv "$readme_path.tmp" "$readme_path"
echo "目次を更新しました: $readme_path"
