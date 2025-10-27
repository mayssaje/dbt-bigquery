{% macro notify_run_end() %}
    {% set total_models = run_results | length %}
    {% set pass_models = run_results | selectattr("status", "equalto", "success") | list | length %}
    {% set error_models = run_results | selectattr("status", "equalto", "error") | list | length %}
    {% set warn_models = run_results | selectattr("status", "equalto", "warn") | list | length %}
    {% set execution_status = "completed" if error_models == 0 else "failed" %}
    {% set end_time = modules.datetime.datetime.utcnow() %}
    {% set run_id = run_started_at.strftime('%Y%m%d_%H%M%S') %}

    {% set query %}
        INSERT INTO monitoring.details_execution (
            model_name,
            status,
            started_at,
            finished_at,
            duration_seconds,
            run_id,
            environment,
            user,
            project_name,
            models_success,
            models_failed,
            total_models,
            execution_status,
            error_message
        )
        VALUES (
            'dbt_run',
            '{{ execution_status }}',
            '{{ run_started_at }}',
            '{{ end_time }}',
            TIMESTAMP_DIFF('{{ end_time }}', '{{ run_started_at }}', SECOND),
            '{{ run_id }}',
            '{{ target.name }}',
            '{{ env_var("USER", "unknown") }}',
            '{{ target.project }}',
            {{ pass_models }},
            {{ error_models }},
            {{ total_models }},
            '{{ execution_status }}',
            NULL
        )
    {% endset %}

    {% do log("📊 Sending run completion notification...", info=True) %}
    {% do run_query(query) %}
{% endmacro %}
