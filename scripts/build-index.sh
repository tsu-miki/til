#!/usr/bin/env bash
# README.md の目次セクションと月次まとめ一覧を、実ファイルから生成して置き換える。
# それぞれ下記マーカー行の間に書き込まれる。
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readme_path="$repository_root/README.md"
begin_marker="<!-- index:begin -->"
end_marker="<!-- index:end -->"
monthly_begin_marker="<!-- monthly:begin -->"
monthly_end_marker="<!-- monthly:end -->"
# 月次まとめは TIL ではないので、目次の件数・トピック一覧には含めない
monthly_directory_name="monthly"

# 本文 1 行目の `# ` 見出しをタイトルとして使う
title_of() {
  head -n 1 "$1" | sed 's/^#\{1,\} *//'
}

generate_index() {
  local total_count
  total_count=$(find "$repository_root" -mindepth 2 -name '*.md' \
    -not -path "$repository_root/.git/*" \
    -not -path "$repository_root/templates/*" \
    -not -path "$repository_root/$monthly_directory_name/*" | wc -l | tr -d ' ')
  echo "現在 ${total_count} 件。"
  echo

  local topic_directory topic_name article_path
  for topic_directory in "$repository_root"/*/; do
    topic_name="$(basename "$topic_directory")"
    case "$topic_name" in
      scripts|templates|.git|.github|"$monthly_directory_name") continue ;;
    esac
    [ -n "$(find "$topic_directory" -maxdepth 1 -name '*.md' -print -quit)" ] || continue

    echo "### $topic_name"
    echo
    for article_path in "$topic_directory"*.md; do
      echo "- [$(title_of "$article_path")](./$topic_name/$(basename "$article_path"))"
    done
    echo
  done
}

generate_monthly_index() {
  local monthly_directory="$repository_root/$monthly_directory_name"
  [ -d "$monthly_directory" ] || return 0
  [ -n "$(find "$monthly_directory" -maxdepth 1 -name '*.md' -print -quit)" ] || return 0

  # 新しい月が上に来るようにファイル名の降順で並べる
  local summary_path
  while IFS= read -r summary_path; do
    echo "- [$(title_of "$summary_path")](./$monthly_directory_name/$(basename "$summary_path"))"
  done < <(find "$monthly_directory" -maxdepth 1 -name '*.md' | sort -r)
}

index_body="$(generate_index)"
monthly_body="$(generate_monthly_index)"

awk -v begin_marker="$begin_marker" \
    -v end_marker="$end_marker" \
    -v monthly_begin_marker="$monthly_begin_marker" \
    -v monthly_end_marker="$monthly_end_marker" \
    -v index_body="$index_body" \
    -v monthly_body="$monthly_body" '
  $0 == begin_marker         { print; print ""; print index_body; inside = 1; next }
  $0 == monthly_begin_marker { print; print ""; print monthly_body; inside = 1; next }
  $0 == end_marker           { inside = 0 }
  $0 == monthly_end_marker   { inside = 0 }
  !inside                    { print }
' "$readme_path" > "$readme_path.tmp"

mv "$readme_path.tmp" "$readme_path"
echo "目次を更新しました: $readme_path"
