defmodule Hammer.Backend.Ecto do
  @moduledoc """
  An Ecto backend for Hammer

  The public API of this module is used by Hammer to store information about rate-limit 'buckets'.
  A bucket is identified by a `key`, which is a tuple `{bucket_number, id}`.
  The essential schema of a bucket is: `{key, count, created_at, updated_at}`, although backends
  are free to store and retrieve this data in whichever way they wish.

  """

  use GenServer
  alias Hammer.Utils

  ## Public API

  def start do
    start([])
  end

  def start(args) do
    GenServer.start(__MODULE__, args, name: __MODULE__)
  end

  def start_link do
    start_link([])
  end

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def stop do
    GenServer.call(__MODULE__, :stop)
  end

  @doc """
  Record a hit in the bucket identified by `key`
  """
  @spec count_hit(key :: {bucket :: integer, id :: String.t()}, now :: integer) ::
          {:ok, count :: integer}
          | {:error, reason :: any}
  def count_hit(key, now) do
    GenServer.call(__MODULE__, {:count_hit, key, now})
  end

  @doc """
  Retrieve information about the bucket identified by `key`
  """
  @spec get_bucket(key :: {bucket :: integer, id :: String.t()}) ::
          {:ok,
           {key :: {bucket :: integer, id :: String.t()}, count :: integer, created :: integer,
            updated :: integer}}
          | {:ok, nil}
          | {:error, reason :: any}
  def get_bucket(key) do
    GenServer.call(__MODULE__, {:get_bucket, key})
  end

  @doc """
  Delete all buckets associated with `id`.
  """
  @spec delete_buckets(id :: String.t()) ::
          {:ok, count_deleted :: integer}
          | {:error, reason :: any}
  def delete_buckets(id) do
    GenServer.call(__MODULE__, {:delete_buckets, id})
  end

  ## GenServer Callbacks

  def init(args) do
  end

  def handle_call(:stop, _from, state) do
    {:stop, :normal, :ok, state}
  end

  def handle_call({:count_hit, key, now}, _from, state) do
  end

  def handle_call({:get_bucket, key}, _from, state) do
  end

  def handle_call({:delete_buckets, id}, _from, state) do
  end

  def handle_info(:prune, state) do
  end
end
