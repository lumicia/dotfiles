#!/bin/bash
blue='\033[1;34m'
green='\033[1;32m'
red='\033[1;31m'
yellow='\033[1;33m'
endcolor='\033[0m'

# 获取当前目录下的所有子目录
for repo_dir in */; do
    # 检查是否为 Git 仓库
    if [ -d "$repo_dir/.git" ]; then
        echo -e "${yellow}----- Processing repository: $repo_dir -----${endcolor}"
        cd "$repo_dir" || continue

        # 检查是否已配置 upstream
        if ! git remote | grep -q upstream; then
            echo "${red}----- Upstream not configured in $repo_dir. Skipping... -----${endcolor}"
            cd ..
            continue
        fi

        # 获取主分支名称（master 或 main）
        default_branch=$(git remote show origin | awk '/HEAD branch/ {print $3}')
        if [ -z "$default_branch" ]; then
            echo "${red}----- Failed to detect default branch in $repo_dir. Skipping... -----${endcolor}"
            cd ..
            continue
        fi

        echo "----- Detected default branch: $default_branch -----"

        # 切换到主分支
        git checkout "$default_branch" || {
            echo "${red}----- Failed to checkout $default_branch in $repo_dir. Skipping... -----${endcolor}"
            cd ..
            continue
        }

        # 拉取 upstream 更新
        git pull upstream "$default_branch" || {
            echo "${red}----- Failed to pull from upstream in $repo_dir. Skipping... -----${endcolor}"
            cd ..
            continue
        }

        # 推送到 origin（GitHub 上的 fork 库）
        git push origin "$default_branch" || {
            echo "${red}----- Failed to push to origin in $repo_dir. Skipping... -----${endcolor}"
            cd ..
            continue
        }

        echo "${green}----- Successfully updated $repo_dir -----${endcolor}"
        cd ..
    fi
done

echo "${blue}----- Finished updating -----${endcolor}"
