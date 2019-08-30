defmodule Bookworm.ReleaseTasks do
  @moduledoc """
  Provides the ability run mix tasks on release after build
  """
  @repos Application.get_env(:bookworm, :ecto_repos, [])

  @start_apps [
    :crypto,
    :ssl,
    :postgrex,
    :ecto,
    # If using Ecto 3.0 or higher
    :ecto_sql
  ]

  def migrate do
    start_services()

    run_migrations()

    stop_services()
  end

  def rollback(repo, version) do
    start_services()

    Ecto.Migrator.with_repo(repo, fn repo -> Ecto.Migrator.run(repo, :down, to: version) end)

    stop_services()
  end

  def seed do
    start_services()

    run_seeds()

    stop_services()
  end

  defp run_migrations do
    Enum.each(@repos, &run_migrations_for/1)
  end

  defp run_migrations_for(repo) do
    Ecto.Migrator.with_repo(repo, fn repo -> Ecto.Migrator.run(repo, :up, all: true) end)
  end

  defp run_seeds do
    Enum.each(@start_apps, fn app -> Application.ensure_all_started(app) end)

    Enum.each(@repos, fn repo -> repo.start_link end)

    Enum.each(@repos, &run_seeds_for/1)
  end

  defp run_seeds_for(repo) do
    # Run the seed script if it exists
    seed_script = priv_path_for(repo, "seeds.exs")

    if File.exists?(seed_script) do
      Code.eval_file(seed_script)
    end
  end

  defp priv_path_for(repo, filename) do
    app = Keyword.get(repo.config(), :otp_app)

    repo_underscore =
      repo
      |> Module.split()
      |> List.last()
      |> Macro.underscore()

    priv_dir = "#{:code.priv_dir(app)}"

    Path.join([priv_dir, repo_underscore, filename])
  end

  defp start_services do
    Application.load(:bookworm)
  end

  defp stop_services do
    Application.stop(:bookworm)
  end
end
