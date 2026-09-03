# Finding files by permission with `find -perm`

This example supplements RH124 chapter 14, section 5 (locating files with
`find`). That is RHCSA-1.8, and it is also where RHCSA-6.5 (diagnosing file
permission problems) starts.

## What you will learn

`find -perm` accepts octal modes, and the prefix character changes the test
from "exactly" to "at least" to "any of". The two examples below show the
difference between `-324` and `/442`.

```console
$ find /home -perm -324
$ find /home -perm /442
```

Both use `find` with octal permission modes — digit order is **owner / group /
other**, and each digit sums r=4, w=2, x=1.

## `-perm -324` — "at least these bits"

The leading `-` means: **all** of these bits must be set (other bits may also
be set).

- `3` (owner) = 2+1 = **write + execute**
- `2` (group) = **write**
- `4` (other) = **read**

So it finds files where the owner can write and enter/execute, the group can
write, and others can read — regardless of anything extra like setgid or
owner-read.

### Matches

| Mode | Why |
| --- | --- |
| `0324` (`-wx-w-r--`) | Exactly the required bits, nothing more |
| `0724` (`rwx-w-r--`) | Owner-read is extra — allowed, the required bits are all there |
| `0374` (`-wx-wrwx`) | Extra bits on group/other don't disqualify |
| `2725` (`-wsws-r-x`) | Setgid (2000) + extra bits; required bits all present |
| `1777` (`rwxrwxrwx`) | World-writable still matches — it contains `wx-w-r--` |

### No matches

| Mode | Why it fails |
| --- | --- |
| `0644` (`rw-r--r--`) | Owner lacks execute (3 needs w**x**) |
| `0304` (`-wx---r--`) | Group write bit (2) missing |
| `0320` (`-wx-w----`) | Other-read bit (4) missing |
| `0344` (`-wxr--r--`) | Group has read instead of **write** |
| `0424` (`r---w-r--`) | Owner has read instead of **write** (and no execute) |

## `-perm /442` — "any of these bits"

The leading `/` means: **at least one** of these bits must be set.

- `4` (owner) = **read**
- `4` (group) = **read**
- `2` (other) = **write**

So it finds files readable by owner, *or* readable by group, *or* writable by
others — an OR test.

### Matches

| Mode | Why |
| --- | --- |
| `0400` (`r--------`) | Owner-read alone satisfies it |
| `0040` (`----r-----`) | Group-read alone satisfies it |
| `0002` (`-------w-`) | Other-write alone satisfies it |
| `0444` (`r--r--r--`) | Both read bits set |
| `6600` (`rwS-S---`) | Setuid/setgid junk plus owner+group read — matches via the read bits |

### No matches

| Mode | Why it fails |
| --- | --- |
| `0200` (`-w-------`) | Only owner-write; none of owner-read / group-read / other-write present |
| `0030` (`---wx----`) | Group has write+execute but not **read** |
| `0211` (`-w---x--x`) | Owner-write only; group lacks read; other lacks write |
| `0000` (`----------`) | No bits at all |
| `0020` (`----w----`) | Group-write only — group **read** is what `/442` asks for |

## The mental model

- `-` is a logical **AND** over the listed bits: "must have all".
- `/` is a logical **OR**: "must have at least one".
- The third form, with no prefix (e.g. `-perm 324`), means *exactly* these bits
  and nothing else — `0724` would fail an exact `324` test even though it
  passes `-324`.
