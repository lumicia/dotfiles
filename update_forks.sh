#!/bin/bash

# 获取当前目录下的所有子目录
for repo_dir in */; do
    # 检查是否为 Git 仓库
    if [ -d "$repo_dir/.git" ]; then
        echo "----- Processing repository: $repo_dir -----"
        cd "$repo_dir" || continue

        # 检查是否已配置 upstream
        if ! git remote | grep -q upstream; then
            echo "----- Upstream not configured in $repo_dir. Skipping... -----"
            cd ..
            continue
        fi

        # 获取主分支名称（master 或 main）
        default_branch=$(git remote show origin | awk '/HEAD branch/ {print $3}')
        if [ -z "$default_branch" ]; then
            echo "----- Failed to detect default branch in $repo_dir. Skipping... -----"
            cd ..
            continue
        fi

        echo "----- Detected default branch: $default_branch -----"

        # 切换到主分支
        git checkout "$default_branch" || {
            echo "----- Failed to checkout $default_branch in $repo_dir. Skipping... -----"
            cd ..
            continue
        }

        # 拉取 upstream 更新
        git pull upstream "$default_branch" || {
            echo "----- Failed to pull from upstream in $repo_dir. Skipping... -----"
            cd ..
            continue
        }

        # 推送到 origin（GitHub 上的 fork 库）
        git push origin "$default_branch" || {
            echo "----- Failed to push to origin in $repo_dir. Skipping... -----"
            cd ..
            continue
        }

        echo "----- Successfully updated $repo_dir -----"
        cd ..
    fi
done
