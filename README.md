# LUUID

[![Build Status](https://travis-ci.org/benasher44/LUUID.svg?branch=master)](https://travis-ci.org/benasher44/LUUID) [![codecov](https://codecov.io/gh/benasher44/LUUID/branch/master/graph/badge.svg)](https://codecov.io/gh/benasher44/LUUID)

Clone of (and drop-in replacement for) `Swift.UUID`, but `LUUID.uuidString` returns a lowercase string to conform to UUID RFC

## Modifications (compared to `Swift.UUID`)

- `LUUID` uses `Hashable.hash(into:)` and therefore requires Swift 4.2+. This also means that `UUID` and `LUUID` do not have the same `hashValue`.
- `LUUID` is not convertible to `NSUUID` via `as` due lack of support for implementing this outside of the Swift standard library.
