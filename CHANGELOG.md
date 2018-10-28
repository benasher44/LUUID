# CHANGELOG

The changelog for `LUUID`. Also see the [releases](https://github.com/benasher44/LUUID/releases) on GitHub.

------

1.0.0
-----

This is the initial release of `LUUID`. This release contains only the `LUUID` `struct`, which is a drop-in replacement for `Swift.UUID`. The only difference is that `LUUID` uses lowercase characters instead of uppercase characters for its `String` representation (including for `Encodable`). This makes `LUUID` comply with the [UUID RFC](https://www.ietf.org/rfc/rfc4122.txt).