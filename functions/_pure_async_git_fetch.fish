function _pure_async_git_fetch
    if set -q _pure_git_async_fetch_running
        return 0
    end

    set -l working_tree $argv[1]

    pushd $working_tree
    if [ ! (command git rev-parse --abbrev-ref @'{u}' ^ /dev/null) ]
        popd
        return 0
    end

    set -l git_fetch_required no

    if [ -e .git/FETCH_HEAD ]
        set -l last_fetch_timestamp (command stat -c "%Y" .git/FETCH_HEAD)
        set -l current_timestamp (_pure_timestamp)
        set -l time_since_last_fetch (math "$current_timestamp - $last_fetch_timestamp")
        if [ $time_since_last_fetch -gt 1800 ]
            set git_fetch_required yes
        end
    else
        set git_fetch_required yes
    end

    if test $git_fetch_required = no
        popd
        return 0
    end

    set -l cmd "env GIT_TERMINAL_PROMPT=0 git -c gc.auto=0 fetch > /dev/null ^ /dev/null"
    _pure_unique_async_job "_pure_async_git_fetch_running" _pure_update_prompt $cmd

    popd
end
