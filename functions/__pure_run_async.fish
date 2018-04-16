function __pure_run_async
  set -l job_unique_flag $argv[1]
  if set -q $job_unique_flag
    return 0
  end

  set -l callback_function $argv[2]
  set -l cmd $argv[3]
  set -l async_job_result _async_job_result_(random)
  set -g $job_unique_flag
  set -U $async_job_result "…"

  fish -c "set -U $async_job_result (eval $cmd)" &

  set -l pid (jobs --last --pid)

  function _async_job_$pid -v $async_job_result -V pid -V async_job_result -V callback_function -V job_unique_flag
    set -e $job_unique_flag
    eval $callback_function $$async_job_result
    functions -e _async_job_$pid
    set -e $async_job_result
  end
end
