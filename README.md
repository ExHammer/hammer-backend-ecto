# Hammer.Backend.Ecto

[![Build Status](https://github.com/ExHammer/hammer-backend-ecto/actions/workflows/ci.yml/badge.svg)](https://github.com/ExHammer/hammer-backend-ecto/actions/workflows/ci.yml) [![Hex.pm](https://img.shields.io/hexpm/v/hammer_backend_ecto.svg)](https://hex.pm/packages/hammer_backend_ecto) [![Documentation](https://img.shields.io/badge/documentation-gray)](https://hexdocs.pm/hammer_backend_ecto)

Ecto backend for the [Hammer](https://github.com/ExHammer/hammer) rate-limiter.

## Installation

Hammer-backend-ecto
is [available in Hex](https://hex.pm/packages/hammer_backend_ecto), the package
can be installed by adding `hammer_backend_ecto` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:hammer_backend_ecto, "~> 0.1.0"}]
end
```

## Usage

```elixir
      worker(Hammer.Backend.Ecto, [[expiry_ms: 1000 * 60 * 2]]),
```

See the [Hammer Tutorial](https://hexdocs.pm/hammer/tutorial.html#content) for more.

## Documentation

On hexdocs: [https://hexdocs.pm/hammer_backend_ecto/api-reference.html](https://hexdocs.pm/hammer_backend_redis/api-reference.html)
