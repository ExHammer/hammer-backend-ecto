defmodule Hammer.Backend.Ecto do
  @moduledoc """
  An Ecto backend for Hammer

  The public API of this module is used by Hammer to store information about rate-limit 'buckets'.
  A bucket is identified by a `key`, which is a tuple `{bucket_number, id}`.
  The essential schema of a bucket is: `{key, count, created_at, updated_at}`, although backends
  are free to store and retrieve this data in whichever way they wish.

  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Hammer.Repo, []),
    ]

    opts = [strategy: :one_for_one, name: Hammer.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
